#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXCoreAdapterEngineIndex.ahk

/**
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class DXCoreEngineNamePropertyInput extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {DXCoreAdapterEngineIndex}
     */
    adapterEngineIndex{
        get {
            if(!this.HasProp("__adapterEngineIndex"))
                this.__adapterEngineIndex := DXCoreAdapterEngineIndex(0, this)
            return this.__adapterEngineIndex
        }
    }

    /**
     * @type {Integer}
     */
    engineNameLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    engineName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
