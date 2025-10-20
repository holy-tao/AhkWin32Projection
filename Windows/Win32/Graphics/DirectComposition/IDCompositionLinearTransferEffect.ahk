#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The linear transfer effect is used to map the color intensities of an image using a linear function created from a list of values you provide for each channel.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionlineartransfereffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionLinearTransferEffect extends IDCompositionFilterEffect{
    /**
     * The interface identifier for IDCompositionLinearTransferEffect
     * @type {Guid}
     */
    static IID => Guid("{4305ee5b-c4a0-4c88-9385-67124e017683}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetRedYIntercept(animation) {
        result := ComCall(4, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} redYIntercept 
     * @returns {HRESULT} 
     */
    SetRedYIntercept(redYIntercept) {
        result := ComCall(5, this, "float", redYIntercept, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetRedSlope(animation) {
        result := ComCall(6, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} redSlope 
     * @returns {HRESULT} 
     */
    SetRedSlope(redSlope) {
        result := ComCall(7, this, "float", redSlope, "int")
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
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetGreenYIntercept(animation) {
        result := ComCall(9, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} greenYIntercept 
     * @returns {HRESULT} 
     */
    SetGreenYIntercept(greenYIntercept) {
        result := ComCall(10, this, "float", greenYIntercept, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetGreenSlope(animation) {
        result := ComCall(11, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} greenSlope 
     * @returns {HRESULT} 
     */
    SetGreenSlope(greenSlope) {
        result := ComCall(12, this, "float", greenSlope, "int")
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
        result := ComCall(13, this, "int", greenDisable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetBlueYIntercept(animation) {
        result := ComCall(14, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} blueYIntercept 
     * @returns {HRESULT} 
     */
    SetBlueYIntercept(blueYIntercept) {
        result := ComCall(15, this, "float", blueYIntercept, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetBlueSlope(animation) {
        result := ComCall(16, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} blueSlope 
     * @returns {HRESULT} 
     */
    SetBlueSlope(blueSlope) {
        result := ComCall(17, this, "float", blueSlope, "int")
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
        result := ComCall(18, this, "int", blueDisable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetAlphaYIntercept(animation) {
        result := ComCall(19, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} alphaYIntercept 
     * @returns {HRESULT} 
     */
    SetAlphaYIntercept(alphaYIntercept) {
        result := ComCall(20, this, "float", alphaYIntercept, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetAlphaSlope(animation) {
        result := ComCall(21, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} alphaSlope 
     * @returns {HRESULT} 
     */
    SetAlphaSlope(alphaSlope) {
        result := ComCall(22, this, "float", alphaSlope, "int")
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
        result := ComCall(23, this, "int", alphaDisable, "int")
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
        result := ComCall(24, this, "int", clampOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
