#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCARD_IO_REQUEST.ahk
#Include .\SCARD_T0_COMMAND.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class SCARD_T0_REQUEST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {SCARD_IO_REQUEST}
     */
    ioRequest{
        get {
            if(!this.HasProp("__ioRequest"))
                this.__ioRequest := SCARD_IO_REQUEST(0, this)
            return this.__ioRequest
        }
    }

    /**
     * @type {Integer}
     */
    bSw1 {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    bSw2 {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {SCARD_T0_COMMAND}
     */
    CmdBytes{
        get {
            if(!this.HasProp("__CmdBytes"))
                this.__CmdBytes := SCARD_T0_COMMAND(10, this)
            return this.__CmdBytes
        }
    }

    /**
     * @type {Array<Byte>}
     */
    rgbHeader{
        get {
            if(!this.HasProp("__rgbHeaderProxyArray"))
                this.__rgbHeaderProxyArray := Win32FixedArray(this.ptr + 10, 5, Primitive, "char")
            return this.__rgbHeaderProxyArray
        }
    }
}
