#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class WIN_SPUB_TRUSTED_PUBLISHER_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    hClientToken{
        get {
            if(!this.HasProp("__hClientToken"))
                this.__hClientToken := HANDLE(this.ptr + 0)
            return this.__hClientToken
        }
    }

    /**
     * @type {Pointer<WIN_CERTIFICATE>}
     */
    lpCertificate {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
