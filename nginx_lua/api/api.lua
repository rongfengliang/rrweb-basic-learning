local json = require("cjson")
function init()
    ngx.req.read_body()
    local body = ngx.req.get_body_data()
    if not body then
        if ngx.req.get_body_file() then
            return nil, "request body did not fit into client body buffer, consider raising 'client_body_buffer_size'"
        else
            return ""
        end
    end
    local res = {
        code = 1,
        message ="ok"
    }
    ngx.log(ngx.ERR, body)
    ngx.say(json.encode(res))
end
return init