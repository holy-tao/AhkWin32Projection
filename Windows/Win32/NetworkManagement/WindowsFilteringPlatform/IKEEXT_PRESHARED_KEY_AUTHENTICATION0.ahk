#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Stores information needed for pre-shared key authentication. (IKEEXT_PRESHARED_KEY_AUTHENTICATION0)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_preshared_key_authentication0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_PRESHARED_KEY_AUTHENTICATION0 extends Win32Struct
{
    static sizeof => 16

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
}
