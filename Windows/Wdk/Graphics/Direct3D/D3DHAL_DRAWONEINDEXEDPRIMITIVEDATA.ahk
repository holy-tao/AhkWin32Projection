#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Graphics\Direct3D9\D3DPRIMITIVETYPE.ahk
#Include ..\..\..\Win32\Graphics\Direct3D9\D3DVERTEXTYPE.ahk
#Include ..\..\..\Win32\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DHAL_DRAWONEINDEXEDPRIMITIVEDATA extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    dwhContext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {D3DPRIMITIVETYPE}
     */
    PrimitiveType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {D3DVERTEXTYPE}
     */
    VertexType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwFVFControl {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpvVertices {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwNumVertices {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<Integer>}
     */
    lpwIndices {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwNumIndices {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {HRESULT}
     */
    ddrval {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }
}
