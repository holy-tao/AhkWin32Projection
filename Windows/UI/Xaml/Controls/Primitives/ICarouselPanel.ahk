#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ICarouselPanel extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICarouselPanel
     * @type {Guid}
     */
    static IID => Guid("{deab78b2-373b-4151-8785-e544d0d9362b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanVerticallyScroll", "put_CanVerticallyScroll", "get_CanHorizontallyScroll", "put_CanHorizontallyScroll", "get_ExtentWidth", "get_ExtentHeight", "get_ViewportWidth", "get_ViewportHeight", "get_HorizontalOffset", "get_VerticalOffset", "get_ScrollOwner", "put_ScrollOwner", "LineUp", "LineDown", "LineLeft", "LineRight", "PageUp", "PageDown", "PageLeft", "PageRight", "MouseWheelUp", "MouseWheelDown", "MouseWheelLeft", "MouseWheelRight", "SetHorizontalOffset", "SetVerticalOffset", "MakeVisible"]

    /**
     * @type {Boolean} 
     */
    CanVerticallyScroll {
        get => this.get_CanVerticallyScroll()
        set => this.put_CanVerticallyScroll(value)
    }

    /**
     * @type {Boolean} 
     */
    CanHorizontallyScroll {
        get => this.get_CanHorizontallyScroll()
        set => this.put_CanHorizontallyScroll(value)
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
    ExtentHeight {
        get => this.get_ExtentHeight()
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
    ViewportHeight {
        get => this.get_ViewportHeight()
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
    VerticalOffset {
        get => this.get_VerticalOffset()
    }

    /**
     * @type {IInspectable} 
     */
    ScrollOwner {
        get => this.get_ScrollOwner()
        set => this.put_ScrollOwner(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanVerticallyScroll() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_CanVerticallyScroll(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanHorizontallyScroll() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_CanHorizontallyScroll(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExtentWidth() {
        result := ComCall(10, this, "double*", &value := 0, "int")
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
        result := ComCall(11, this, "double*", &value := 0, "int")
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
        result := ComCall(12, this, "double*", &value := 0, "int")
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
        result := ComCall(13, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalOffset() {
        result := ComCall(14, this, "double*", &value := 0, "int")
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
        result := ComCall(15, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_ScrollOwner() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_ScrollOwner(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    LineUp() {
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    LineDown() {
        result := ComCall(19, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    LineLeft() {
        result := ComCall(20, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    LineRight() {
        result := ComCall(21, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PageUp() {
        result := ComCall(22, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PageDown() {
        result := ComCall(23, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies the margin on the left of the printed page.
     * @remarks
     * This value represents physical units and is unaffected by scale or drawing units. For example, if this cell has a value of 0.25 in., this margin is 0.25 inch even if page units are feet. If units are not explicitly stated, this value defaults to page units. 
     *   
     * To get a reference to the PageLeftMargin cell by name from another formula, or from a program using the **CellsU** property, use: 
     *   
     * ||Value |
     * |:-----|:-----|
     * | **Cell name:**  <br/> | PageLeftMargin  <br/> |
     *    
     * To get a reference to the PageLeftMargin cell by index from a program, use the **CellsSRC** property with the following arguments: 
     *   
     * ||Value |
     * |:-----|:-----|
     * | **Section index:**  <br/> |**visSectionObject** <br/> |
     * | **Row index:**  <br/> |**visRowPrintProperties** <br/> |
     * | **Cell index:**  <br/> |**visPrintPropertiesLeftMargin** <br/> |
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/pageleftmargin-cell-print-properties-section
     */
    PageLeft() {
        result := ComCall(24, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies the margin on the right of the printed page.
     * @remarks
     * This value represents physical units and is unaffected by scale or drawing units. For example, if this cell has a value of 0.25 in., this margin is 0.25 inch even if page units are feet. If units are not explicitly stated, this value defaults to page units. 
     *   
     * To get a reference to the PageRightMargin cell by name from another formula, or from a program using the **CellsU** property, use: 
     *   
     * ||Value |
     * |:-----|:-----|
     * | **Cell name:**  <br/> | PageRightMargin  <br/> |
     *    
     * To get a reference to the PageRightMargin cell by index from a program, use the **CellsSRC** property with the following arguments: 
     *   
     * ||Value |
     * |:-----|:-----|
     * | **Section index:**  <br/> |**visSectionObject** <br/> |
     * | **Row index:**  <br/> |**visRowPrintProperties** <br/> |
     * | **Cell index:**  <br/> |**visPrintPropertiesRightMargin** <br/> |
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/pagerightmargin-cell-print-properties-section
     */
    PageRight() {
        result := ComCall(25, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MouseWheelUp() {
        result := ComCall(26, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MouseWheelDown() {
        result := ComCall(27, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MouseWheelLeft() {
        result := ComCall(28, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MouseWheelRight() {
        result := ComCall(29, this, "int")
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
    SetHorizontalOffset(offset) {
        result := ComCall(30, this, "double", offset, "int")
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
    SetVerticalOffset(offset) {
        result := ComCall(31, this, "double", offset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {UIElement} visual_ 
     * @param {RECT} rectangle_ 
     * @returns {RECT} 
     */
    MakeVisible(visual_, rectangle_) {
        result_ := RECT()
        result := ComCall(32, this, "ptr", visual_, "ptr", rectangle_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
