#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include .\CrossSlideThresholds.ahk
#Include .\MouseWheelParameters.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Reacts to events by recognizing gestures and adding gesture data to the input queue.
 * @remarks
 * This interface is implemented by the <a href="https://docs.microsoft.com/windows/desktop/tablet/gesturerecognizer-class">GestureRecognizer Class</a>.
 * 
 * The gesture recognizer analyzes digitizer input and injects gesture recognition results into the input queue.
 * 
 * Adding an instance of the <a href="https://docs.microsoft.com/windows/desktop/tablet/gesturerecognizer-class">GestureRecognizer Class</a> to multiple <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> instances is not a valid operation.
 * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nn-rtscom-igesturerecognizer
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IGestureRecognizer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGestureRecognizer
     * @type {Guid}
     */
    static IID => Guid("{b47a37bf-3d6b-4f88-83e8-6dcb4012ffb0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GestureSettings", "put_GestureSettings", "get_IsInertial", "get_IsActive", "get_ShowGestureFeedback", "put_ShowGestureFeedback", "get_PivotCenter", "put_PivotCenter", "get_PivotRadius", "put_PivotRadius", "get_InertiaTranslationDeceleration", "put_InertiaTranslationDeceleration", "get_InertiaRotationDeceleration", "put_InertiaRotationDeceleration", "get_InertiaExpansionDeceleration", "put_InertiaExpansionDeceleration", "get_InertiaTranslationDisplacement", "put_InertiaTranslationDisplacement", "get_InertiaRotationAngle", "put_InertiaRotationAngle", "get_InertiaExpansion", "put_InertiaExpansion", "get_ManipulationExact", "put_ManipulationExact", "get_CrossSlideThresholds", "put_CrossSlideThresholds", "get_CrossSlideHorizontally", "put_CrossSlideHorizontally", "get_CrossSlideExact", "put_CrossSlideExact", "get_AutoProcessInertia", "put_AutoProcessInertia", "get_MouseWheelParameters", "CanBeDoubleTap", "ProcessDownEvent", "ProcessMoveEvents", "ProcessUpEvent", "ProcessMouseWheelEvent", "ProcessInertia", "CompleteGesture", "add_Tapped", "remove_Tapped", "add_RightTapped", "remove_RightTapped", "add_Holding", "remove_Holding", "add_Dragging", "remove_Dragging", "add_ManipulationStarted", "remove_ManipulationStarted", "add_ManipulationUpdated", "remove_ManipulationUpdated", "add_ManipulationInertiaStarting", "remove_ManipulationInertiaStarting", "add_ManipulationCompleted", "remove_ManipulationCompleted", "add_CrossSliding", "remove_CrossSliding"]

    /**
     * @type {Integer} 
     */
    GestureSettings {
        get => this.get_GestureSettings()
        set => this.put_GestureSettings(value)
    }

    /**
     * @type {Boolean} 
     */
    IsInertial {
        get => this.get_IsInertial()
    }

    /**
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * @type {Boolean} 
     */
    ShowGestureFeedback {
        get => this.get_ShowGestureFeedback()
        set => this.put_ShowGestureFeedback(value)
    }

    /**
     * @type {POINT} 
     */
    PivotCenter {
        get => this.get_PivotCenter()
        set => this.put_PivotCenter(value)
    }

    /**
     * @type {Float} 
     */
    PivotRadius {
        get => this.get_PivotRadius()
        set => this.put_PivotRadius(value)
    }

    /**
     * @type {Float} 
     */
    InertiaTranslationDeceleration {
        get => this.get_InertiaTranslationDeceleration()
        set => this.put_InertiaTranslationDeceleration(value)
    }

    /**
     * @type {Float} 
     */
    InertiaRotationDeceleration {
        get => this.get_InertiaRotationDeceleration()
        set => this.put_InertiaRotationDeceleration(value)
    }

    /**
     * @type {Float} 
     */
    InertiaExpansionDeceleration {
        get => this.get_InertiaExpansionDeceleration()
        set => this.put_InertiaExpansionDeceleration(value)
    }

    /**
     * @type {Float} 
     */
    InertiaTranslationDisplacement {
        get => this.get_InertiaTranslationDisplacement()
        set => this.put_InertiaTranslationDisplacement(value)
    }

    /**
     * @type {Float} 
     */
    InertiaRotationAngle {
        get => this.get_InertiaRotationAngle()
        set => this.put_InertiaRotationAngle(value)
    }

    /**
     * @type {Float} 
     */
    InertiaExpansion {
        get => this.get_InertiaExpansion()
        set => this.put_InertiaExpansion(value)
    }

    /**
     * @type {Boolean} 
     */
    ManipulationExact {
        get => this.get_ManipulationExact()
        set => this.put_ManipulationExact(value)
    }

    /**
     * @type {CrossSlideThresholds} 
     */
    CrossSlideThresholds {
        get => this.get_CrossSlideThresholds()
        set => this.put_CrossSlideThresholds(value)
    }

    /**
     * @type {Boolean} 
     */
    CrossSlideHorizontally {
        get => this.get_CrossSlideHorizontally()
        set => this.put_CrossSlideHorizontally(value)
    }

    /**
     * @type {Boolean} 
     */
    CrossSlideExact {
        get => this.get_CrossSlideExact()
        set => this.put_CrossSlideExact(value)
    }

    /**
     * @type {Boolean} 
     */
    AutoProcessInertia {
        get => this.get_AutoProcessInertia()
        set => this.put_AutoProcessInertia(value)
    }

    /**
     * @type {MouseWheelParameters} 
     */
    MouseWheelParameters {
        get => this.get_MouseWheelParameters()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GestureSettings() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_GestureSettings(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInertial() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowGestureFeedback() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowGestureFeedback(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_PivotCenter() {
        value := POINT()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_PivotCenter(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PivotRadius() {
        result := ComCall(14, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PivotRadius(value) {
        result := ComCall(15, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InertiaTranslationDeceleration() {
        result := ComCall(16, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_InertiaTranslationDeceleration(value) {
        result := ComCall(17, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InertiaRotationDeceleration() {
        result := ComCall(18, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_InertiaRotationDeceleration(value) {
        result := ComCall(19, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InertiaExpansionDeceleration() {
        result := ComCall(20, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_InertiaExpansionDeceleration(value) {
        result := ComCall(21, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InertiaTranslationDisplacement() {
        result := ComCall(22, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_InertiaTranslationDisplacement(value) {
        result := ComCall(23, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InertiaRotationAngle() {
        result := ComCall(24, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_InertiaRotationAngle(value) {
        result := ComCall(25, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InertiaExpansion() {
        result := ComCall(26, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_InertiaExpansion(value) {
        result := ComCall(27, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ManipulationExact() {
        result := ComCall(28, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ManipulationExact(value) {
        result := ComCall(29, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CrossSlideThresholds} 
     */
    get_CrossSlideThresholds() {
        value := CrossSlideThresholds()
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {CrossSlideThresholds} value 
     * @returns {HRESULT} 
     */
    put_CrossSlideThresholds(value) {
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CrossSlideHorizontally() {
        result := ComCall(32, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CrossSlideHorizontally(value) {
        result := ComCall(33, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CrossSlideExact() {
        result := ComCall(34, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CrossSlideExact(value) {
        result := ComCall(35, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoProcessInertia() {
        result := ComCall(36, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoProcessInertia(value) {
        result := ComCall(37, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MouseWheelParameters} 
     */
    get_MouseWheelParameters() {
        result := ComCall(38, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MouseWheelParameters(value)
    }

    /**
     * 
     * @param {PointerPoint} value 
     * @returns {Boolean} 
     */
    CanBeDoubleTap(value) {
        result := ComCall(39, this, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {PointerPoint} value 
     * @returns {HRESULT} 
     */
    ProcessDownEvent(value) {
        result := ComCall(40, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IVector<PointerPoint>} value 
     * @returns {HRESULT} 
     */
    ProcessMoveEvents(value) {
        result := ComCall(41, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerPoint} value 
     * @returns {HRESULT} 
     */
    ProcessUpEvent(value) {
        result := ComCall(42, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerPoint} value 
     * @param {Boolean} isShiftKeyDown 
     * @param {Boolean} isControlKeyDown 
     * @returns {HRESULT} 
     */
    ProcessMouseWheelEvent(value, isShiftKeyDown, isControlKeyDown) {
        result := ComCall(43, this, "ptr", value, "int", isShiftKeyDown, "int", isControlKeyDown, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sends timer input to the Interaction Context object for inertia processing.
     * @remarks
     * The caller is responsible for creating timer when inertia starts, and for driving inertia input with the timer by calling this function from the timer callback. Recommended timer period is 15 ms.
     * 
     * 
     * 
     * This function has no effect outside inertia.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/interactioncontext/nf-interactioncontext-processinertiainteractioncontext
     */
    ProcessInertia() {
        result := ComCall(44, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CompleteGesture() {
        result := ComCall(45, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, TappedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Tapped(handler) {
        token := EventRegistrationToken()
        result := ComCall(46, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Tapped(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(47, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, RightTappedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RightTapped(handler) {
        token := EventRegistrationToken()
        result := ComCall(48, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RightTapped(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(49, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, HoldingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Holding(handler) {
        token := EventRegistrationToken()
        result := ComCall(50, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Holding(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(51, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, DraggingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Dragging(handler) {
        token := EventRegistrationToken()
        result := ComCall(52, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Dragging(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(53, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, ManipulationStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationStarted(handler) {
        token := EventRegistrationToken()
        result := ComCall(54, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationStarted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(55, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, ManipulationUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationUpdated(handler) {
        token := EventRegistrationToken()
        result := ComCall(56, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationUpdated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(57, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, ManipulationInertiaStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationInertiaStarting(handler) {
        token := EventRegistrationToken()
        result := ComCall(58, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationInertiaStarting(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(59, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, ManipulationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(60, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(61, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, CrossSlidingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CrossSliding(handler) {
        token := EventRegistrationToken()
        result := ComCall(62, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CrossSliding(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(63, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
