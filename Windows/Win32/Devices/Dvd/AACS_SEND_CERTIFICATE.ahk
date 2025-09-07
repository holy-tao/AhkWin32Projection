#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\AACS_CERTIFICATE.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class AACS_SEND_CERTIFICATE extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {AACS_CERTIFICATE}
     */
    Certificate{
        get {
            if(!this.HasProp("__Certificate"))
                this.__Certificate := AACS_CERTIFICATE(this.ptr + 8)
            return this.__Certificate
        }
    }
}
