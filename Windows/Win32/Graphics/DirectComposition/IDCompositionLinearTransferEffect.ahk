#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionFilterEffect.ahk" { IDCompositionFilterEffect }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IDCompositionAnimation.ahk" { IDCompositionAnimation }

/**
 * The linear transfer effect is used to map the color intensities of an image using a linear function created from a list of values you provide for each channel.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionlineartransfereffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionLinearTransferEffect extends IDCompositionFilterEffect {
    /**
     * The interface identifier for IDCompositionLinearTransferEffect
     * @type {Guid}
     */
    static IID := Guid("{4305ee5b-c4a0-4c88-9385-67124e017683}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionLinearTransferEffect interfaces
    */
    struct Vtbl extends IDCompositionFilterEffect.Vtbl {
        SetRedYIntercept    : IntPtr
        SetRedYIntercept1   : IntPtr
        SetRedSlope         : IntPtr
        SetRedSlope1        : IntPtr
        SetRedDisable       : IntPtr
        SetGreenYIntercept  : IntPtr
        SetGreenYIntercept1 : IntPtr
        SetGreenSlope       : IntPtr
        SetGreenSlope1      : IntPtr
        SetGreenDisable     : IntPtr
        SetBlueYIntercept   : IntPtr
        SetBlueYIntercept1  : IntPtr
        SetBlueSlope        : IntPtr
        SetBlueSlope1       : IntPtr
        SetBlueDisable      : IntPtr
        SetAlphaYIntercept  : IntPtr
        SetAlphaYIntercept1 : IntPtr
        SetAlphaSlope       : IntPtr
        SetAlphaSlope1      : IntPtr
        SetAlphaDisable     : IntPtr
        SetClampOutput      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionLinearTransferEffect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the Y-intercept of the linear function for the red channel. (overload 1/2)
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setredyintercept(float)
     */
    SetRedYIntercept(animation) {
        result := ComCall(4, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the Y-intercept of the linear function for the red channel. (overload 1/2)
     * @param {Float} redYIntercept Type: <b>float</b>
     * 
     * The Y-intercept of the linear function for the red channel.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setredyintercept(float)
     */
    SetRedYIntercept1(redYIntercept) {
        result := ComCall(5, this, "float", redYIntercept, "HRESULT")
        return result
    }

    /**
     * Sets the slope of the linear function for the red channel. (overload 2/2)
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setredslope(float)
     */
    SetRedSlope(animation) {
        result := ComCall(6, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the slope of the linear function for the red channel. (overload 2/2)
     * @param {Float} redSlope Type: <b>float</b>
     * 
     * The slope of the linear function for the red channel.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setredslope(float)
     */
    SetRedSlope1(redSlope) {
        result := ComCall(7, this, "float", redSlope, "HRESULT")
        return result
    }

    /**
     * Specifies whether to apply the transfer function to the red channel. (IDCompositionLinearTransferEffect.SetRedDisable)
     * @param {BOOL} redDisable Type: <b>BOOL</b>
     * 
     * A boolean value that specifies whether to apply the transfer function to the red channel.
     *             If you set this to TRUE the effect does not apply the transfer function to the red channel. If you set this to FALSE the effect applies the RedLinearTransfer function to the red channel.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setreddisable
     */
    SetRedDisable(redDisable) {
        result := ComCall(8, this, BOOL, redDisable, "HRESULT")
        return result
    }

    /**
     * Sets the Y-intercept of the linear function for the green channel.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation that represents how the Y-intercept of the linear function for the green channel changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setgreenyintercept(idcompositionanimation)
     */
    SetGreenYIntercept(animation) {
        result := ComCall(9, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the Y-intercept of the linear function for the green channel.
     * @param {Float} greenYIntercept 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setgreenyintercept(idcompositionanimation)
     */
    SetGreenYIntercept1(greenYIntercept) {
        result := ComCall(10, this, "float", greenYIntercept, "HRESULT")
        return result
    }

    /**
     * The IDCompositionLinearTransferEffect::SetGreenSlope method sets the slope of the linear function for the green channel.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setgreenslope(float)
     */
    SetGreenSlope(animation) {
        result := ComCall(11, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * The IDCompositionLinearTransferEffect::SetGreenSlope method sets the slope of the linear function for the green channel.
     * @param {Float} greenSlope Type: <b>float</b>
     * 
     * The slope of the linear function for the green channel.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setgreenslope(float)
     */
    SetGreenSlope1(greenSlope) {
        result := ComCall(12, this, "float", greenSlope, "HRESULT")
        return result
    }

    /**
     * The IDCompositionLinearTransferEffect::SetGreenDisable method specifies whether to apply the transfer function to the green channel.
     * @param {BOOL} greenDisable Type: <b>BOOL</b>
     * 
     * A boolean value that specifies whether to apply the transfer function to the green channel.
     *             If you set this to TRUE the effect does not apply the transfer function to the green channel. If you set this to FALSE it applies the GreenLinearTransfer function to the green channel.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setgreendisable
     */
    SetGreenDisable(greenDisable) {
        result := ComCall(13, this, BOOL, greenDisable, "HRESULT")
        return result
    }

    /**
     * The IDCompositionLinearTransferEffect::SetBlueYIntercept(IDCompositionAnimation) method sets the Y-intercept of the linear function for the blue channel.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation that represents how the Y-intercept of the linear function for the blue channel changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setblueyintercept(idcompositionanimation)
     */
    SetBlueYIntercept(animation) {
        result := ComCall(14, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * The IDCompositionLinearTransferEffect::SetBlueYIntercept(IDCompositionAnimation) method sets the Y-intercept of the linear function for the blue channel.
     * @param {Float} blueYIntercept 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setblueyintercept(idcompositionanimation)
     */
    SetBlueYIntercept1(blueYIntercept) {
        result := ComCall(15, this, "float", blueYIntercept, "HRESULT")
        return result
    }

    /**
     * The IDCompositionLinearTransferEffect::SetBlueSlope method sets the slope of the linear function for the blue channel.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setblueslope(float)
     */
    SetBlueSlope(animation) {
        result := ComCall(16, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * The IDCompositionLinearTransferEffect::SetBlueSlope method sets the slope of the linear function for the blue channel.
     * @param {Float} blueSlope Type: <b>float</b>
     * 
     * The slope of the linear function for the Blue channel.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setblueslope(float)
     */
    SetBlueSlope1(blueSlope) {
        result := ComCall(17, this, "float", blueSlope, "HRESULT")
        return result
    }

    /**
     * The IDCompositionLinearTransferEffect::SetBlueDisable method specifies whether to apply the transfer function to the blue channel.
     * @param {BOOL} blueDisable Type: <b>BOOL</b>
     * 
     * A boolean value that specifies whether to apply the transfer function to the blue channel.
     *             If you set this to TRUE the effect does not apply the transfer function to the blue channel. If you set this to FALSE it applies the BlueLinearTransfer function to the blue channel.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setbluedisable
     */
    SetBlueDisable(blueDisable) {
        result := ComCall(18, this, BOOL, blueDisable, "HRESULT")
        return result
    }

    /**
     * Sets the Y-intercept of the linear function for the alpha channel.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setalphayintercept(float)
     */
    SetAlphaYIntercept(animation) {
        result := ComCall(19, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the Y-intercept of the linear function for the alpha channel.
     * @param {Float} alphaYIntercept Type: <b>float</b>
     * 
     * The Y-intercept of the linear function for the alpha channel.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setalphayintercept(float)
     */
    SetAlphaYIntercept1(alphaYIntercept) {
        result := ComCall(20, this, "float", alphaYIntercept, "HRESULT")
        return result
    }

    /**
     * The IDCompositionLinearTransferEffect::SetAlphaSlope method sets the slope of the linear function for the alpha channel.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setalphaslope(float)
     */
    SetAlphaSlope(animation) {
        result := ComCall(21, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * The IDCompositionLinearTransferEffect::SetAlphaSlope method sets the slope of the linear function for the alpha channel.
     * @param {Float} alphaSlope Type: <b>float</b>
     * 
     * The slope of the linear function for the alpha channel.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setalphaslope(float)
     */
    SetAlphaSlope1(alphaSlope) {
        result := ComCall(22, this, "float", alphaSlope, "HRESULT")
        return result
    }

    /**
     * Specifies whether to apply the transfer function to the alpha channel.
     * @param {BOOL} alphaDisable Type: <b>BOOL</b>
     * 
     * A boolean value that specifies whether to apply the transfer function to the alpha channel.
     *             If you set this to TRUE the effect does not apply the transfer function to the Alpha channel. If you set this to FALSE it applies the AlphaLinearTransfer function to the Alpha channel.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setalphadisable
     */
    SetAlphaDisable(alphaDisable) {
        result := ComCall(23, this, BOOL, alphaDisable, "HRESULT")
        return result
    }

    /**
     * The IDCompositionLinearTransferEffect::SetClampOutput method specifies whether the effect clamps color values to between 0 and 1 before the effect passes the values to the next effect in the graph.
     * @param {BOOL} clampOutput Type: <b>BOOL</b>
     * 
     * A boolean value that specifies whether the effect clamps color values to between 0 and 1 before the effect passes the values to the next effect in the graph.
     *             If you set this to TRUE the effect will clamp the values. If you set this to FALSE, the effect will not clamp the color values, but other effects and the output
     *             surface may clamp the values if they are not of high enough precision.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionlineartransfereffect-setclampoutput
     */
    SetClampOutput(clampOutput) {
        result := ComCall(24, this, BOOL, clampOutput, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionLinearTransferEffect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetRedYIntercept := CallbackCreate(GetMethod(implObj, "SetRedYIntercept"), flags, 2)
        this.vtbl.SetRedYIntercept1 := CallbackCreate(GetMethod(implObj, "SetRedYIntercept1"), flags, 2)
        this.vtbl.SetRedSlope := CallbackCreate(GetMethod(implObj, "SetRedSlope"), flags, 2)
        this.vtbl.SetRedSlope1 := CallbackCreate(GetMethod(implObj, "SetRedSlope1"), flags, 2)
        this.vtbl.SetRedDisable := CallbackCreate(GetMethod(implObj, "SetRedDisable"), flags, 2)
        this.vtbl.SetGreenYIntercept := CallbackCreate(GetMethod(implObj, "SetGreenYIntercept"), flags, 2)
        this.vtbl.SetGreenYIntercept1 := CallbackCreate(GetMethod(implObj, "SetGreenYIntercept1"), flags, 2)
        this.vtbl.SetGreenSlope := CallbackCreate(GetMethod(implObj, "SetGreenSlope"), flags, 2)
        this.vtbl.SetGreenSlope1 := CallbackCreate(GetMethod(implObj, "SetGreenSlope1"), flags, 2)
        this.vtbl.SetGreenDisable := CallbackCreate(GetMethod(implObj, "SetGreenDisable"), flags, 2)
        this.vtbl.SetBlueYIntercept := CallbackCreate(GetMethod(implObj, "SetBlueYIntercept"), flags, 2)
        this.vtbl.SetBlueYIntercept1 := CallbackCreate(GetMethod(implObj, "SetBlueYIntercept1"), flags, 2)
        this.vtbl.SetBlueSlope := CallbackCreate(GetMethod(implObj, "SetBlueSlope"), flags, 2)
        this.vtbl.SetBlueSlope1 := CallbackCreate(GetMethod(implObj, "SetBlueSlope1"), flags, 2)
        this.vtbl.SetBlueDisable := CallbackCreate(GetMethod(implObj, "SetBlueDisable"), flags, 2)
        this.vtbl.SetAlphaYIntercept := CallbackCreate(GetMethod(implObj, "SetAlphaYIntercept"), flags, 2)
        this.vtbl.SetAlphaYIntercept1 := CallbackCreate(GetMethod(implObj, "SetAlphaYIntercept1"), flags, 2)
        this.vtbl.SetAlphaSlope := CallbackCreate(GetMethod(implObj, "SetAlphaSlope"), flags, 2)
        this.vtbl.SetAlphaSlope1 := CallbackCreate(GetMethod(implObj, "SetAlphaSlope1"), flags, 2)
        this.vtbl.SetAlphaDisable := CallbackCreate(GetMethod(implObj, "SetAlphaDisable"), flags, 2)
        this.vtbl.SetClampOutput := CallbackCreate(GetMethod(implObj, "SetClampOutput"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetRedYIntercept)
        CallbackFree(this.vtbl.SetRedYIntercept1)
        CallbackFree(this.vtbl.SetRedSlope)
        CallbackFree(this.vtbl.SetRedSlope1)
        CallbackFree(this.vtbl.SetRedDisable)
        CallbackFree(this.vtbl.SetGreenYIntercept)
        CallbackFree(this.vtbl.SetGreenYIntercept1)
        CallbackFree(this.vtbl.SetGreenSlope)
        CallbackFree(this.vtbl.SetGreenSlope1)
        CallbackFree(this.vtbl.SetGreenDisable)
        CallbackFree(this.vtbl.SetBlueYIntercept)
        CallbackFree(this.vtbl.SetBlueYIntercept1)
        CallbackFree(this.vtbl.SetBlueSlope)
        CallbackFree(this.vtbl.SetBlueSlope1)
        CallbackFree(this.vtbl.SetBlueDisable)
        CallbackFree(this.vtbl.SetAlphaYIntercept)
        CallbackFree(this.vtbl.SetAlphaYIntercept1)
        CallbackFree(this.vtbl.SetAlphaSlope)
        CallbackFree(this.vtbl.SetAlphaSlope1)
        CallbackFree(this.vtbl.SetAlphaDisable)
        CallbackFree(this.vtbl.SetClampOutput)
    }
}
