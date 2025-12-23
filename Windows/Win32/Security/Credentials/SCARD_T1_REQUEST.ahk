#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCARD_IO_REQUEST.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class SCARD_T1_REQUEST extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

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
}
