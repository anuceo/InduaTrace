using Test
using JSON
using JSONSchema

const SCHEMA_DIR = normpath(joinpath(@__DIR__, "..", "schemas"))
const VALID_DIR = joinpath(SCHEMA_DIR, "examples", "valid")
const INVALID_DIR = joinpath(SCHEMA_DIR, "examples", "invalid")

const SCHEMA_NAMES = [
    "source",
    "artifact",
    "inscription",
    "sign",
    "trace",
    "match",
    "evidence",
    "hypothesis",
]

@testset "Schema validation" begin
    for name in SCHEMA_NAMES
        @testset "$name" begin
            schema = Schema(read(joinpath(SCHEMA_DIR, "$name.json"), String))

            valid_data = JSON.parsefile(joinpath(VALID_DIR, "$name.json"))
            invalid_data = JSON.parsefile(joinpath(INVALID_DIR, "$name.json"))

            @test isvalid(schema, valid_data)
            @test !isvalid(schema, invalid_data)
        end
    end
end
