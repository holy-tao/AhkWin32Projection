#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_HEAP_PROPERTIES.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_PLACED_RESOURCE_SUPPORT_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Dimension {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D12_HEAP_PROPERTIES}
     */
    DestHeapProperties{
        get {
            if(!this.HasProp("__DestHeapProperties"))
                this.__DestHeapProperties := D3D12_HEAP_PROPERTIES(this.ptr + 8)
            return this.__DestHeapProperties
        }
    }

    /**
     * @type {BOOL}
     */
    Supported{
        get {
            if(!this.HasProp("__Supported"))
                this.__Supported := BOOL(this.ptr + 28)
            return this.__Supported
        }
    }
}
