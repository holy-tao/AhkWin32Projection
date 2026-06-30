#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWPM_LAYER_STATISTICS1 extends Win32Struct {
    static sizeof => 40

    static packingSize => 4

    /**
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
     * @type {Integer}
     */
    classifyPermitCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    classifyBlockCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    classifyVetoCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    numCacheEntries {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    filterCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    totalFilterSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
