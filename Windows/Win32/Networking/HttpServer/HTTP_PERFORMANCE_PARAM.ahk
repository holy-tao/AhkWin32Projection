#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_PERFORMANCE_PARAM_TYPE.ahk" { HTTP_PERFORMANCE_PARAM_TYPE }

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_PERFORMANCE_PARAM {
    #StructPack 8

    Type : HTTP_PERFORMANCE_PARAM_TYPE

    BufferSize : UInt32

    Buffer : IntPtr

}
