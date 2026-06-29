#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Stores statistics related to a layer.
 * @remarks
 * <b>FWPM_LAYER_STATISTICS0</b> is a specific implementation of FWPM_LAYER_STATISTICS. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_layer_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_LAYER_STATISTICS0 {
    #StructPack 4

    /**
     * Type: <b>GUID</b>
     * 
     * Identifier of the layer.
     */
    layerId : Guid

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of permitted connections.
     */
    classifyPermitCount : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of blocked connections.
     */
    classifyBlockCount : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of vetoed connections.
     */
    classifyVetoCount : UInt32

    /**
     * Type: <b>UINT32</b>
     */
    numCacheEntries : UInt32

}
