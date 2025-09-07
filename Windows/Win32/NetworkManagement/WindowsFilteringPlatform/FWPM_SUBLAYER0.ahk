#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWPM_DISPLAY_DATA0.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Stores the state associated with a sublayer.
 * @remarks
 * <b>FWPM_SUBLAYER0</b> is a specific implementation of FWPM_SUBLAYER. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_sublayer0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_SUBLAYER0 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Uniquely identifies the sublayer. See <a href="https://docs.microsoft.com/windows/desktop/FWP/management-filtering-sublayer-identifiers">Filtering Sublayer Identifiers</a> for a list of built-in sublayers.
     * 
     * If the GUID is zero-initialized in the call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayeradd0">FwpmSubLayerAdd0</a>, the Base Filtering Engine (BFE) will generate one.
     * @type {Pointer<Guid>}
     */
    subLayerKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Allows sublayers to be annotated in human-readable form.   The [FWPM_DISPLAY_DATA0](/windows/desktop/api/fwptypes/ns-fwptypes-fwpm_display_data0) structure is required.
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
     * Possible values:
     * 
     * <table>
     * <tr>
     * <th>Sublayer flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_SUBLAYER_FLAG_PERSISTENT"></a><a id="fwpm_sublayer_flag_persistent"></a><dl>
     * <dt><b>FWPM_SUBLAYER_FLAG_PERSISTENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes sublayer to be persistent, surviving across BFE stop/start.
     * 
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
     * Uniquely identifies the provider that manages this sublayer.
     * @type {Pointer<Guid>}
     */
    providerKey {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * An [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) structure that contains optional provider-specific data that allows providers to store additional context info with the object.
     * @type {FWP_BYTE_BLOB}
     */
    providerData{
        get {
            if(!this.HasProp("__providerData"))
                this.__providerData := FWP_BYTE_BLOB(this.ptr + 40)
            return this.__providerData
        }
    }

    /**
     * Weight of the sublayer. 
     * 
     * Higher-weighted sublayers are invoked first.
     * @type {Integer}
     */
    weight {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }
}
