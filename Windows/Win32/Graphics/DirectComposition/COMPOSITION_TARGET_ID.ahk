#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class COMPOSITION_TARGET_ID extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {LUID}
     */
    displayAdapterLuid{
        get {
            if(!this.HasProp("__displayAdapterLuid"))
                this.__displayAdapterLuid := LUID(this.ptr + 0)
            return this.__displayAdapterLuid
        }
    }

    /**
     * @type {LUID}
     */
    renderAdapterLuid{
        get {
            if(!this.HasProp("__renderAdapterLuid"))
                this.__renderAdapterLuid := LUID(this.ptr + 8)
            return this.__renderAdapterLuid
        }
    }

    /**
     * @type {Integer}
     */
    vidPnSourceId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    vidPnTargetId {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    uniqueId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
