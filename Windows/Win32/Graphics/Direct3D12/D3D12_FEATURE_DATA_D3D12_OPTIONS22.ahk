#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS22 extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    ShaderExecutionReorderingActuallyReorders {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    CreateByteOffsetViewsSupported {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Max1DDispatchSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Max1DDispatchMeshSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
