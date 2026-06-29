#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_FIELD0.ahk" { FWPM_FIELD0 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FWPM_DISPLAY_DATA0.ahk" { FWPM_DISPLAY_DATA0 }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Schema information for a layer.
 * @remarks
 * <b>FWPM_LAYER0</b> is a specific implementation of FWPM_LAYER. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_layer0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_LAYER0 {
    #StructPack 8

    /**
     * Uniquely identifies the layer.
     */
    layerKey : Guid

    /**
     * Allows layers to be annotated in a human-readable form. The [FWPM_DISPLAY_DATA0](/windows/desktop/api/fwptypes/ns-fwptypes-fwpm_display_data0) structure is not <b>NULL</b>.
     */
    displayData : FWPM_DISPLAY_DATA0

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
     */
    flags : UInt32

    /**
     * Number of fields in the layer.
     */
    numFields : UInt32

    /**
     * Schema information for the layer's fields.
     * 
     * See [FWPM_FIELD0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_field0) for more information.
     */
    field : FWPM_FIELD0.Ptr

    /**
     * Sublayer used when a filter is added with a null sublayer.
     */
    defaultSubLayerKey : Guid

    /**
     * LUID that identifies this layer.
     */
    layerId : UInt16

}
