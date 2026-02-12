#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRelativePanelStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRelativePanelStatics
     * @type {Guid}
     */
    static IID => Guid("{15903c27-f18c-4c35-8e19-6a7459d907b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LeftOfProperty", "GetLeftOf", "SetLeftOf", "get_AboveProperty", "GetAbove", "SetAbove", "get_RightOfProperty", "GetRightOf", "SetRightOf", "get_BelowProperty", "GetBelow", "SetBelow", "get_AlignHorizontalCenterWithProperty", "GetAlignHorizontalCenterWith", "SetAlignHorizontalCenterWith", "get_AlignVerticalCenterWithProperty", "GetAlignVerticalCenterWith", "SetAlignVerticalCenterWith", "get_AlignLeftWithProperty", "GetAlignLeftWith", "SetAlignLeftWith", "get_AlignTopWithProperty", "GetAlignTopWith", "SetAlignTopWith", "get_AlignRightWithProperty", "GetAlignRightWith", "SetAlignRightWith", "get_AlignBottomWithProperty", "GetAlignBottomWith", "SetAlignBottomWith", "get_AlignLeftWithPanelProperty", "GetAlignLeftWithPanel", "SetAlignLeftWithPanel", "get_AlignTopWithPanelProperty", "GetAlignTopWithPanel", "SetAlignTopWithPanel", "get_AlignRightWithPanelProperty", "GetAlignRightWithPanel", "SetAlignRightWithPanel", "get_AlignBottomWithPanelProperty", "GetAlignBottomWithPanel", "SetAlignBottomWithPanel", "get_AlignHorizontalCenterWithPanelProperty", "GetAlignHorizontalCenterWithPanel", "SetAlignHorizontalCenterWithPanel", "get_AlignVerticalCenterWithPanelProperty", "GetAlignVerticalCenterWithPanel", "SetAlignVerticalCenterWithPanel", "get_BorderBrushProperty", "get_BorderThicknessProperty", "get_CornerRadiusProperty", "get_PaddingProperty"]

    /**
     * @type {DependencyProperty} 
     */
    LeftOfProperty {
        get => this.get_LeftOfProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AboveProperty {
        get => this.get_AboveProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RightOfProperty {
        get => this.get_RightOfProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BelowProperty {
        get => this.get_BelowProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AlignHorizontalCenterWithProperty {
        get => this.get_AlignHorizontalCenterWithProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AlignVerticalCenterWithProperty {
        get => this.get_AlignVerticalCenterWithProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AlignLeftWithProperty {
        get => this.get_AlignLeftWithProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AlignTopWithProperty {
        get => this.get_AlignTopWithProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AlignRightWithProperty {
        get => this.get_AlignRightWithProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AlignBottomWithProperty {
        get => this.get_AlignBottomWithProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AlignLeftWithPanelProperty {
        get => this.get_AlignLeftWithPanelProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AlignTopWithPanelProperty {
        get => this.get_AlignTopWithPanelProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AlignRightWithPanelProperty {
        get => this.get_AlignRightWithPanelProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AlignBottomWithPanelProperty {
        get => this.get_AlignBottomWithPanelProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AlignHorizontalCenterWithPanelProperty {
        get => this.get_AlignHorizontalCenterWithPanelProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AlignVerticalCenterWithPanelProperty {
        get => this.get_AlignVerticalCenterWithPanelProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BorderBrushProperty {
        get => this.get_BorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BorderThicknessProperty {
        get => this.get_BorderThicknessProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CornerRadiusProperty {
        get => this.get_CornerRadiusProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PaddingProperty {
        get => this.get_PaddingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LeftOfProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {IInspectable} 
     */
    GetLeftOf(element) {
        result := ComCall(7, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    SetLeftOf(element, value) {
        result := ComCall(8, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AboveProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {IInspectable} 
     */
    GetAbove(element) {
        result := ComCall(10, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    SetAbove(element, value) {
        result := ComCall(11, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_RightOfProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {IInspectable} 
     */
    GetRightOf(element) {
        result := ComCall(13, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    SetRightOf(element, value) {
        result := ComCall(14, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BelowProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {IInspectable} 
     */
    GetBelow(element) {
        result := ComCall(16, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    SetBelow(element, value) {
        result := ComCall(17, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AlignHorizontalCenterWithProperty() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {IInspectable} 
     */
    GetAlignHorizontalCenterWith(element) {
        result := ComCall(19, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    SetAlignHorizontalCenterWith(element, value) {
        result := ComCall(20, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AlignVerticalCenterWithProperty() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {IInspectable} 
     */
    GetAlignVerticalCenterWith(element) {
        result := ComCall(22, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    SetAlignVerticalCenterWith(element, value) {
        result := ComCall(23, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AlignLeftWithProperty() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {IInspectable} 
     */
    GetAlignLeftWith(element) {
        result := ComCall(25, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    SetAlignLeftWith(element, value) {
        result := ComCall(26, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AlignTopWithProperty() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {IInspectable} 
     */
    GetAlignTopWith(element) {
        result := ComCall(28, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    SetAlignTopWith(element, value) {
        result := ComCall(29, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AlignRightWithProperty() {
        result := ComCall(30, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {IInspectable} 
     */
    GetAlignRightWith(element) {
        result := ComCall(31, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    SetAlignRightWith(element, value) {
        result := ComCall(32, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AlignBottomWithProperty() {
        result := ComCall(33, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {IInspectable} 
     */
    GetAlignBottomWith(element) {
        result := ComCall(34, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    SetAlignBottomWith(element, value) {
        result := ComCall(35, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AlignLeftWithPanelProperty() {
        result := ComCall(36, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {Boolean} 
     */
    GetAlignLeftWithPanel(element) {
        result := ComCall(37, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetAlignLeftWithPanel(element, value) {
        result := ComCall(38, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AlignTopWithPanelProperty() {
        result := ComCall(39, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {Boolean} 
     */
    GetAlignTopWithPanel(element) {
        result := ComCall(40, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetAlignTopWithPanel(element, value) {
        result := ComCall(41, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AlignRightWithPanelProperty() {
        result := ComCall(42, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {Boolean} 
     */
    GetAlignRightWithPanel(element) {
        result := ComCall(43, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetAlignRightWithPanel(element, value) {
        result := ComCall(44, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AlignBottomWithPanelProperty() {
        result := ComCall(45, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {Boolean} 
     */
    GetAlignBottomWithPanel(element) {
        result := ComCall(46, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetAlignBottomWithPanel(element, value) {
        result := ComCall(47, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AlignHorizontalCenterWithPanelProperty() {
        result := ComCall(48, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {Boolean} 
     */
    GetAlignHorizontalCenterWithPanel(element) {
        result := ComCall(49, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetAlignHorizontalCenterWithPanel(element, value) {
        result := ComCall(50, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AlignVerticalCenterWithPanelProperty() {
        result := ComCall(51, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {Boolean} 
     */
    GetAlignVerticalCenterWithPanel(element) {
        result := ComCall(52, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetAlignVerticalCenterWithPanel(element, value) {
        result := ComCall(53, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BorderBrushProperty() {
        result := ComCall(54, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BorderThicknessProperty() {
        result := ComCall(55, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CornerRadiusProperty() {
        result := ComCall(56, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PaddingProperty() {
        result := ComCall(57, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
