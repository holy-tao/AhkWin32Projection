#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionVisualDebug.ahk

/**
 * Represents one DirectComposition visual in a visual tree.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionvisual3
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionVisual3 extends IDCompositionVisualDebug{
    /**
     * The interface identifier for IDCompositionVisual3
     * @type {Guid}
     */
    static IID => Guid("{2775f462-b6c1-4015-b0be-b3e7d6a4976d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    SetDepthMode(mode) {
        result := ComCall(26, this, "int", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetOffsetZ(animation) {
        result := ComCall(27, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} offsetZ 
     * @returns {HRESULT} 
     */
    SetOffsetZ(offsetZ) {
        result := ComCall(28, this, "float", offsetZ, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetOpacity(animation) {
        result := ComCall(29, this, "ptr", animation, "int")
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
        result := ComCall(30, this, "float", opacity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTransform3D>} transform 
     * @returns {HRESULT} 
     */
    SetTransform(transform) {
        result := ComCall(31, this, "ptr", transform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D_MATRIX_4X4_F>} matrix 
     * @returns {HRESULT} 
     */
    SetTransform(matrix) {
        result := ComCall(32, this, "ptr", matrix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} visible 
     * @returns {HRESULT} 
     */
    SetVisible(visible) {
        result := ComCall(33, this, "int", visible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
