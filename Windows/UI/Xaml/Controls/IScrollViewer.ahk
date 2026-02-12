#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IScrollViewer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollViewer
     * @type {Guid}
     */
    static IID => Guid("{64e9be00-4dc1-493d-abe7-cbd3c577490d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HorizontalScrollBarVisibility", "put_HorizontalScrollBarVisibility", "get_VerticalScrollBarVisibility", "put_VerticalScrollBarVisibility", "get_IsHorizontalRailEnabled", "put_IsHorizontalRailEnabled", "get_IsVerticalRailEnabled", "put_IsVerticalRailEnabled", "get_IsHorizontalScrollChainingEnabled", "put_IsHorizontalScrollChainingEnabled", "get_IsVerticalScrollChainingEnabled", "put_IsVerticalScrollChainingEnabled", "get_IsZoomChainingEnabled", "put_IsZoomChainingEnabled", "get_IsScrollInertiaEnabled", "put_IsScrollInertiaEnabled", "get_IsZoomInertiaEnabled", "put_IsZoomInertiaEnabled", "get_HorizontalScrollMode", "put_HorizontalScrollMode", "get_VerticalScrollMode", "put_VerticalScrollMode", "get_ZoomMode", "put_ZoomMode", "get_HorizontalSnapPointsAlignment", "put_HorizontalSnapPointsAlignment", "get_VerticalSnapPointsAlignment", "put_VerticalSnapPointsAlignment", "get_HorizontalSnapPointsType", "put_HorizontalSnapPointsType", "get_VerticalSnapPointsType", "put_VerticalSnapPointsType", "get_ZoomSnapPointsType", "put_ZoomSnapPointsType", "get_HorizontalOffset", "get_ViewportWidth", "get_ScrollableWidth", "get_ComputedHorizontalScrollBarVisibility", "get_ExtentWidth", "get_VerticalOffset", "get_ViewportHeight", "get_ScrollableHeight", "get_ComputedVerticalScrollBarVisibility", "get_ExtentHeight", "get_MinZoomFactor", "put_MinZoomFactor", "get_MaxZoomFactor", "put_MaxZoomFactor", "get_ZoomFactor", "get_ZoomSnapPoints", "add_ViewChanged", "remove_ViewChanged", "ScrollToHorizontalOffset", "ScrollToVerticalOffset", "ZoomToFactor", "InvalidateScrollInfo", "get_IsDeferredScrollingEnabled", "put_IsDeferredScrollingEnabled", "get_BringIntoViewOnFocusChange", "put_BringIntoViewOnFocusChange"]

    /**
     * @type {Integer} 
     */
    HorizontalScrollBarVisibility {
        get => this.get_HorizontalScrollBarVisibility()
        set => this.put_HorizontalScrollBarVisibility(value)
    }

    /**
     * @type {Integer} 
     */
    VerticalScrollBarVisibility {
        get => this.get_VerticalScrollBarVisibility()
        set => this.put_VerticalScrollBarVisibility(value)
    }

    /**
     * @type {Boolean} 
     */
    IsHorizontalRailEnabled {
        get => this.get_IsHorizontalRailEnabled()
        set => this.put_IsHorizontalRailEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsVerticalRailEnabled {
        get => this.get_IsVerticalRailEnabled()
        set => this.put_IsVerticalRailEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsHorizontalScrollChainingEnabled {
        get => this.get_IsHorizontalScrollChainingEnabled()
        set => this.put_IsHorizontalScrollChainingEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsVerticalScrollChainingEnabled {
        get => this.get_IsVerticalScrollChainingEnabled()
        set => this.put_IsVerticalScrollChainingEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsZoomChainingEnabled {
        get => this.get_IsZoomChainingEnabled()
        set => this.put_IsZoomChainingEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsScrollInertiaEnabled {
        get => this.get_IsScrollInertiaEnabled()
        set => this.put_IsScrollInertiaEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsZoomInertiaEnabled {
        get => this.get_IsZoomInertiaEnabled()
        set => this.put_IsZoomInertiaEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    HorizontalScrollMode {
        get => this.get_HorizontalScrollMode()
        set => this.put_HorizontalScrollMode(value)
    }

    /**
     * @type {Integer} 
     */
    VerticalScrollMode {
        get => this.get_VerticalScrollMode()
        set => this.put_VerticalScrollMode(value)
    }

    /**
     * @type {Integer} 
     */
    ZoomMode {
        get => this.get_ZoomMode()
        set => this.put_ZoomMode(value)
    }

    /**
     * @type {Integer} 
     */
    HorizontalSnapPointsAlignment {
        get => this.get_HorizontalSnapPointsAlignment()
        set => this.put_HorizontalSnapPointsAlignment(value)
    }

    /**
     * @type {Integer} 
     */
    VerticalSnapPointsAlignment {
        get => this.get_VerticalSnapPointsAlignment()
        set => this.put_VerticalSnapPointsAlignment(value)
    }

    /**
     * @type {Integer} 
     */
    HorizontalSnapPointsType {
        get => this.get_HorizontalSnapPointsType()
        set => this.put_HorizontalSnapPointsType(value)
    }

    /**
     * @type {Integer} 
     */
    VerticalSnapPointsType {
        get => this.get_VerticalSnapPointsType()
        set => this.put_VerticalSnapPointsType(value)
    }

    /**
     * @type {Integer} 
     */
    ZoomSnapPointsType {
        get => this.get_ZoomSnapPointsType()
        set => this.put_ZoomSnapPointsType(value)
    }

    /**
     * @type {Float} 
     */
    HorizontalOffset {
        get => this.get_HorizontalOffset()
    }

    /**
     * @type {Float} 
     */
    ViewportWidth {
        get => this.get_ViewportWidth()
    }

    /**
     * @type {Float} 
     */
    ScrollableWidth {
        get => this.get_ScrollableWidth()
    }

    /**
     * @type {Integer} 
     */
    ComputedHorizontalScrollBarVisibility {
        get => this.get_ComputedHorizontalScrollBarVisibility()
    }

    /**
     * @type {Float} 
     */
    ExtentWidth {
        get => this.get_ExtentWidth()
    }

    /**
     * @type {Float} 
     */
    VerticalOffset {
        get => this.get_VerticalOffset()
    }

    /**
     * @type {Float} 
     */
    ViewportHeight {
        get => this.get_ViewportHeight()
    }

    /**
     * @type {Float} 
     */
    ScrollableHeight {
        get => this.get_ScrollableHeight()
    }

    /**
     * @type {Integer} 
     */
    ComputedVerticalScrollBarVisibility {
        get => this.get_ComputedVerticalScrollBarVisibility()
    }

    /**
     * @type {Float} 
     */
    ExtentHeight {
        get => this.get_ExtentHeight()
    }

    /**
     * @type {Float} 
     */
    MinZoomFactor {
        get => this.get_MinZoomFactor()
        set => this.put_MinZoomFactor(value)
    }

    /**
     * @type {Float} 
     */
    MaxZoomFactor {
        get => this.get_MaxZoomFactor()
        set => this.put_MaxZoomFactor(value)
    }

    /**
     * @type {Float} 
     */
    ZoomFactor {
        get => this.get_ZoomFactor()
    }

    /**
     * @type {IVector<Float>} 
     */
    ZoomSnapPoints {
        get => this.get_ZoomSnapPoints()
    }

    /**
     * @type {Boolean} 
     */
    IsDeferredScrollingEnabled {
        get => this.get_IsDeferredScrollingEnabled()
        set => this.put_IsDeferredScrollingEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    BringIntoViewOnFocusChange {
        get => this.get_BringIntoViewOnFocusChange()
        set => this.put_BringIntoViewOnFocusChange(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalScrollBarVisibility() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_HorizontalScrollBarVisibility(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalScrollBarVisibility() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_VerticalScrollBarVisibility(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHorizontalRailEnabled() {
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
    put_IsHorizontalRailEnabled(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVerticalRailEnabled() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_IsVerticalRailEnabled(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHorizontalScrollChainingEnabled() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_IsHorizontalScrollChainingEnabled(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVerticalScrollChainingEnabled() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_IsVerticalScrollChainingEnabled(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsZoomChainingEnabled() {
        result := ComCall(18, this, "int*", &value := 0, "int")
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
    put_IsZoomChainingEnabled(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScrollInertiaEnabled() {
        result := ComCall(20, this, "int*", &value := 0, "int")
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
    put_IsScrollInertiaEnabled(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsZoomInertiaEnabled() {
        result := ComCall(22, this, "int*", &value := 0, "int")
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
    put_IsZoomInertiaEnabled(value) {
        result := ComCall(23, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalScrollMode() {
        result := ComCall(24, this, "int*", &value := 0, "int")
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
    put_HorizontalScrollMode(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalScrollMode() {
        result := ComCall(26, this, "int*", &value := 0, "int")
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
    put_VerticalScrollMode(value) {
        result := ComCall(27, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ZoomMode() {
        result := ComCall(28, this, "int*", &value := 0, "int")
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
    put_ZoomMode(value) {
        result := ComCall(29, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalSnapPointsAlignment() {
        result := ComCall(30, this, "int*", &value := 0, "int")
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
    put_HorizontalSnapPointsAlignment(value) {
        result := ComCall(31, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalSnapPointsAlignment() {
        result := ComCall(32, this, "int*", &value := 0, "int")
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
    put_VerticalSnapPointsAlignment(value) {
        result := ComCall(33, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalSnapPointsType() {
        result := ComCall(34, this, "int*", &value := 0, "int")
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
    put_HorizontalSnapPointsType(value) {
        result := ComCall(35, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalSnapPointsType() {
        result := ComCall(36, this, "int*", &value := 0, "int")
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
    put_VerticalSnapPointsType(value) {
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
    get_ZoomSnapPointsType() {
        result := ComCall(38, this, "int*", &value := 0, "int")
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
    put_ZoomSnapPointsType(value) {
        result := ComCall(39, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalOffset() {
        result := ComCall(40, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ViewportWidth() {
        result := ComCall(41, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScrollableWidth() {
        result := ComCall(42, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ComputedHorizontalScrollBarVisibility() {
        result := ComCall(43, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExtentWidth() {
        result := ComCall(44, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalOffset() {
        result := ComCall(45, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ViewportHeight() {
        result := ComCall(46, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScrollableHeight() {
        result := ComCall(47, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ComputedVerticalScrollBarVisibility() {
        result := ComCall(48, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExtentHeight() {
        result := ComCall(49, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinZoomFactor() {
        result := ComCall(50, this, "float*", &value := 0, "int")
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
    put_MinZoomFactor(value) {
        result := ComCall(51, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxZoomFactor() {
        result := ComCall(52, this, "float*", &value := 0, "int")
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
    put_MaxZoomFactor(value) {
        result := ComCall(53, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ZoomFactor() {
        result := ComCall(54, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<Float>} 
     */
    get_ZoomSnapPoints() {
        result := ComCall(55, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetSingle(), value)
    }

    /**
     * 
     * @param {EventHandler<ScrollViewerViewChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ViewChanged(handler) {
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
    remove_ViewChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(57, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} offset 
     * @returns {HRESULT} 
     */
    ScrollToHorizontalOffset(offset) {
        result := ComCall(58, this, "double", offset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} offset 
     * @returns {HRESULT} 
     */
    ScrollToVerticalOffset(offset) {
        result := ComCall(59, this, "double", offset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} factor 
     * @returns {HRESULT} 
     */
    ZoomToFactor(factor) {
        result := ComCall(60, this, "float", factor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidateScrollInfo() {
        result := ComCall(61, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDeferredScrollingEnabled() {
        result := ComCall(62, this, "int*", &value := 0, "int")
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
    put_IsDeferredScrollingEnabled(value) {
        result := ComCall(63, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_BringIntoViewOnFocusChange() {
        result := ComCall(64, this, "int*", &value := 0, "int")
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
    put_BringIntoViewOnFocusChange(value) {
        result := ComCall(65, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
