#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITextRangeProvider.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to controls that contain text.
 * @remarks
 * 
 * Implemented on a Microsoft UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingtextandtextrange">Text</a> control pattern.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-itextprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ITextProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextProvider
     * @type {Guid}
     */
    static IID => Guid("{3589c92c-63f3-4367-99bb-ada653b77cf2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSelection", "GetVisibleRanges", "RangeFromChild", "RangeFromPoint", "get_DocumentRange", "get_SupportedTextSelection"]

    /**
     * @type {ITextRangeProvider} 
     */
    DocumentRange {
        get => this.get_DocumentRange()
    }

    /**
     * @type {Integer} 
     */
    SupportedTextSelection {
        get => this.get_SupportedTextSelection()
    }

    /**
     * Retrieves a collection of text ranges that represents the currently selected text in a text-based control.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives the address of an array of pointers to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a> interfaces of the text ranges,
     * 				one for each selected span of text. This parameter is passed uninitialized.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextprovider-getselection
     */
    GetSelection() {
        result := ComCall(3, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves an array of disjoint text ranges from a text-based control where each text range represents a contiguous span of visible text.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives the address of an array of pointers to the 
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a> interfaces of the visible 
     *                 text ranges or an empty array. 
     *                 A <b>NULL</b> reference is never returned.
     * 				This parameter is passed uninitialized.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextprovider-getvisibleranges
     */
    GetVisibleRanges() {
        result := ComCall(4, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves a text range enclosing a child element such as an image, hyperlink, or other embedded object.
     * @param {IRawElementProviderSimple} childElement Type: **[IRawElementProviderSimple](nn-uiautomationcore-irawelementprovidersimple.md)\***
     * 
     * The UI Automation provider of the specified child element.
     * @returns {ITextRangeProvider} Type: **[ITextRangeProvider](nn-uiautomationcore-itextrangeprovider.md)\*\***
     * 
     * The text range that encloses the child element.
     * 
     * This range completely encloses the content of the child element such that:
     * 
     * 1. [ITextRangeProvider::GetEnclosingElement](nf-uiautomationcore-itextrangeprovider-getenclosingelement.md) returns the child element itself, or the innermost descendant of the child element that shares the same text range as the child element
     * 2. [ITextRangeProvider::GetChildren](nf-uiautomationcore-itextrangeprovider-getchildren.md) returns children of the element from (1) that are completely enclosed within the range
     * 3. Both endpoints of the range are at the boundaries of the child element
     * 
     * This parameter is passed uninitialized.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextprovider-rangefromchild
     */
    RangeFromChild(childElement) {
        result := ComCall(5, this, "ptr", childElement, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    /**
     * Returns the degenerate (empty) text range nearest to the specified screen coordinates.
     * @param {UiaPoint} point Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiapoint">UiaPoint</a></b>
     * 
     * The location in screen coordinates.
     * @returns {ITextRangeProvider} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>**</b>
     * 
     * Receives a pointer to the degenerate (empty) text range 
     * 				nearest the specified location. This parameter is passed uninitialized.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextprovider-rangefrompoint
     */
    RangeFromPoint(point) {
        result := ComCall(6, this, "ptr", point, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    /**
     * Retrieves a text range that encloses the main text of a document.
     * @remarks
     * 
     * Some auxiliary text such as headers, footnotes, or annotations may not be included.
     * 
     * 
     * @returns {ITextRangeProvider} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextprovider-get_documentrange
     */
    get_DocumentRange() {
        result := ComCall(7, this, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    /**
     * Retrieves a value that specifies the type of text selection that is supported by the control.
     * @remarks
     * 
     * > ### Parameters
     * >
     * > `pRetVal` [out]
     * >
     * > Type: **[SupportedTextSelection](../uiautomationcore/ne-uiautomationcore-supportedtextselection.md)\***
     * >
     * > When this function returns, contains a pointer to the [SupportedTextSelection](../uiautomationcore/ne-uiautomationcore-supportedtextselection.md) object.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextprovider-get_supportedtextselection
     */
    get_SupportedTextSelection() {
        result := ComCall(8, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}
