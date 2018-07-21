module StringBuilders

export StringBuilder

const _init_string = ""

mutable struct StringBuilder
    buffer::IOBuffer
    as_string::String

    function StringBuilder()
        return new(IOBuffer(), _init_string)
    end
end

function Base.String(sb::StringBuilder)
    if isempty(sb.as_string)
        sb.as_string = String(take!(sb.buffer))
    end
    return sb.as_string
end

function Base.append!(sb::StringBuilder, s::AbstractString)
    if !isempty(sb.as_string)
        print(sb.buffer, sb.as_string)
        sb.as_string = _init_string
    end
    print(sb.buffer, s)
end

function Base.append!(sb::StringBuilder, ss::AbstractString...)
    for s in ss
        append!(sb, s)
    end
end

end # module
