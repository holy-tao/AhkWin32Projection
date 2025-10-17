#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DRESOURCESTATS.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDEVINFO_RESOURCEMANAGER extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Array<D3DRESOURCESTATS>}
     */
    stats{
        get {
            if(!this.HasProp("__statsProxyArray"))
                this.__statsProxyArray := Win32FixedArray(this.ptr + 0, 8, D3DRESOURCESTATS, "")
            return this.__statsProxyArray
        }
    }
}
