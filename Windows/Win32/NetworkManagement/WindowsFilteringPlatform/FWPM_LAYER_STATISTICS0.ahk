#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Stores statistics related to a layer.
 * @remarks
 * <b>FWPM_LAYER_STATISTICS0</b> is a specific implementation of FWPM_LAYER_STATISTICS. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_layer_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWPM_LAYER_STATISTICS0 extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * Type: <b>GUID</b>
     * 
     * Identifier of the layer.
     * @type {Guid}
     */
    layerId {
        get {
            if(!this.HasProp("__layerId"))
                this.__layerId := Guid(0, this)
            return this.__layerId
        }
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of permitted connections.
     * @type {Integer}
     */
    classifyPermitCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of blocked connections.
     * @type {Integer}
     */
    classifyBlockCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of vetoed connections.
     * @type {Integer}
     */
    classifyVetoCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>UINT32</b>
     * @type {Integer}
     */
    numCacheEntries {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
