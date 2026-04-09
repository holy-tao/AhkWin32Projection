#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMDT_MONITOR_DESCRIPTOR_TYPE.ahk
#Include .\D3DKMDT_MONITOR_CAPABILITIES_ORIGIN.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_MONITOR_DESCRIPTOR extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {D3DKMDT_MONITOR_DESCRIPTOR_TYPE}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Pointer}
     */
    DataSize {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    pData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {D3DKMDT_MONITOR_CAPABILITIES_ORIGIN}
     */
    Origin {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
