#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Graphics\Direct3D9\D3DINSTRUCTION.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DHAL_RENDERPRIMITIVEDATA extends Win32Struct
{
    static sizeof => 48

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
     * @type {D3DINSTRUCTION}
     */
    diInstruction{
        get {
            if(!this.HasProp("__diInstruction"))
                this.__diInstruction := D3DINSTRUCTION(40, this)
            return this.__diInstruction
        }
    }

    /**
     * @type {HRESULT}
     */
    ddrval {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }
}
