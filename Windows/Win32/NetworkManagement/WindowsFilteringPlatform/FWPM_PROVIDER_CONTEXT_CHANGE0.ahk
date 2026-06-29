#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWPM_CHANGE_TYPE.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Change notification dispatched to subscribers. (FWPM_PROVIDER_CONTEXT_CHANGE0)
 * @remarks
 * <b>FWPM_PROVIDER_CONTEXT_CHANGE0</b> is a specific implementation of FWPM_PROVIDER_CONTEXT_CHANGE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context_change0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWPM_PROVIDER_CONTEXT_CHANGE0 extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * Type of change.
     * 
     * See [FWPM_CHANGE_TYPE](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_change_type) for more information.
     * @type {FWPM_CHANGE_TYPE}
     */
    changeType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * GUID of the provider context that changed.
     * @type {Guid}
     */
    providerContextKey {
        get {
            if(!this.HasProp("__providerContextKey"))
                this.__providerContextKey := Guid(4, this)
            return this.__providerContextKey
        }
    }

    /**
     * LUID of the provider context that changed.
     * @type {Integer}
     */
    providerContextId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
