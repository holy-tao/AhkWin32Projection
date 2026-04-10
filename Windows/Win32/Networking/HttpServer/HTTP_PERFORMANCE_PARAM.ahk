#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_PERFORMANCE_PARAM_TYPE.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_PERFORMANCE_PARAM extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HTTP_PERFORMANCE_PARAM_TYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Void>}
     */
    Buffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
