#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAnimationVariableChangeHandler2.ahk" { IUIAnimationVariableChangeHandler2 }
#Import ".\IUIAnimationStoryboard2.ahk" { IUIAnimationStoryboard2 }
#Import ".\IUIAnimationVariableCurveChangeHandler2.ahk" { IUIAnimationVariableCurveChangeHandler2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\UI_ANIMATION_ROUNDING_MODE.ahk" { UI_ANIMATION_ROUNDING_MODE }
#Import ".\IUIAnimationVariableIntegerChangeHandler2.ahk" { IUIAnimationVariableIntegerChangeHandler2 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Graphics\DirectComposition\IDCompositionAnimation.ahk" { IDCompositionAnimation }

/**
 * Defines an animation variable, which represents a visual element that can be animated in multiple dimensions.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationvariable2
 * @namespace Windows.Win32.UI.Animation
 */
export default struct IUIAnimationVariable2 extends IUnknown {
    /**
     * The interface identifier for IUIAnimationVariable2
     * @type {Guid}
     */
    static IID := Guid("{4914b304-96ab-44d9-9e77-d5109b7e7466}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAnimationVariable2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDimension                    : IntPtr
        GetValue                        : IntPtr
        GetVectorValue                  : IntPtr
        GetCurve                        : IntPtr
        GetVectorCurve                  : IntPtr
        GetFinalValue                   : IntPtr
        GetFinalVectorValue             : IntPtr
        GetPreviousValue                : IntPtr
        GetPreviousVectorValue          : IntPtr
        GetIntegerValue                 : IntPtr
        GetIntegerVectorValue           : IntPtr
        GetFinalIntegerValue            : IntPtr
        GetFinalIntegerVectorValue      : IntPtr
        GetPreviousIntegerValue         : IntPtr
        GetPreviousIntegerVectorValue   : IntPtr
        GetCurrentStoryboard            : IntPtr
        SetLowerBound                   : IntPtr
        SetLowerBoundVector             : IntPtr
        SetUpperBound                   : IntPtr
        SetUpperBoundVector             : IntPtr
        SetRoundingMode                 : IntPtr
        SetTag                          : IntPtr
        GetTag                          : IntPtr
        SetVariableChangeHandler        : IntPtr
        SetVariableIntegerChangeHandler : IntPtr
        SetVariableCurveChangeHandler   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAnimationVariable2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of dimensions that the animation variable is to be animated in.
     * @returns {Integer} The number of dimensions.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getdimension
     */
    GetDimension() {
        result := ComCall(3, this, "uint*", &dimension := 0, "HRESULT")
        return dimension
    }

    /**
     * Gets the value of the animation variable.
     * @returns {Float} The value of the animation variable.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getvalue
     */
    GetValue() {
        result := ComCall(4, this, "double*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets the value of the animation variable in the specified dimension.
     * @param {Integer} cDimension The dimension from which to get the value of the animation variable.
     * @returns {Float} The value of the animation variable.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getvectorvalue
     */
    GetVectorValue(cDimension) {
        result := ComCall(5, this, "double*", &value := 0, "uint", cDimension, "HRESULT")
        return value
    }

    /**
     * Gets the animation curve of the animation variable.
     * @remarks
     * The application implements the <a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a> object that is referenced by the <i>animation</i> parameter.
     * @param {IDCompositionAnimation} animation The object that generates a sequence of animation curve primitives.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getcurve
     */
    GetCurve(animation) {
        result := ComCall(6, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Gets the animation curve of the animation variable for the specified dimension.
     * @remarks
     * The application implements the <a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a> object that is referenced by the <i>animation</i> parameter.
     * @param {Pointer<IDCompositionAnimation>} animation The object that generates a sequence of animation curve primitives.
     * @param {Integer} cDimension The number of animation curves.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getvectorcurve
     */
    GetVectorCurve(animation, cDimension) {
        result := ComCall(7, this, IDCompositionAnimation.Ptr, animation, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * Gets the final value of the animation variable. This is the value after all currently scheduled animations have completed. (IUIAnimationVariable2.GetFinalValue)
     * @returns {Float} The final value of the animation variable.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getfinalvalue
     */
    GetFinalValue() {
        result := ComCall(8, this, "double*", &finalValue := 0, "HRESULT")
        return finalValue
    }

    /**
     * Gets the final value of the animation variable for the specified dimension. This is the value after all currently scheduled animations have completed.
     * @param {Integer} cDimension The dimension from which to get the value of the animation variable.
     * @returns {Float} The final value of the animation variable.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getfinalvectorvalue
     */
    GetFinalVectorValue(cDimension) {
        result := ComCall(9, this, "double*", &finalValue := 0, "uint", cDimension, "HRESULT")
        return finalValue
    }

    /**
     * Gets the previous value of the animation variable. This is the value of the animation variable before the most recent update. (IUIAnimationVariable2.GetPreviousValue)
     * @returns {Float} The previous value of the animation variable.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getpreviousvalue
     */
    GetPreviousValue() {
        result := ComCall(10, this, "double*", &previousValue := 0, "HRESULT")
        return previousValue
    }

    /**
     * Gets the previous value of the animation variable for the specified dimension. This is the value of the animation variable before the most recent update.
     * @param {Integer} cDimension The dimension from which to get the value of the animation variable.
     * @returns {Float} The previous value of the animation variable.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getpreviousvectorvalue
     */
    GetPreviousVectorValue(cDimension) {
        result := ComCall(11, this, "double*", &previousValue := 0, "uint", cDimension, "HRESULT")
        return previousValue
    }

    /**
     * Gets the integer value of the animation variable.
     * @returns {Integer} The value of the animation variable as an integer.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getintegervalue
     */
    GetIntegerValue() {
        result := ComCall(12, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets the integer value of the animation variable for the specified dimension.
     * @param {Integer} cDimension The dimension from which to get the value of the animation variable.
     * @returns {Integer} The value of the animation variable as an integer.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getintegervectorvalue
     */
    GetIntegerVectorValue(cDimension) {
        result := ComCall(13, this, "int*", &value := 0, "uint", cDimension, "HRESULT")
        return value
    }

    /**
     * Gets the final integer value of the animation variable. This is the value after all currently scheduled animations have completed.
     * @returns {Integer} The final value of the animation variable as an integer.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getfinalintegervalue
     */
    GetFinalIntegerValue() {
        result := ComCall(14, this, "int*", &finalValue := 0, "HRESULT")
        return finalValue
    }

    /**
     * Gets the final integer value of the animation variable for the specified dimension. This is the value after all currently scheduled animations have completed.
     * @param {Integer} cDimension The dimension from which to get the value of the animation variable.
     * @returns {Integer} The final value of the animation variable as an integer.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getfinalintegervectorvalue
     */
    GetFinalIntegerVectorValue(cDimension) {
        result := ComCall(15, this, "int*", &finalValue := 0, "uint", cDimension, "HRESULT")
        return finalValue
    }

    /**
     * Gets the previous integer value of the animation variable in the specified dimension. This is the value of the animation variable before the most recent update.
     * @returns {Integer} The previous value of the animation variable as an integer.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getpreviousintegervalue
     */
    GetPreviousIntegerValue() {
        result := ComCall(16, this, "int*", &previousValue := 0, "HRESULT")
        return previousValue
    }

    /**
     * Gets the previous integer value of the animation variable for the specified dimension. This is the value of the animation variable before the most recent update.
     * @param {Integer} cDimension The dimension from which to get the value of the animation variable.
     * @returns {Integer} The previous value of the animation variable as an integer.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getpreviousintegervectorvalue
     */
    GetPreviousIntegerVectorValue(cDimension) {
        result := ComCall(17, this, "int*", &previousValue := 0, "uint", cDimension, "HRESULT")
        return previousValue
    }

    /**
     * Gets the active storyboard for the animation variable.
     * @returns {IUIAnimationStoryboard2} The active storyboard, or NULL if the animation variable is not being animated.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getcurrentstoryboard
     */
    GetCurrentStoryboard() {
        result := ComCall(18, this, "ptr*", &storyboard := 0, "HRESULT")
        return IUIAnimationStoryboard2(storyboard)
    }

    /**
     * Sets the lower bound (floor) for the value of the animation variable. The value of the animation variable should not fall below the specified value.
     * @param {Float} bound The lower bound for the value of the animation variable.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-setlowerbound
     */
    SetLowerBound(bound) {
        result := ComCall(19, this, "double", bound, "HRESULT")
        return result
    }

    /**
     * Sets the lower bound (floor) value of each specified dimension for the animation variable. The value of each animation variable should not fall below its lower bound.
     * @param {Pointer<Float>} bound A vector (of size <i>cDimension</i>) that contains  the lower bound values of each dimension.
     * @param {Integer} cDimension The number of dimensions that require lower bound values. This parameter specifies the number of values listed in <i>bound</i>.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-setlowerboundvector
     */
    SetLowerBoundVector(bound, cDimension) {
        boundMarshal := bound is VarRef ? "double*" : "ptr"

        result := ComCall(20, this, boundMarshal, bound, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * Sets the upper bound (ceiling) for the value of the animation variable. The value of the animation variable should not rise above the specified value.
     * @param {Float} bound The upper bound for the value of the animation variable.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-setupperbound
     */
    SetUpperBound(bound) {
        result := ComCall(21, this, "double", bound, "HRESULT")
        return result
    }

    /**
     * Sets the upper bound (ceiling) value of each specified dimension for the animation variable. The value of each animation variable should not rise above its upper bound.
     * @param {Pointer<Float>} bound A vector (of size <i>cDimension</i>) that contains  the upper bound values of each dimension.
     * @param {Integer} cDimension The number of dimensions that require upper bound values. This parameter specifies the number of values listed in <i>bound</i>.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-setupperboundvector
     */
    SetUpperBoundVector(bound, cDimension) {
        boundMarshal := bound is VarRef ? "double*" : "ptr"

        result := ComCall(22, this, boundMarshal, bound, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * Sets the rounding mode of the animation variable.
     * @remarks
     * An animation variable's rounding mode determines how a floating-point value is converted to an integer.
     *       The default mode for each variable is <b>UI_ANIMATION_ROUNDING_NEAREST</b>.
     * @param {UI_ANIMATION_ROUNDING_MODE} _mode The rounding mode.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-setroundingmode
     */
    SetRoundingMode(_mode) {
        result := ComCall(23, this, UI_ANIMATION_ROUNDING_MODE, _mode, "HRESULT")
        return result
    }

    /**
     * Sets the tag of the animation variable.
     * @remarks
     * A tag is a pairing of an integer identifier (<i>id</i>) with a COM object (<i>object</i>), and it can be used by an application to identify an animation variable.          
     *          Because <b>NULL</b> is a valid object component of a tag, the <i>object</i> parameter can be <b>NULL</b>.
     * @param {IUnknown} _object The object portion of the tag. This parameter can be <b>NULL</b>.
     * @param {Integer} id The identifier portion of the tag.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-settag
     */
    SetTag(_object, id) {
        result := ComCall(24, this, "ptr", _object, "uint", id, "HRESULT")
        return result
    }

    /**
     * Gets the tag of the animation variable.
     * @remarks
     * A tag is a pairing of an integer identifier (<i>id</i>) with a COM object (<i>object</i>); it can be used by an application to identify an animation variable.
     * 
     * The parameters are optional, so that the method can return both portions of the tag, or just the identifier or object portion.
     * @param {Pointer<IUnknown>} _object The object portion of the tag.
     * @param {Pointer<Integer>} id The identifier portion of the tag.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-gettag
     */
    GetTag(_object, id) {
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, IUnknown.Ptr, _object, idMarshal, id, "HRESULT")
        return result
    }

    /**
     * Specifies a handler for changes to the value of the animation variable.
     * @remarks
     * Passing <b>NULL</b> for the <i>handler</i> parameter causes Windows Animation to release its reference to any handler object that you passed in earlier. This technique can be essential for breaking reference cycles without having to call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-shutdown">IUIAnimationManager2::Shutdown</a> method.
     * @param {IUIAnimationVariableChangeHandler2} handler The handler for changes to the value of the animation variable. This parameter can be <b>NULL</b>.
     * @param {BOOL} fRegisterForNextAnimationEvent If <b>TRUE</b>, specifies that the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-estimatenexteventtime">EstimateNextEventTime</a> method will incorporate <i>handler</i> into its estimate of the time interval until the next animation event. No default value.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-setvariablechangehandler
     */
    SetVariableChangeHandler(handler, fRegisterForNextAnimationEvent) {
        result := ComCall(26, this, "ptr", handler, BOOL, fRegisterForNextAnimationEvent, "HRESULT")
        return result
    }

    /**
     * Specifies a handler for changes to the integer value of the animation variable.
     * @remarks
     * Passing <b>NULL</b> for the <i>handler</i> parameter causes Windows Animation to release its reference to any handler object that you passed in earlier. This technique can be essential for breaking reference cycles without having to call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-shutdown">Shutdown</a> method.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariableintegerchangehandler2-onintegervaluechanged">IUIAnimationVariableIntegerChangeHandler2::OnIntegerValueChanged</a> is called only if the rounded value has changed since the last update.
     * @param {IUIAnimationVariableIntegerChangeHandler2} handler A pointer to the handler for changes to the integer value of the animation variable. This parameter can be <b>NULL</b>.
     * @param {BOOL} fRegisterForNextAnimationEvent If <b>TRUE</b>, specifies that the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-estimatenexteventtime">EstimateNextEventTime</a> method will incorporate <i>handler</i> into its estimate of the time interval until the next animation event. No default value.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-setvariableintegerchangehandler
     */
    SetVariableIntegerChangeHandler(handler, fRegisterForNextAnimationEvent) {
        result := ComCall(27, this, "ptr", handler, BOOL, fRegisterForNextAnimationEvent, "HRESULT")
        return result
    }

    /**
     * Specifies a handler for changes to the animation curve of the animation variable.
     * @param {IUIAnimationVariableCurveChangeHandler2} handler A pointer to the handler for changes to the animation curve of the animation variable. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-setvariablecurvechangehandler
     */
    SetVariableCurveChangeHandler(handler) {
        result := ComCall(28, this, "ptr", handler, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAnimationVariable2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDimension := CallbackCreate(GetMethod(implObj, "GetDimension"), flags, 2)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 2)
        this.vtbl.GetVectorValue := CallbackCreate(GetMethod(implObj, "GetVectorValue"), flags, 3)
        this.vtbl.GetCurve := CallbackCreate(GetMethod(implObj, "GetCurve"), flags, 2)
        this.vtbl.GetVectorCurve := CallbackCreate(GetMethod(implObj, "GetVectorCurve"), flags, 3)
        this.vtbl.GetFinalValue := CallbackCreate(GetMethod(implObj, "GetFinalValue"), flags, 2)
        this.vtbl.GetFinalVectorValue := CallbackCreate(GetMethod(implObj, "GetFinalVectorValue"), flags, 3)
        this.vtbl.GetPreviousValue := CallbackCreate(GetMethod(implObj, "GetPreviousValue"), flags, 2)
        this.vtbl.GetPreviousVectorValue := CallbackCreate(GetMethod(implObj, "GetPreviousVectorValue"), flags, 3)
        this.vtbl.GetIntegerValue := CallbackCreate(GetMethod(implObj, "GetIntegerValue"), flags, 2)
        this.vtbl.GetIntegerVectorValue := CallbackCreate(GetMethod(implObj, "GetIntegerVectorValue"), flags, 3)
        this.vtbl.GetFinalIntegerValue := CallbackCreate(GetMethod(implObj, "GetFinalIntegerValue"), flags, 2)
        this.vtbl.GetFinalIntegerVectorValue := CallbackCreate(GetMethod(implObj, "GetFinalIntegerVectorValue"), flags, 3)
        this.vtbl.GetPreviousIntegerValue := CallbackCreate(GetMethod(implObj, "GetPreviousIntegerValue"), flags, 2)
        this.vtbl.GetPreviousIntegerVectorValue := CallbackCreate(GetMethod(implObj, "GetPreviousIntegerVectorValue"), flags, 3)
        this.vtbl.GetCurrentStoryboard := CallbackCreate(GetMethod(implObj, "GetCurrentStoryboard"), flags, 2)
        this.vtbl.SetLowerBound := CallbackCreate(GetMethod(implObj, "SetLowerBound"), flags, 2)
        this.vtbl.SetLowerBoundVector := CallbackCreate(GetMethod(implObj, "SetLowerBoundVector"), flags, 3)
        this.vtbl.SetUpperBound := CallbackCreate(GetMethod(implObj, "SetUpperBound"), flags, 2)
        this.vtbl.SetUpperBoundVector := CallbackCreate(GetMethod(implObj, "SetUpperBoundVector"), flags, 3)
        this.vtbl.SetRoundingMode := CallbackCreate(GetMethod(implObj, "SetRoundingMode"), flags, 2)
        this.vtbl.SetTag := CallbackCreate(GetMethod(implObj, "SetTag"), flags, 3)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 3)
        this.vtbl.SetVariableChangeHandler := CallbackCreate(GetMethod(implObj, "SetVariableChangeHandler"), flags, 3)
        this.vtbl.SetVariableIntegerChangeHandler := CallbackCreate(GetMethod(implObj, "SetVariableIntegerChangeHandler"), flags, 3)
        this.vtbl.SetVariableCurveChangeHandler := CallbackCreate(GetMethod(implObj, "SetVariableCurveChangeHandler"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDimension)
        CallbackFree(this.vtbl.GetValue)
        CallbackFree(this.vtbl.GetVectorValue)
        CallbackFree(this.vtbl.GetCurve)
        CallbackFree(this.vtbl.GetVectorCurve)
        CallbackFree(this.vtbl.GetFinalValue)
        CallbackFree(this.vtbl.GetFinalVectorValue)
        CallbackFree(this.vtbl.GetPreviousValue)
        CallbackFree(this.vtbl.GetPreviousVectorValue)
        CallbackFree(this.vtbl.GetIntegerValue)
        CallbackFree(this.vtbl.GetIntegerVectorValue)
        CallbackFree(this.vtbl.GetFinalIntegerValue)
        CallbackFree(this.vtbl.GetFinalIntegerVectorValue)
        CallbackFree(this.vtbl.GetPreviousIntegerValue)
        CallbackFree(this.vtbl.GetPreviousIntegerVectorValue)
        CallbackFree(this.vtbl.GetCurrentStoryboard)
        CallbackFree(this.vtbl.SetLowerBound)
        CallbackFree(this.vtbl.SetLowerBoundVector)
        CallbackFree(this.vtbl.SetUpperBound)
        CallbackFree(this.vtbl.SetUpperBoundVector)
        CallbackFree(this.vtbl.SetRoundingMode)
        CallbackFree(this.vtbl.SetTag)
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.SetVariableChangeHandler)
        CallbackFree(this.vtbl.SetVariableIntegerChangeHandler)
        CallbackFree(this.vtbl.SetVariableCurveChangeHandler)
    }
}
