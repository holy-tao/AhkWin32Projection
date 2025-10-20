#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionEffect.ahk

/**
 * Represents a group of bitmap effects that are applied together to modify the rasterization of a visual's subtree.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositioneffectgroup
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionEffectGroup extends IDCompositionEffect{
    /**
     * The interface identifier for IDCompositionEffectGroup
     * @type {Guid}
     */
    static IID => Guid("{a7929a74-e6b2-4bd6-8b95-4040119ca34d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetOpacity(animation) {
        result := ComCall(3, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} opacity 
     * @returns {HRESULT} 
     */
    SetOpacity(opacity) {
        result := ComCall(4, this, "float", opacity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTransform3D>} transform3D 
     * @returns {HRESULT} 
     */
    SetTransform3D(transform3D) {
        result := ComCall(5, this, "ptr", transform3D, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
