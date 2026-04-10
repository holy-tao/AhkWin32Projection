#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Dxgi\Common\DXGI_FORMAT.ahk
#Include .\D3D12_RESOURCE_DIMENSION.ahk
#Include .\D3D12_HEAP_PROPERTIES.ahk
#Include .\D3D12_HEAP_TYPE.ahk
#Include .\D3D12_CPU_PAGE_PROPERTY.ahk
#Include .\D3D12_MEMORY_POOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_FEATURE_DATA_PLACED_RESOURCE_SUPPORT_INFO extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {DXGI_FORMAT}
     */
    Format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_RESOURCE_DIMENSION}
     */
    Dimension {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D12_HEAP_PROPERTIES}
     */
    DestHeapProperties {
        get {
            if(!this.HasProp("__DestHeapProperties"))
                this.__DestHeapProperties := D3D12_HEAP_PROPERTIES(8, this)
            return this.__DestHeapProperties
        }
    }

    /**
     * @type {BOOL}
     */
    Supported {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
