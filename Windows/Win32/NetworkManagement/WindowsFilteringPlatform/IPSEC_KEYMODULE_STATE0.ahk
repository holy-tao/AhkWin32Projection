#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Stores Internet Protocol Security (IPsec) keying module specific information.
 * @remarks
 * 
 * <b>IPSEC_KEYMODULE_STATE0</b> is a specific implementation of IPSEC_KEYMODULE_STATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_keymodule_state0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_KEYMODULE_STATE0 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The identifier of the keying module.
     * @type {Pointer<Guid>}
     */
    keyModuleKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A byte blob containing opaque keying module specific information.
     * @type {FWP_BYTE_BLOB}
     */
    stateBlob{
        get {
            if(!this.HasProp("__stateBlob"))
                this.__stateBlob := FWP_BYTE_BLOB(8, this)
            return this.__stateBlob
        }
    }
}
