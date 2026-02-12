#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include Media\RectangleGeometry.ahk
#Include Media\Transform.ahk
#Include Media\Projection.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include Media\Animation\TransitionCollection.ahk
#Include Media\CacheMode.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include Input\Pointer.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include Media\GeneralTransform.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElement extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElement
     * @type {Guid}
     */
    static IID => Guid("{676d0be9-b65c-41c6-ba40-58cf87f201c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DesiredSize", "get_AllowDrop", "put_AllowDrop", "get_Opacity", "put_Opacity", "get_Clip", "put_Clip", "get_RenderTransform", "put_RenderTransform", "get_Projection", "put_Projection", "get_RenderTransformOrigin", "put_RenderTransformOrigin", "get_IsHitTestVisible", "put_IsHitTestVisible", "get_Visibility", "put_Visibility", "get_RenderSize", "get_UseLayoutRounding", "put_UseLayoutRounding", "get_Transitions", "put_Transitions", "get_CacheMode", "put_CacheMode", "get_IsTapEnabled", "put_IsTapEnabled", "get_IsDoubleTapEnabled", "put_IsDoubleTapEnabled", "get_IsRightTapEnabled", "put_IsRightTapEnabled", "get_IsHoldingEnabled", "put_IsHoldingEnabled", "get_ManipulationMode", "put_ManipulationMode", "get_PointerCaptures", "add_KeyUp", "remove_KeyUp", "add_KeyDown", "remove_KeyDown", "add_GotFocus", "remove_GotFocus", "add_LostFocus", "remove_LostFocus", "add_DragEnter", "remove_DragEnter", "add_DragLeave", "remove_DragLeave", "add_DragOver", "remove_DragOver", "add_Drop", "remove_Drop", "add_PointerPressed", "remove_PointerPressed", "add_PointerMoved", "remove_PointerMoved", "add_PointerReleased", "remove_PointerReleased", "add_PointerEntered", "remove_PointerEntered", "add_PointerExited", "remove_PointerExited", "add_PointerCaptureLost", "remove_PointerCaptureLost", "add_PointerCanceled", "remove_PointerCanceled", "add_PointerWheelChanged", "remove_PointerWheelChanged", "add_Tapped", "remove_Tapped", "add_DoubleTapped", "remove_DoubleTapped", "add_Holding", "remove_Holding", "add_RightTapped", "remove_RightTapped", "add_ManipulationStarting", "remove_ManipulationStarting", "add_ManipulationInertiaStarting", "remove_ManipulationInertiaStarting", "add_ManipulationStarted", "remove_ManipulationStarted", "add_ManipulationDelta", "remove_ManipulationDelta", "add_ManipulationCompleted", "remove_ManipulationCompleted", "Measure", "Arrange", "CapturePointer", "ReleasePointerCapture", "ReleasePointerCaptures", "AddHandler", "RemoveHandler", "TransformToVisual", "InvalidateMeasure", "InvalidateArrange", "UpdateLayout"]

    /**
     * @type {SIZE} 
     */
    DesiredSize {
        get => this.get_DesiredSize()
    }

    /**
     * @type {Boolean} 
     */
    AllowDrop {
        get => this.get_AllowDrop()
        set => this.put_AllowDrop(value)
    }

    /**
     * @type {Float} 
     */
    Opacity {
        get => this.get_Opacity()
        set => this.put_Opacity(value)
    }

    /**
     * @type {RectangleGeometry} 
     */
    Clip {
        get => this.get_Clip()
        set => this.put_Clip(value)
    }

    /**
     * @type {Transform} 
     */
    RenderTransform {
        get => this.get_RenderTransform()
        set => this.put_RenderTransform(value)
    }

    /**
     * @type {Projection} 
     */
    Projection {
        get => this.get_Projection()
        set => this.put_Projection(value)
    }

    /**
     * @type {POINT} 
     */
    RenderTransformOrigin {
        get => this.get_RenderTransformOrigin()
        set => this.put_RenderTransformOrigin(value)
    }

    /**
     * @type {Boolean} 
     */
    IsHitTestVisible {
        get => this.get_IsHitTestVisible()
        set => this.put_IsHitTestVisible(value)
    }

    /**
     * @type {Integer} 
     */
    Visibility {
        get => this.get_Visibility()
        set => this.put_Visibility(value)
    }

    /**
     * @type {SIZE} 
     */
    RenderSize {
        get => this.get_RenderSize()
    }

    /**
     * @type {Boolean} 
     */
    UseLayoutRounding {
        get => this.get_UseLayoutRounding()
        set => this.put_UseLayoutRounding(value)
    }

    /**
     * @type {TransitionCollection} 
     */
    Transitions {
        get => this.get_Transitions()
        set => this.put_Transitions(value)
    }

    /**
     * @type {CacheMode} 
     */
    CacheMode {
        get => this.get_CacheMode()
        set => this.put_CacheMode(value)
    }

    /**
     * @type {Boolean} 
     */
    IsTapEnabled {
        get => this.get_IsTapEnabled()
        set => this.put_IsTapEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsDoubleTapEnabled {
        get => this.get_IsDoubleTapEnabled()
        set => this.put_IsDoubleTapEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsRightTapEnabled {
        get => this.get_IsRightTapEnabled()
        set => this.put_IsRightTapEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsHoldingEnabled {
        get => this.get_IsHoldingEnabled()
        set => this.put_IsHoldingEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    ManipulationMode {
        get => this.get_ManipulationMode()
        set => this.put_ManipulationMode(value)
    }

    /**
     * @type {IVectorView<Pointer>} 
     */
    PointerCaptures {
        get => this.get_PointerCaptures()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_DesiredSize() {
        value := SIZE()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowDrop() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_AllowDrop(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Opacity() {
        result := ComCall(9, this, "double*", &value := 0, "int")
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
    put_Opacity(value) {
        result := ComCall(10, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RectangleGeometry} 
     */
    get_Clip() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RectangleGeometry(value)
    }

    /**
     * 
     * @param {RectangleGeometry} value 
     * @returns {HRESULT} 
     */
    put_Clip(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Transform} 
     */
    get_RenderTransform() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Transform(value)
    }

    /**
     * 
     * @param {Transform} value 
     * @returns {HRESULT} 
     */
    put_RenderTransform(value) {
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Projection} 
     */
    get_Projection() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Projection(value)
    }

    /**
     * 
     * @param {Projection} value 
     * @returns {HRESULT} 
     */
    put_Projection(value) {
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_RenderTransformOrigin() {
        value := POINT()
        result := ComCall(17, this, "ptr", value, "int")
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
    put_RenderTransformOrigin(value) {
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHitTestVisible() {
        result := ComCall(19, this, "int*", &value := 0, "int")
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
    put_IsHitTestVisible(value) {
        result := ComCall(20, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Visibility() {
        result := ComCall(21, this, "int*", &value := 0, "int")
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
    put_Visibility(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_RenderSize() {
        value := SIZE()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseLayoutRounding() {
        result := ComCall(24, this, "int*", &value := 0, "int")
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
    put_UseLayoutRounding(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_Transitions() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TransitionCollection(value)
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_Transitions(value) {
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CacheMode} 
     */
    get_CacheMode() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CacheMode(value)
    }

    /**
     * 
     * @param {CacheMode} value 
     * @returns {HRESULT} 
     */
    put_CacheMode(value) {
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTapEnabled() {
        result := ComCall(30, this, "int*", &value := 0, "int")
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
    put_IsTapEnabled(value) {
        result := ComCall(31, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDoubleTapEnabled() {
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
    put_IsDoubleTapEnabled(value) {
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
    get_IsRightTapEnabled() {
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
    put_IsRightTapEnabled(value) {
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
    get_IsHoldingEnabled() {
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
    put_IsHoldingEnabled(value) {
        result := ComCall(37, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ManipulationMode() {
        result := ComCall(38, this, "uint*", &value := 0, "int")
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
    put_ManipulationMode(value) {
        result := ComCall(39, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<Pointer>} 
     */
    get_PointerCaptures() {
        result := ComCall(40, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Pointer, value)
    }

    /**
     * 
     * @param {KeyEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeyUp(handler) {
        token := EventRegistrationToken()
        result := ComCall(41, this, "ptr", handler, "ptr", token, "int")
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
    remove_KeyUp(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(42, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {KeyEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeyDown(handler) {
        token := EventRegistrationToken()
        result := ComCall(43, this, "ptr", handler, "ptr", token, "int")
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
    remove_KeyDown(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(44, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GotFocus(handler) {
        token := EventRegistrationToken()
        result := ComCall(45, this, "ptr", handler, "ptr", token, "int")
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
    remove_GotFocus(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(46, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LostFocus(handler) {
        token := EventRegistrationToken()
        result := ComCall(47, this, "ptr", handler, "ptr", token, "int")
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
    remove_LostFocus(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(48, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DragEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragEnter(handler) {
        token := EventRegistrationToken()
        result := ComCall(49, this, "ptr", handler, "ptr", token, "int")
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
    remove_DragEnter(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(50, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DragEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragLeave(handler) {
        token := EventRegistrationToken()
        result := ComCall(51, this, "ptr", handler, "ptr", token, "int")
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
    remove_DragLeave(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(52, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DragEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragOver(handler) {
        token := EventRegistrationToken()
        result := ComCall(53, this, "ptr", handler, "ptr", token, "int")
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
    remove_DragOver(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(54, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DragEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Drop(handler) {
        token := EventRegistrationToken()
        result := ComCall(55, this, "ptr", handler, "ptr", token, "int")
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
    remove_Drop(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(56, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerPressed(handler) {
        token := EventRegistrationToken()
        result := ComCall(57, this, "ptr", handler, "ptr", token, "int")
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
    remove_PointerPressed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(58, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerMoved(handler) {
        token := EventRegistrationToken()
        result := ComCall(59, this, "ptr", handler, "ptr", token, "int")
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
    remove_PointerMoved(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(60, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerReleased(handler) {
        token := EventRegistrationToken()
        result := ComCall(61, this, "ptr", handler, "ptr", token, "int")
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
    remove_PointerReleased(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(62, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerEntered(handler) {
        token := EventRegistrationToken()
        result := ComCall(63, this, "ptr", handler, "ptr", token, "int")
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
    remove_PointerEntered(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(64, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerExited(handler) {
        token := EventRegistrationToken()
        result := ComCall(65, this, "ptr", handler, "ptr", token, "int")
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
    remove_PointerExited(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(66, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerCaptureLost(handler) {
        token := EventRegistrationToken()
        result := ComCall(67, this, "ptr", handler, "ptr", token, "int")
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
    remove_PointerCaptureLost(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(68, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerCanceled(handler) {
        token := EventRegistrationToken()
        result := ComCall(69, this, "ptr", handler, "ptr", token, "int")
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
    remove_PointerCanceled(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(70, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerWheelChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(71, this, "ptr", handler, "ptr", token, "int")
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
    remove_PointerWheelChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(72, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TappedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Tapped(handler) {
        token := EventRegistrationToken()
        result := ComCall(73, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(74, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DoubleTappedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DoubleTapped(handler) {
        token := EventRegistrationToken()
        result := ComCall(75, this, "ptr", handler, "ptr", token, "int")
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
    remove_DoubleTapped(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(76, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HoldingEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Holding(handler) {
        token := EventRegistrationToken()
        result := ComCall(77, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(78, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RightTappedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RightTapped(handler) {
        token := EventRegistrationToken()
        result := ComCall(79, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(80, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ManipulationStartingEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationStarting(handler) {
        token := EventRegistrationToken()
        result := ComCall(81, this, "ptr", handler, "ptr", token, "int")
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
    remove_ManipulationStarting(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(82, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ManipulationInertiaStartingEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationInertiaStarting(handler) {
        token := EventRegistrationToken()
        result := ComCall(83, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(84, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ManipulationStartedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationStarted(handler) {
        token := EventRegistrationToken()
        result := ComCall(85, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(86, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ManipulationDeltaEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationDelta(handler) {
        token := EventRegistrationToken()
        result := ComCall(87, this, "ptr", handler, "ptr", token, "int")
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
    remove_ManipulationDelta(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(88, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ManipulationCompletedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(89, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(90, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * MeasureGroupMeasures (MDX)
     * @remarks
     * The specified string must match the measure group name exactly. Square brackets for measure group names with spaces are not required.
     * @param {SIZE} availableSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/mdx/measuregroupmeasures-mdx
     */
    Measure(availableSize) {
        result := ComCall(91, this, "ptr", availableSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Arranges all the minimized (iconic) child windows of the specified parent window.
     * @remarks
     * An application that maintains its own minimized child windows can use the <b>ArrangeIconicWindows</b> function to arrange icons in a parent window. This function can also arrange icons on the desktop. To retrieve the window handle to the desktop window, use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdesktopwindow">GetDesktopWindow</a> function. 
     * 
     * An application sends the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-mdiiconarrange">WM_MDIICONARRANGE</a> message to the multiple-document interface (MDI) client window to prompt the client window to arrange its minimized MDI child windows.
     * @param {RECT} finalRect 
     * @returns {HRESULT} Type: <b>UINT</b>
     * 
     * If the function succeeds, the return value is the height of one row of icons. 
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-arrangeiconicwindows
     */
    Arrange(finalRect) {
        result := ComCall(92, this, "ptr", finalRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} value 
     * @returns {Boolean} 
     */
    CapturePointer(value) {
        result := ComCall(93, this, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Pointer} value 
     * @returns {HRESULT} 
     */
    ReleasePointerCapture(value) {
        result := ComCall(94, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReleasePointerCaptures() {
        result := ComCall(95, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutedEvent} routedEvent_ 
     * @param {IInspectable} handler 
     * @param {Boolean} handledEventsToo 
     * @returns {HRESULT} 
     */
    AddHandler(routedEvent_, handler, handledEventsToo) {
        result := ComCall(96, this, "ptr", routedEvent_, "ptr", handler, "int", handledEventsToo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutedEvent} routedEvent_ 
     * @param {IInspectable} handler 
     * @returns {HRESULT} 
     */
    RemoveHandler(routedEvent_, handler) {
        result := ComCall(97, this, "ptr", routedEvent_, "ptr", handler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {UIElement} visual_ 
     * @returns {GeneralTransform} 
     */
    TransformToVisual(visual_) {
        result := ComCall(98, this, "ptr", visual_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GeneralTransform(result_)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidateMeasure() {
        result := ComCall(99, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidateArrange() {
        result := ComCall(100, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdateLayout() {
        result := ComCall(101, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
