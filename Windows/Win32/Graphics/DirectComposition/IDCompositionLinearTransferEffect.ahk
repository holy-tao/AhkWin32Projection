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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRedYIntercept", "SetRedYIntercept1", "SetRedSlope", "SetRedSlope1", "SetRedDisable", "SetGreenYIntercept", "SetGreenYIntercept1", "SetGreenSlope", "SetGreenSlope1", "SetGreenDisable", "SetBlueYIntercept", "SetBlueYIntercept1", "SetBlueSlope", "SetBlueSlope1", "SetBlueDisable", "SetAlphaYIntercept", "SetAlphaYIntercept1", "SetAlphaSlope", "SetAlphaSlope1", "SetAlphaDisable", "SetClampOutput"]

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setredyintercept(float)
     */
    SetRedYIntercept(animation) {
        result := ComCall(4, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} redYIntercept 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setredyintercept(float)
     */
    SetRedYIntercept1(redYIntercept) {
        result := ComCall(5, this, "float", redYIntercept, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setredslope(float)
     */
    SetRedSlope(animation) {
        result := ComCall(6, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} redSlope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setredslope(float)
     */
    SetRedSlope1(redSlope) {
        result := ComCall(7, this, "float", redSlope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} redDisable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setreddisable
     */
    SetRedDisable(redDisable) {
        result := ComCall(8, this, "int", redDisable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setgreenyintercept(idcompositionanimation)
     */
    SetGreenYIntercept(animation) {
        result := ComCall(9, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} greenYIntercept 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setgreenyintercept(idcompositionanimation)
     */
    SetGreenYIntercept1(greenYIntercept) {
        result := ComCall(10, this, "float", greenYIntercept, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setgreenslope(float)
     */
    SetGreenSlope(animation) {
        result := ComCall(11, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} greenSlope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setgreenslope(float)
     */
    SetGreenSlope1(greenSlope) {
        result := ComCall(12, this, "float", greenSlope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} greenDisable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setgreendisable
     */
    SetGreenDisable(greenDisable) {
        result := ComCall(13, this, "int", greenDisable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setblueyintercept(idcompositionanimation)
     */
    SetBlueYIntercept(animation) {
        result := ComCall(14, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} blueYIntercept 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setblueyintercept(idcompositionanimation)
     */
    SetBlueYIntercept1(blueYIntercept) {
        result := ComCall(15, this, "float", blueYIntercept, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setblueslope(float)
     */
    SetBlueSlope(animation) {
        result := ComCall(16, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} blueSlope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setblueslope(float)
     */
    SetBlueSlope1(blueSlope) {
        result := ComCall(17, this, "float", blueSlope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} blueDisable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setbluedisable
     */
    SetBlueDisable(blueDisable) {
        result := ComCall(18, this, "int", blueDisable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setalphayintercept(float)
     */
    SetAlphaYIntercept(animation) {
        result := ComCall(19, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} alphaYIntercept 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setalphayintercept(float)
     */
    SetAlphaYIntercept1(alphaYIntercept) {
        result := ComCall(20, this, "float", alphaYIntercept, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setalphaslope(float)
     */
    SetAlphaSlope(animation) {
        result := ComCall(21, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} alphaSlope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setalphaslope(float)
     */
    SetAlphaSlope1(alphaSlope) {
        result := ComCall(22, this, "float", alphaSlope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} alphaDisable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setalphadisable
     */
    SetAlphaDisable(alphaDisable) {
        result := ComCall(23, this, "int", alphaDisable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} clampOutput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setclampoutput
     */
    SetClampOutput(clampOutput) {
        result := ComCall(24, this, "int", clampOutput, "HRESULT")
        return result
    }
}
