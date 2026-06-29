#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a 32-bit fixed-point number.
 * @remarks
 * To convert between floating-point numbers and <b>DXVA2_Fixed32</b> values, use the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-dxva2fixedtofloat">DXVA2FixedToFloat</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-dxva2floattofixed">DXVA2FloatToFixed</a> functions.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_fixed32
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_Fixed32 {
    #StructPack 4

    Fraction : UInt16

    Value : Int16

    static __New() {
        DefineProp(this.Prototype, 'll', { type: Int32, offset: 0 })
        this.DeleteProp("__New")
    }
}
