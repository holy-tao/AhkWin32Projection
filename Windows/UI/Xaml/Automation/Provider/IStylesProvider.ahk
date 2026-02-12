#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Color.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to the visual styles associated with the content of a document.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.istylesprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IStylesProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStylesProvider
     * @type {Guid}
     */
    static IID => Guid("{1a5b7a17-7c01-4bec-9cd4-2dfa7dc246cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExtendedProperties", "get_FillColor", "get_FillPatternColor", "get_FillPatternStyle", "get_Shape", "get_StyleId", "get_StyleName"]

    /**
     * Gets a string value that contains additional property info. The info is for properties are that are not included in this control pattern, but that provide information about the document content that might be useful to the user.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.istylesprovider.extendedproperties
     * @type {HSTRING} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

    /**
     * Gets the fill color of an element in a document.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.istylesprovider.fillcolor
     * @type {Color} 
     */
    FillColor {
        get => this.get_FillColor()
    }

    /**
     * Gets the color of the pattern used to fill an element in a document.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.istylesprovider.fillpatterncolor
     * @type {Color} 
     */
    FillPatternColor {
        get => this.get_FillPatternColor()
    }

    /**
     * Gets a string that represents the fill pattern style of an element in a document.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.istylesprovider.fillpatternstyle
     * @type {HSTRING} 
     */
    FillPatternStyle {
        get => this.get_FillPatternStyle()
    }

    /**
     * Gets a string that represents the shape of an element in a document.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.istylesprovider.shape
     * @type {HSTRING} 
     */
    Shape {
        get => this.get_Shape()
    }

    /**
     * Gets the identifier for a visual style of an element in a document.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.istylesprovider.styleid
     * @type {Integer} 
     */
    StyleId {
        get => this.get_StyleId()
    }

    /**
     * Gets the name of the visual style of an element in a document.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.istylesprovider.stylename
     * @type {HSTRING} 
     */
    StyleName {
        get => this.get_StyleName()
    }

    /**
     * Contains additional properties that are not included in this control pattern, but that provide information about the document content that might be useful to the user.
     * @remarks
     * The extended properties must be localized because they are intended to be consumed by the user.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-istylesprovider-get_extendedproperties
     */
    get_ExtendedProperties() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the fill color of an element in a document.
     * @returns {Color} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-istylesprovider-get_fillcolor
     */
    get_FillColor() {
        value := Color()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the color of the pattern used to fill an element in a document.
     * @returns {Color} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-istylesprovider-get_fillpatterncolor
     */
    get_FillPatternColor() {
        value := Color()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the fill pattern style of an element in a document.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-istylesprovider-get_fillpatternstyle
     */
    get_FillPatternStyle() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the shape of an element in a document.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-istylesprovider-get_shape
     */
    get_Shape() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-istylesprovider-get_styleid
     */
    get_StyleId() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the name of the visual style of an element in a document.
     * @remarks
     * The style name typically indicates the role of the element in the document, such as "Heading 1."
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-istylesprovider-get_stylename
     */
    get_StyleName() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
