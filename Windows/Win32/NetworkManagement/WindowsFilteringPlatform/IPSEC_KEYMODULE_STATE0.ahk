#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_BYTE_BLOB.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Stores Internet Protocol Security (IPsec) keying module specific information.
 * @remarks
 * <b>IPSEC_KEYMODULE_STATE0</b> is a specific implementation of IPSEC_KEYMODULE_STATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_keymodule_state0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IPSEC_KEYMODULE_STATE0 extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * The identifier of the keying module.
     * @type {Guid}
     */
    keyModuleKey {
        get {
            if(!this.HasProp("__keyModuleKey"))
                this.__keyModuleKey := Guid(0, this)
            return this.__keyModuleKey
        }
    }

    /**
     * A byte blob containing opaque keying module specific information.
     * @type {FWP_BYTE_BLOB}
     */
    stateBlob {
        get {
            if(!this.HasProp("__stateBlob"))
                this.__stateBlob := FWP_BYTE_BLOB(16, this)
            return this.__stateBlob
        }
    }
}
