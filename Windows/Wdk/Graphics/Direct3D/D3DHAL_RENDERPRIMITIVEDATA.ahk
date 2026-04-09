#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Graphics\DirectDraw\IDirectDrawSurface.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DHAL_RENDERPRIMITIVEDATA extends Win32Struct {
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
    dwOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {IDirectDrawSurface}
     */
    lpExeBuf {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwTLOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {IDirectDrawSurface}
     */
    lpTLBuf {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer}
     */
    diInstruction {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {HRESULT}
     */
    ddrval {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
