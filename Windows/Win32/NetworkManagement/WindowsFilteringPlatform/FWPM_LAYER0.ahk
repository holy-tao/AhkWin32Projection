#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWPM_DISPLAY_DATA0.ahk

/**
 * Schema information for a layer.
 * @remarks
 * 
  * <b>FWPM_LAYER0</b> is a specific implementation of FWPM_LAYER. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_layer0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_LAYER0 extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Uniquely identifies the layer.
     * @type {Pointer<Guid>}
     */
    layerKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Allows layers to be annotated in a human-readable form. The [FWPM_DISPLAY_DATA0](/windows/desktop/api/fwptypes/ns-fwptypes-fwpm_display_data0) structure is not <b>NULL</b>.
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
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_LAYER_FLAG_KERNEL"></a><a id="fwpm_layer_flag_kernel"></a><dl>
     * <dt><b>FWPM_LAYER_FLAG_KERNEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Layer classified in kernel-mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_LAYER_FLAG_BUILTIN"></a><a id="fwpm_layer_flag_builtin"></a><dl>
     * <dt><b>FWPM_LAYER_FLAG_BUILTIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Layer built-in. Cannot be deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_LAYER_FLAG_CLASSIFY_MOSTLY"></a><a id="fwpm_layer_flag_classify_mostly"></a><dl>
     * <dt><b>FWPM_LAYER_FLAG_CLASSIFY_MOSTLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Layer optimized for classification rather than enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_LAYER_FLAG_BUFFERED"></a><a id="fwpm_layer_flag_buffered"></a><dl>
     * <dt><b>FWPM_LAYER_FLAG_BUFFERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Layer is buffered.
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
     * Number of fields in the layer.
     * @type {Integer}
     */
    numFields {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Schema information for the layer's fields.
     * 
     * See [FWPM_FIELD0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_field0) for more information.
     * @type {Pointer<FWPM_FIELD0>}
     */
    field {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Sublayer used when a filter is added with a null sublayer.
     * @type {Pointer<Guid>}
     */
    defaultSubLayerKey {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * LUID that identifies this layer.
     * @type {Integer}
     */
    layerId {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }
}
