#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * This effect is used to alter the saturation of an image. The saturation effect is a specialization of the color matrix effect.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionsaturationeffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionSaturationEffect extends IDCompositionFilterEffect{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionSaturationEffect
     * @type {Guid}
     */
    static IID => Guid("{a08debda-3258-4fa4-9f16-9174d3fe93b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSaturation", "SetSaturation1"]

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionsaturationeffect-setsaturation(float)
     */
    SetSaturation(animation) {
        result := ComCall(4, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} ratio 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionsaturationeffect-setsaturation(float)
     */
    SetSaturation1(ratio) {
        result := ComCall(5, this, "float", ratio, "HRESULT")
        return result
    }
}
