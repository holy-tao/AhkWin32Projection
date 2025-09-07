#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWPM_DISPLAY_DATA0.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Stores the state associated with a policy provider.
 * @remarks
 * <b>FWPM_PROVIDER0</b> is a specific implementation of FWPM_PROVIDER. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_provider0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_PROVIDER0 extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Uniquely identifies the provider. 
     * 
     * If the GUID is zero-initialized in the
     *    call to Add, Base Filtering Engine (BFE) will generate one.
     * @type {Pointer<Guid>}
     */
    providerKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Allows providers to be annotated in a human-readable form.  The [FWPM_DISPLAY_DATA0](/windows/desktop/api/fwptypes/ns-fwptypes-fwpm_display_data0) structure is required.
     * @type {FWPM_DISPLAY_DATA0}
     */
    displayData{
        get {
            if(!this.HasProp("__displayData"))
                this.__displayData := FWPM_DISPLAY_DATA0(this.ptr + 8)
            return this.__displayData
        }
    }

    /**
     * Bit flags that indicate information about the persistence of the provider.
     * 
     * <table>
     * <tr>
     * <th>Provider flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_PROVIDER_FLAG_PERSISTENT"></a><a id="fwpm_provider_flag_persistent"></a><dl>
     * <dt><b>FWPM_PROVIDER_FLAG_PERSISTENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Provider is persistent.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_PROVIDER_FLAG_DISABLED"></a><a id="fwpm_provider_flag_disabled"></a><dl>
     * <dt><b>FWPM_PROVIDER_FLAG_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Provider's filters were disabled when the BFE started because the provider has no associated Windows service name, or because the associated service was not set to auto-start. 
     * 
     * <div class="alert"><b>Note</b>  This flag cannot be set when adding new providers. It can only be returned by BFE when getting or enumerating providers.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * An [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) structure that contains optional provider-specific data that allows providers to store additional context info with the object.
     * @type {FWP_BYTE_BLOB}
     */
    providerData{
        get {
            if(!this.HasProp("__providerData"))
                this.__providerData := FWP_BYTE_BLOB(this.ptr + 32)
            return this.__providerData
        }
    }

    /**
     * Optional name of the Windows service hosting the provider. This allows
     *    BFE to detect that a provider has been disabled.
     * @type {Pointer<Ptr>}
     */
    serviceName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
