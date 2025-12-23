#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Stores information needed for pre-shared key authentication. (IKEEXT_PRESHARED_KEY_AUTHENTICATION1)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_preshared_key_authentication1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_PRESHARED_KEY_AUTHENTICATION1 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The pre-shared key specified by [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob).
     * @type {FWP_BYTE_BLOB}
     */
    presharedKey{
        get {
            if(!this.HasProp("__presharedKey"))
                this.__presharedKey := FWP_BYTE_BLOB(0, this)
            return this.__presharedKey
        }
    }

    /**
     * 
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
