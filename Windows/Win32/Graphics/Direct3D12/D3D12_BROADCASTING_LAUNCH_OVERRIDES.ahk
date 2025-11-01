#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BROADCASTING_LAUNCH_OVERRIDES extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Pointer<Integer>}
     */
    pLocalRootArgumentsTableIndex {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<BOOL>}
     */
    pProgramEntry {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_NODE_ID>}
     */
    pNewName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<D3D12_NODE_ID>}
     */
    pShareInputOf {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pDispatchGrid {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pMaxDispatchGrid {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    NumOutputOverrides {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer<D3D12_NODE_OUTPUT_OVERRIDES>}
     */
    pOutputOverrides {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
