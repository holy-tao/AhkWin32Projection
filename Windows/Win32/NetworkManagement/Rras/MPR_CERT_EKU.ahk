#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_CERT_EKU extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    IsEKUOID{
        get {
            if(!this.HasProp("__IsEKUOID"))
                this.__IsEKUOID := BOOL(this.ptr + 4)
            return this.__IsEKUOID
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszEKU{
        get {
            if(!this.HasProp("__pwszEKU"))
                this.__pwszEKU := PWSTR(this.ptr + 8)
            return this.__pwszEKU
        }
    }
}
