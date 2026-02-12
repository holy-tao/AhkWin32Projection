#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RoutedEvent.ahk
#Include .\DependencyProperty.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElementStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElementStatics
     * @type {Guid}
     */
    static IID => Guid("{58d3573b-f52c-45be-988b-a5869564873c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeyDownEvent", "get_KeyUpEvent", "get_PointerEnteredEvent", "get_PointerPressedEvent", "get_PointerMovedEvent", "get_PointerReleasedEvent", "get_PointerExitedEvent", "get_PointerCaptureLostEvent", "get_PointerCanceledEvent", "get_PointerWheelChangedEvent", "get_TappedEvent", "get_DoubleTappedEvent", "get_HoldingEvent", "get_RightTappedEvent", "get_ManipulationStartingEvent", "get_ManipulationInertiaStartingEvent", "get_ManipulationStartedEvent", "get_ManipulationDeltaEvent", "get_ManipulationCompletedEvent", "get_DragEnterEvent", "get_DragLeaveEvent", "get_DragOverEvent", "get_DropEvent", "get_AllowDropProperty", "get_OpacityProperty", "get_ClipProperty", "get_RenderTransformProperty", "get_ProjectionProperty", "get_RenderTransformOriginProperty", "get_IsHitTestVisibleProperty", "get_VisibilityProperty", "get_UseLayoutRoundingProperty", "get_TransitionsProperty", "get_CacheModeProperty", "get_IsTapEnabledProperty", "get_IsDoubleTapEnabledProperty", "get_IsRightTapEnabledProperty", "get_IsHoldingEnabledProperty", "get_ManipulationModeProperty", "get_PointerCapturesProperty"]

    /**
     * @type {RoutedEvent} 
     */
    KeyDownEvent {
        get => this.get_KeyDownEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    KeyUpEvent {
        get => this.get_KeyUpEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    PointerEnteredEvent {
        get => this.get_PointerEnteredEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    PointerPressedEvent {
        get => this.get_PointerPressedEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    PointerMovedEvent {
        get => this.get_PointerMovedEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    PointerReleasedEvent {
        get => this.get_PointerReleasedEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    PointerExitedEvent {
        get => this.get_PointerExitedEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    PointerCaptureLostEvent {
        get => this.get_PointerCaptureLostEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    PointerCanceledEvent {
        get => this.get_PointerCanceledEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    PointerWheelChangedEvent {
        get => this.get_PointerWheelChangedEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    TappedEvent {
        get => this.get_TappedEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    DoubleTappedEvent {
        get => this.get_DoubleTappedEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    HoldingEvent {
        get => this.get_HoldingEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    RightTappedEvent {
        get => this.get_RightTappedEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    ManipulationStartingEvent {
        get => this.get_ManipulationStartingEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    ManipulationInertiaStartingEvent {
        get => this.get_ManipulationInertiaStartingEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    ManipulationStartedEvent {
        get => this.get_ManipulationStartedEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    ManipulationDeltaEvent {
        get => this.get_ManipulationDeltaEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    ManipulationCompletedEvent {
        get => this.get_ManipulationCompletedEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    DragEnterEvent {
        get => this.get_DragEnterEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    DragLeaveEvent {
        get => this.get_DragLeaveEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    DragOverEvent {
        get => this.get_DragOverEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    DropEvent {
        get => this.get_DropEvent()
    }

    /**
     * @type {DependencyProperty} 
     */
    AllowDropProperty {
        get => this.get_AllowDropProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OpacityProperty {
        get => this.get_OpacityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ClipProperty {
        get => this.get_ClipProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RenderTransformProperty {
        get => this.get_RenderTransformProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ProjectionProperty {
        get => this.get_ProjectionProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RenderTransformOriginProperty {
        get => this.get_RenderTransformOriginProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsHitTestVisibleProperty {
        get => this.get_IsHitTestVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VisibilityProperty {
        get => this.get_VisibilityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    UseLayoutRoundingProperty {
        get => this.get_UseLayoutRoundingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TransitionsProperty {
        get => this.get_TransitionsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CacheModeProperty {
        get => this.get_CacheModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsTapEnabledProperty {
        get => this.get_IsTapEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsDoubleTapEnabledProperty {
        get => this.get_IsDoubleTapEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsRightTapEnabledProperty {
        get => this.get_IsRightTapEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsHoldingEnabledProperty {
        get => this.get_IsHoldingEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ManipulationModeProperty {
        get => this.get_ManipulationModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PointerCapturesProperty {
        get => this.get_PointerCapturesProperty()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_KeyDownEvent() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_KeyUpEvent() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_PointerEnteredEvent() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_PointerPressedEvent() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_PointerMovedEvent() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_PointerReleasedEvent() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_PointerExitedEvent() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_PointerCaptureLostEvent() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_PointerCanceledEvent() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_PointerWheelChangedEvent() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_TappedEvent() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_DoubleTappedEvent() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_HoldingEvent() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_RightTappedEvent() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_ManipulationStartingEvent() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_ManipulationInertiaStartingEvent() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_ManipulationStartedEvent() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_ManipulationDeltaEvent() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_ManipulationCompletedEvent() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_DragEnterEvent() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_DragLeaveEvent() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_DragOverEvent() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_DropEvent() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AllowDropProperty() {
        result := ComCall(29, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_OpacityProperty() {
        result := ComCall(30, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ClipProperty() {
        result := ComCall(31, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_RenderTransformProperty() {
        result := ComCall(32, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ProjectionProperty() {
        result := ComCall(33, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_RenderTransformOriginProperty() {
        result := ComCall(34, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsHitTestVisibleProperty() {
        result := ComCall(35, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_VisibilityProperty() {
        result := ComCall(36, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_UseLayoutRoundingProperty() {
        result := ComCall(37, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TransitionsProperty() {
        result := ComCall(38, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CacheModeProperty() {
        result := ComCall(39, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsTapEnabledProperty() {
        result := ComCall(40, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsDoubleTapEnabledProperty() {
        result := ComCall(41, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsRightTapEnabledProperty() {
        result := ComCall(42, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsHoldingEnabledProperty() {
        result := ComCall(43, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ManipulationModeProperty() {
        result := ComCall(44, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PointerCapturesProperty() {
        result := ComCall(45, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
