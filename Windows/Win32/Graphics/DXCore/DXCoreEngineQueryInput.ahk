#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXCoreAdapterEngineIndex.ahk

/**
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class DXCoreEngineQueryInput extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {DXCoreAdapterEngineIndex}
     */
    adapterEngineIndex{
        get {
            if(!this.HasProp("__adapterEngineIndex"))
                this.__adapterEngineIndex := DXCoreAdapterEngineIndex(this.ptr + 0)
            return this.__adapterEngineIndex
        }
    }

    /**
     * @type {Integer}
     */
    processId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
