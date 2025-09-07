#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a 32-bit fixed-point number.
 * @remarks
 * To convert between floating-point numbers and <b>DXVA2_Fixed32</b> values, use the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-dxva2fixedtofloat">DXVA2FixedToFloat</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-dxva2floattofixed">DXVA2FloatToFixed</a> functions.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_fixed32
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_Fixed32 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Fraction {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    ll {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
