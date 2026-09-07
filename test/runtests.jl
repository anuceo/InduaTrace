using Test
using IndusTrace

@testset "IndusTrace" begin

    @test IndusTrace.project_version() == v"0.1.0"

end
