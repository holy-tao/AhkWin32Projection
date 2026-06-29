#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\UIA_STYLE_ID.ahk" { UIA_STYLE_ID }

/**
 * Provides access to the visual styles associated with the content of a document.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-istylesprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IStylesProvider extends IUnknown {
    /**
     * The interface identifier for IStylesProvider
     * @type {Guid}
     */
    static IID := Guid("{19b6b649-f5d7-4a6d-bdcb-129252be588a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStylesProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_StyleId            : IntPtr
        get_StyleName          : IntPtr
        get_FillColor          : IntPtr
        get_FillPatternStyle   : IntPtr
        get_Shape              : IntPtr
        get_FillPatternColor   : IntPtr
        get_ExtendedProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStylesProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {UIA_STYLE_ID} 
     */
    StyleId {
        get => this.get_StyleId()
    }

    /**
     * @type {BSTR} 
     */
    StyleName {
        get => this.get_StyleName()
    }

    /**
     * @type {Integer} 
     */
    FillColor {
        get => this.get_FillColor()
    }

    /**
     * @type {BSTR} 
     */
    FillPatternStyle {
        get => this.get_FillPatternStyle()
    }

    /**
     * @type {BSTR} 
     */
    Shape {
        get => this.get_Shape()
    }

    /**
     * @type {Integer} 
     */
    FillPatternColor {
        get => this.get_FillPatternColor()
    }

    /**
     * @type {BSTR} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

    /**
     * Identifies the visual style of an element in a document.
     * @remarks
     * A provider should use this property to expose style identifiers that are useful to client applications. For example, a provider might expose the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-style-identifiers">StyleId_Title</a> identifier for an element that represents the title of a presentation. A screen reader could then retrieve the <b>StyleId</b> property, discover that the element is a presentation title, and read the title to the user.
     * 
     * <h3><a id="List_Styles"></a><a id="list_styles"></a><a id="LIST_STYLES"></a>List Styles</h3>
     * IDs for list styles are supported starting with Windows 8.1. 
     * 
     * These styles should be applied at a paragraph level; all text that is part of a list item should have one of these styles applied to it.
     * 
     * When bullet styles are mixed within a list, the <b>BulletedList</b> style should be applied to the whole range, and the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-bulletstyle">BulletStyle</a> attribute value (property identified by <b>UIA_BulletStyleAttributeId</b>) should be mixed according to breakdown of different bullet types within the range.
     * 
     * When nested lists contain bullets also (perhaps of a different type than the main list), the <b>BulletedList</b> style would again be applied to the whole range, and the <b>BulletStyle</b> attribute value is whatever the nested bullet style is (for the range covering the nested list).
     * @returns {UIA_STYLE_ID} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-istylesprovider-get_styleid
     */
    get_StyleId() {
        result := ComCall(3, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Specifies the name of the visual style of an element in a document.
     * @remarks
     * The style name typically indicates the role of the element in the document, such as "Heading 1."
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-istylesprovider-get_stylename
     */
    get_StyleName() {
        retVal := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Specifies the fill color of an element in a document.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-istylesprovider-get_fillcolor
     */
    get_FillColor() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Specifies the fill pattern style of an element in a document.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-istylesprovider-get_fillpatternstyle
     */
    get_FillPatternStyle() {
        retVal := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Specifies the shape of an element in a document.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-istylesprovider-get_shape
     */
    get_Shape() {
        retVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Specifies the color of the pattern used to fill an element in a document.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-istylesprovider-get_fillpatterncolor
     */
    get_FillPatternColor() {
        result := ComCall(8, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Contains additional properties that are not included in this control pattern, but that provide information about the document content that might be useful to the user.
     * @remarks
     * The extended properties must be localized because they are intended to be consumed by the user.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-istylesprovider-get_extendedproperties
     */
    get_ExtendedProperties() {
        retVal := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IStylesProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_StyleId := CallbackCreate(GetMethod(implObj, "get_StyleId"), flags, 2)
        this.vtbl.get_StyleName := CallbackCreate(GetMethod(implObj, "get_StyleName"), flags, 2)
        this.vtbl.get_FillColor := CallbackCreate(GetMethod(implObj, "get_FillColor"), flags, 2)
        this.vtbl.get_FillPatternStyle := CallbackCreate(GetMethod(implObj, "get_FillPatternStyle"), flags, 2)
        this.vtbl.get_Shape := CallbackCreate(GetMethod(implObj, "get_Shape"), flags, 2)
        this.vtbl.get_FillPatternColor := CallbackCreate(GetMethod(implObj, "get_FillPatternColor"), flags, 2)
        this.vtbl.get_ExtendedProperties := CallbackCreate(GetMethod(implObj, "get_ExtendedProperties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_StyleId)
        CallbackFree(this.vtbl.get_StyleName)
        CallbackFree(this.vtbl.get_FillColor)
        CallbackFree(this.vtbl.get_FillPatternStyle)
        CallbackFree(this.vtbl.get_Shape)
        CallbackFree(this.vtbl.get_FillPatternColor)
        CallbackFree(this.vtbl.get_ExtendedProperties)
    }
}
