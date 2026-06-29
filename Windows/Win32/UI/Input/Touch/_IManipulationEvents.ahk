#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Handles manipulation and inertia events.
 * @see https://learn.microsoft.com/windows/win32/api/manipulations/nn-manipulations-_imanipulationevents
 * @namespace Windows.Win32.UI.Input.Touch
 */
export default struct _IManipulationEvents extends IUnknown {
    /**
     * The interface identifier for _IManipulationEvents
     * @type {Guid}
     */
    static IID := Guid("{4f62c8da-9c53-4b22-93df-927a862bbb03}")

    /**
     * The class identifier for _IManipulationEvents
     * @type {Guid}
     */
    static CLSID := Guid("{4f62c8da-9c53-4b22-93df-927a862bbb03}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for _IManipulationEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ManipulationStarted   : IntPtr
        ManipulationDelta     : IntPtr
        ManipulationCompleted : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := _IManipulationEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles the event for when manipulation or inertia begins.
     * @remarks
     * Manipulation events are generated for both the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> interfaces.
     *     If you are using the values from the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-touchinput">TOUCHINPUT</a> structure in calls to <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-imanipulationprocessor-processdown">ProcessDown</a>, the coordinates will be in 
     *     hundredths of a pixel.
     * @param {Float} x The origin x-coordinate in user-defined coordinates.
     * @param {Float} y The origin y-coordinate in user-defined coordinates.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationstarted
     */
    ManipulationStarted(x, y) {
        result := ComCall(3, this, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * Handles events that happen when a manipulated object changes.
     * @remarks
     * Manipulation events are generated for both the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> interfaces.
     *     If you are using the values from the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-touchinput">TOUCHINPUT</a> structure in calls to <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-imanipulationprocessor-processmove">ProcessMove</a>, the coordinates will be in 
     *     hundredths of a pixel.
     * 
     * <div class="alert"><b>Note</b>  When using inertia, calls to <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-complete">IInertiaProcessor::Complete</a> can force the current manipulation to be extrapolated resulting in large deltas being passed to the ManipulationCompleted event.
     * 	 To address this issue, perform updates on the completed event in addition to the delta event.
     * 	 </div>
     * <div> </div>
     * @param {Float} x The origin x-coordinate in user-defined coordinates.
     * @param {Float} y The origin y-coordinate in user-defined coordinates.
     * @param {Float} translationDeltaX The translation change about the x-axis in user-defined coordinates since the last event.
     * @param {Float} translationDeltaY The translation change about the y-axis in user-defined coordinates since the last event.
     * @param {Float} scaleDelta The scale change since the previous event as a percentage of the previous scale.
     * @param {Float} expansionDelta The expansion change since the previous event in user-defined coordinates.
     * @param {Float} rotationDelta The rotation change since the previous event in radians.
     * @param {Float} cumulativeTranslationX The translation about the x-axis since the beginning of the manipulation in user-defined coordinates.
     * @param {Float} cumulativeTranslationY The translation about the y-axis since the beginning of the manipulation in user-defined coordinates.
     * @param {Float} cumulativeScale The scale change since the beginning of the manipulation as a percentage of the original size.
     * @param {Float} cumulativeExpansion The expansion change since the beginning of the manipulation in user-defined coordinates.
     * @param {Float} cumulativeRotation The rotation change since the beginning of the manipulation in radians.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationdelta
     */
    ManipulationDelta(x, y, translationDeltaX, translationDeltaY, scaleDelta, expansionDelta, rotationDelta, cumulativeTranslationX, cumulativeTranslationY, cumulativeScale, cumulativeExpansion, cumulativeRotation) {
        result := ComCall(4, this, "float", x, "float", y, "float", translationDeltaX, "float", translationDeltaY, "float", scaleDelta, "float", expansionDelta, "float", rotationDelta, "float", cumulativeTranslationX, "float", cumulativeTranslationY, "float", cumulativeScale, "float", cumulativeExpansion, "float", cumulativeRotation, "HRESULT")
        return result
    }

    /**
     * Handles the event when manipulation or inertia finishes.
     * @remarks
     * Manipulation events are generated for both the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> interfaces.
     *     If you are using the values from the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-touchinput">TOUCHINPUT</a> structure in calls to <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-imanipulationprocessor-processup">ProcessUp</a>, the coordinates will be in 
     *     hundredths of a pixel.
     * 
     * <div class="alert"><b>Note</b>  When using inertia, calls to <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-complete">IInertiaProcessor::Complete</a> can force the current manipulation to be extrapolated resulting in large deltas being passed to the ManipulationCompleted event.
     * 	 To address this issue, perform updates on the completed event in addition to the delta event.
     * 	 </div>
     * <div> </div>
     * @param {Float} x The origin x-coordinate in user-defined coordinates.
     * @param {Float} y The origin y-coordinate in user-defined coordinates.
     * @param {Float} cumulativeTranslationX The total translation about the x-axis since the beginning of the manipulation in user-defined coordinates.
     * @param {Float} cumulativeTranslationY The total translation about the y-axis since the beginning of the manipulation in user-defined coordinates.
     * @param {Float} cumulativeScale The total scale change since the beginning of the manipulation as a percentage of the original size.
     * @param {Float} cumulativeExpansion The total expansion change since the beginning of the manipulation in user-defined coordinates.
     * @param {Float} cumulativeRotation The total rotation change since the beginning of the manipulation in radians.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted
     */
    ManipulationCompleted(x, y, cumulativeTranslationX, cumulativeTranslationY, cumulativeScale, cumulativeExpansion, cumulativeRotation) {
        result := ComCall(5, this, "float", x, "float", y, "float", cumulativeTranslationX, "float", cumulativeTranslationY, "float", cumulativeScale, "float", cumulativeExpansion, "float", cumulativeRotation, "HRESULT")
        return result
    }

    Query(iid) {
        if (_IManipulationEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ManipulationStarted := CallbackCreate(GetMethod(implObj, "ManipulationStarted"), flags, 3)
        this.vtbl.ManipulationDelta := CallbackCreate(GetMethod(implObj, "ManipulationDelta"), flags, 13)
        this.vtbl.ManipulationCompleted := CallbackCreate(GetMethod(implObj, "ManipulationCompleted"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ManipulationStarted)
        CallbackFree(this.vtbl.ManipulationDelta)
        CallbackFree(this.vtbl.ManipulationCompleted)
    }
}
