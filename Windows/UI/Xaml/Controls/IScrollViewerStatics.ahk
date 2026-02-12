#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IScrollViewerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollViewerStatics
     * @type {Guid}
     */
    static IID => Guid("{33d1299d-8d6e-4290-bf22-905cccd04d31}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HorizontalSnapPointsAlignmentProperty", "get_VerticalSnapPointsAlignmentProperty", "get_HorizontalSnapPointsTypeProperty", "get_VerticalSnapPointsTypeProperty", "get_ZoomSnapPointsTypeProperty", "get_HorizontalOffsetProperty", "get_ViewportWidthProperty", "get_ScrollableWidthProperty", "get_ComputedHorizontalScrollBarVisibilityProperty", "get_ExtentWidthProperty", "get_VerticalOffsetProperty", "get_ViewportHeightProperty", "get_ScrollableHeightProperty", "get_ComputedVerticalScrollBarVisibilityProperty", "get_ExtentHeightProperty", "get_MinZoomFactorProperty", "get_MaxZoomFactorProperty", "get_ZoomFactorProperty", "get_ZoomSnapPointsProperty", "get_HorizontalScrollBarVisibilityProperty", "GetHorizontalScrollBarVisibility", "SetHorizontalScrollBarVisibility", "get_VerticalScrollBarVisibilityProperty", "GetVerticalScrollBarVisibility", "SetVerticalScrollBarVisibility", "get_IsHorizontalRailEnabledProperty", "GetIsHorizontalRailEnabled", "SetIsHorizontalRailEnabled", "get_IsVerticalRailEnabledProperty", "GetIsVerticalRailEnabled", "SetIsVerticalRailEnabled", "get_IsHorizontalScrollChainingEnabledProperty", "GetIsHorizontalScrollChainingEnabled", "SetIsHorizontalScrollChainingEnabled", "get_IsVerticalScrollChainingEnabledProperty", "GetIsVerticalScrollChainingEnabled", "SetIsVerticalScrollChainingEnabled", "get_IsZoomChainingEnabledProperty", "GetIsZoomChainingEnabled", "SetIsZoomChainingEnabled", "get_IsScrollInertiaEnabledProperty", "GetIsScrollInertiaEnabled", "SetIsScrollInertiaEnabled", "get_IsZoomInertiaEnabledProperty", "GetIsZoomInertiaEnabled", "SetIsZoomInertiaEnabled", "get_HorizontalScrollModeProperty", "GetHorizontalScrollMode", "SetHorizontalScrollMode", "get_VerticalScrollModeProperty", "GetVerticalScrollMode", "SetVerticalScrollMode", "get_ZoomModeProperty", "GetZoomMode", "SetZoomMode", "get_IsDeferredScrollingEnabledProperty", "GetIsDeferredScrollingEnabled", "SetIsDeferredScrollingEnabled", "get_BringIntoViewOnFocusChangeProperty", "GetBringIntoViewOnFocusChange", "SetBringIntoViewOnFocusChange"]

    /**
     * @type {DependencyProperty} 
     */
    HorizontalSnapPointsAlignmentProperty {
        get => this.get_HorizontalSnapPointsAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalSnapPointsAlignmentProperty {
        get => this.get_VerticalSnapPointsAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HorizontalSnapPointsTypeProperty {
        get => this.get_HorizontalSnapPointsTypeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalSnapPointsTypeProperty {
        get => this.get_VerticalSnapPointsTypeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ZoomSnapPointsTypeProperty {
        get => this.get_ZoomSnapPointsTypeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HorizontalOffsetProperty {
        get => this.get_HorizontalOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ViewportWidthProperty {
        get => this.get_ViewportWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ScrollableWidthProperty {
        get => this.get_ScrollableWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ComputedHorizontalScrollBarVisibilityProperty {
        get => this.get_ComputedHorizontalScrollBarVisibilityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ExtentWidthProperty {
        get => this.get_ExtentWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalOffsetProperty {
        get => this.get_VerticalOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ViewportHeightProperty {
        get => this.get_ViewportHeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ScrollableHeightProperty {
        get => this.get_ScrollableHeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ComputedVerticalScrollBarVisibilityProperty {
        get => this.get_ComputedVerticalScrollBarVisibilityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ExtentHeightProperty {
        get => this.get_ExtentHeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MinZoomFactorProperty {
        get => this.get_MinZoomFactorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxZoomFactorProperty {
        get => this.get_MaxZoomFactorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ZoomFactorProperty {
        get => this.get_ZoomFactorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ZoomSnapPointsProperty {
        get => this.get_ZoomSnapPointsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HorizontalScrollBarVisibilityProperty {
        get => this.get_HorizontalScrollBarVisibilityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalScrollBarVisibilityProperty {
        get => this.get_VerticalScrollBarVisibilityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsHorizontalRailEnabledProperty {
        get => this.get_IsHorizontalRailEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsVerticalRailEnabledProperty {
        get => this.get_IsVerticalRailEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsHorizontalScrollChainingEnabledProperty {
        get => this.get_IsHorizontalScrollChainingEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsVerticalScrollChainingEnabledProperty {
        get => this.get_IsVerticalScrollChainingEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsZoomChainingEnabledProperty {
        get => this.get_IsZoomChainingEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsScrollInertiaEnabledProperty {
        get => this.get_IsScrollInertiaEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsZoomInertiaEnabledProperty {
        get => this.get_IsZoomInertiaEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HorizontalScrollModeProperty {
        get => this.get_HorizontalScrollModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalScrollModeProperty {
        get => this.get_VerticalScrollModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ZoomModeProperty {
        get => this.get_ZoomModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsDeferredScrollingEnabledProperty {
        get => this.get_IsDeferredScrollingEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BringIntoViewOnFocusChangeProperty {
        get => this.get_BringIntoViewOnFocusChangeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HorizontalSnapPointsAlignmentProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_VerticalSnapPointsAlignmentProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HorizontalSnapPointsTypeProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_VerticalSnapPointsTypeProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ZoomSnapPointsTypeProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HorizontalOffsetProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ViewportWidthProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ScrollableWidthProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ComputedHorizontalScrollBarVisibilityProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ExtentWidthProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_VerticalOffsetProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ViewportHeightProperty() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ScrollableHeightProperty() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ComputedVerticalScrollBarVisibilityProperty() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ExtentHeightProperty() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MinZoomFactorProperty() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MaxZoomFactorProperty() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ZoomFactorProperty() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ZoomSnapPointsProperty() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HorizontalScrollBarVisibilityProperty() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetHorizontalScrollBarVisibility(element) {
        result := ComCall(26, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} horizontalScrollBarVisibility 
     * @returns {HRESULT} 
     */
    SetHorizontalScrollBarVisibility(element, horizontalScrollBarVisibility) {
        result := ComCall(27, this, "ptr", element, "int", horizontalScrollBarVisibility, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_VerticalScrollBarVisibilityProperty() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetVerticalScrollBarVisibility(element) {
        result := ComCall(29, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} verticalScrollBarVisibility 
     * @returns {HRESULT} 
     */
    SetVerticalScrollBarVisibility(element, verticalScrollBarVisibility) {
        result := ComCall(30, this, "ptr", element, "int", verticalScrollBarVisibility, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsHorizontalRailEnabledProperty() {
        result := ComCall(31, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetIsHorizontalRailEnabled(element) {
        result := ComCall(32, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} isHorizontalRailEnabled 
     * @returns {HRESULT} 
     */
    SetIsHorizontalRailEnabled(element, isHorizontalRailEnabled) {
        result := ComCall(33, this, "ptr", element, "int", isHorizontalRailEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsVerticalRailEnabledProperty() {
        result := ComCall(34, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetIsVerticalRailEnabled(element) {
        result := ComCall(35, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} isVerticalRailEnabled 
     * @returns {HRESULT} 
     */
    SetIsVerticalRailEnabled(element, isVerticalRailEnabled) {
        result := ComCall(36, this, "ptr", element, "int", isVerticalRailEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsHorizontalScrollChainingEnabledProperty() {
        result := ComCall(37, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetIsHorizontalScrollChainingEnabled(element) {
        result := ComCall(38, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} isHorizontalScrollChainingEnabled 
     * @returns {HRESULT} 
     */
    SetIsHorizontalScrollChainingEnabled(element, isHorizontalScrollChainingEnabled) {
        result := ComCall(39, this, "ptr", element, "int", isHorizontalScrollChainingEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsVerticalScrollChainingEnabledProperty() {
        result := ComCall(40, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetIsVerticalScrollChainingEnabled(element) {
        result := ComCall(41, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} isVerticalScrollChainingEnabled 
     * @returns {HRESULT} 
     */
    SetIsVerticalScrollChainingEnabled(element, isVerticalScrollChainingEnabled) {
        result := ComCall(42, this, "ptr", element, "int", isVerticalScrollChainingEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsZoomChainingEnabledProperty() {
        result := ComCall(43, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetIsZoomChainingEnabled(element) {
        result := ComCall(44, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} isZoomChainingEnabled 
     * @returns {HRESULT} 
     */
    SetIsZoomChainingEnabled(element, isZoomChainingEnabled) {
        result := ComCall(45, this, "ptr", element, "int", isZoomChainingEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsScrollInertiaEnabledProperty() {
        result := ComCall(46, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetIsScrollInertiaEnabled(element) {
        result := ComCall(47, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} isScrollInertiaEnabled 
     * @returns {HRESULT} 
     */
    SetIsScrollInertiaEnabled(element, isScrollInertiaEnabled) {
        result := ComCall(48, this, "ptr", element, "int", isScrollInertiaEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsZoomInertiaEnabledProperty() {
        result := ComCall(49, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetIsZoomInertiaEnabled(element) {
        result := ComCall(50, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} isZoomInertiaEnabled 
     * @returns {HRESULT} 
     */
    SetIsZoomInertiaEnabled(element, isZoomInertiaEnabled) {
        result := ComCall(51, this, "ptr", element, "int", isZoomInertiaEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HorizontalScrollModeProperty() {
        result := ComCall(52, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetHorizontalScrollMode(element) {
        result := ComCall(53, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} horizontalScrollMode 
     * @returns {HRESULT} 
     */
    SetHorizontalScrollMode(element, horizontalScrollMode) {
        result := ComCall(54, this, "ptr", element, "int", horizontalScrollMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_VerticalScrollModeProperty() {
        result := ComCall(55, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetVerticalScrollMode(element) {
        result := ComCall(56, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} verticalScrollMode 
     * @returns {HRESULT} 
     */
    SetVerticalScrollMode(element, verticalScrollMode) {
        result := ComCall(57, this, "ptr", element, "int", verticalScrollMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ZoomModeProperty() {
        result := ComCall(58, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetZoomMode(element) {
        result := ComCall(59, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} zoomMode_ 
     * @returns {HRESULT} 
     */
    SetZoomMode(element, zoomMode_) {
        result := ComCall(60, this, "ptr", element, "int", zoomMode_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsDeferredScrollingEnabledProperty() {
        result := ComCall(61, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetIsDeferredScrollingEnabled(element) {
        result := ComCall(62, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} isDeferredScrollingEnabled 
     * @returns {HRESULT} 
     */
    SetIsDeferredScrollingEnabled(element, isDeferredScrollingEnabled) {
        result := ComCall(63, this, "ptr", element, "int", isDeferredScrollingEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BringIntoViewOnFocusChangeProperty() {
        result := ComCall(64, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetBringIntoViewOnFocusChange(element) {
        result := ComCall(65, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} bringIntoViewOnFocusChange 
     * @returns {HRESULT} 
     */
    SetBringIntoViewOnFocusChange(element, bringIntoViewOnFocusChange) {
        result := ComCall(66, this, "ptr", element, "int", bringIntoViewOnFocusChange, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
