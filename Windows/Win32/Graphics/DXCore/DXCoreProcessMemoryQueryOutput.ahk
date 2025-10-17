#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXCoreMemoryUsage.ahk

/**
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class DXCoreProcessMemoryQueryOutput extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {DXCoreMemoryUsage}
     */
    memoryUsage{
        get {
            if(!this.HasProp("__memoryUsage"))
                this.__memoryUsage := DXCoreMemoryUsage(0, this)
            return this.__memoryUsage
        }
    }

    /**
     * @type {Integer}
     */
    processQuerySucceeded {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}
