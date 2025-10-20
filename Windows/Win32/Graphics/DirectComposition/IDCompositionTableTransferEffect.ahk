#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The table transfer effect is used to map the color intensities of an image using a transfer function created from interpolating a list of values you provide.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositiontabletransfereffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionTableTransferEffect extends IDCompositionFilterEffect{
    /**
     * The interface identifier for IDCompositionTableTransferEffect
     * @type {Guid}
     */
    static IID => Guid("{9b7e82e2-69c5-4eb4-a5f5-a7033f5132cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer<Single>} tableValues 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    SetRedTable(tableValues, count) {
        result := ComCall(4, this, "float*", tableValues, "uint", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} tableValues 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    SetGreenTable(tableValues, count) {
        result := ComCall(5, this, "float*", tableValues, "uint", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} tableValues 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    SetBlueTable(tableValues, count) {
        result := ComCall(6, this, "float*", tableValues, "uint", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} tableValues 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    SetAlphaTable(tableValues, count) {
        result := ComCall(7, this, "float*", tableValues, "uint", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} redDisable 
     * @returns {HRESULT} 
     */
    SetRedDisable(redDisable) {
        result := ComCall(8, this, "int", redDisable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} greenDisable 
     * @returns {HRESULT} 
     */
    SetGreenDisable(greenDisable) {
        result := ComCall(9, this, "int", greenDisable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} blueDisable 
     * @returns {HRESULT} 
     */
    SetBlueDisable(blueDisable) {
        result := ComCall(10, this, "int", blueDisable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} alphaDisable 
     * @returns {HRESULT} 
     */
    SetAlphaDisable(alphaDisable) {
        result := ComCall(11, this, "int", alphaDisable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} clampOutput 
     * @returns {HRESULT} 
     */
    SetClampOutput(clampOutput) {
        result := ComCall(12, this, "int", clampOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetRedTableValue(index, animation) {
        result := ComCall(13, this, "uint", index, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    SetRedTableValue(index, value) {
        result := ComCall(14, this, "uint", index, "float", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetGreenTableValue(index, animation) {
        result := ComCall(15, this, "uint", index, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    SetGreenTableValue(index, value) {
        result := ComCall(16, this, "uint", index, "float", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetBlueTableValue(index, animation) {
        result := ComCall(17, this, "uint", index, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    SetBlueTableValue(index, value) {
        result := ComCall(18, this, "uint", index, "float", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetAlphaTableValue(index, animation) {
        result := ComCall(19, this, "uint", index, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    SetAlphaTableValue(index, value) {
        result := ComCall(20, this, "uint", index, "float", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
