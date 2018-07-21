using StringBuilders
using Test

@testset "StringBuilders" begin
    sb = StringBuilder()
    append!(sb, "First string.")
    append!(sb, "Second string.")
    append!(sb, "Third string.")

    s = String(sb)
    @test s == "First string.Second string.Third string."
    s2 = String(sb)
    @test s2 == "First string.Second string.Third string."

    append!(sb, "Fourth string.")
    s3 = String(sb)

    @test s3 == "First string.Second string.Third string.Fourth string."

end

@testset "initialization" begin
    sb = StringBuilder()
    @test isempty(String(sb))
end

