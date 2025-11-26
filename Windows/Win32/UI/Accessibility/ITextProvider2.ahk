#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITextRangeProvider.ahk
#Include .\ITextProvider.ahk

/**
 * Extends the ITextProvider interface to enable Microsoft UI Automation providers to expose textual content that is the target of an annotation, and information about a caret that belongs to the provider.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-itextprovider2
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ITextProvider2 extends ITextProvider{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextProvider2
     * @type {Guid}
     */
    static IID => Guid("{0dc5e6ed-3e16-4bf1-8f9a-a979878bc195}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RangeFromAnnotation", "GetCaretRange"]

    /**
     * Exposes a text range that contains the text that is the target of the annotation associated with the specified annotation element.
     * @param {IRawElementProviderSimple} annotationElement Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * The provider for an element that implements the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iannotationprovider">IAnnotationProvider</a> interface. The annotation element is a sibling of the element that implements the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextprovider2">ITextProvider2</a> interface for the document.
     * @returns {ITextRangeProvider} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>**</b>
     * 
     * Receives a text range that contains the annotation target text.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextprovider2-rangefromannotation
     */
    RangeFromAnnotation(annotationElement) {
        result := ComCall(9, this, "ptr", annotationElement, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    /**
     * Provides a zero-length text range at the location of the caret that belongs to the text-based control.
     * @param {Pointer<BOOL>} isActive Type: <b>BOOL*</b>
     * 
     * <b>TRUE</b> if the text-based control that contains the caret has keyboard focus, otherwise <b>FALSE</b>.
     * @returns {ITextRangeProvider} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>**</b>
     * 
     *  A text range that represents the current location of the caret that belongs to the text-based control.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextprovider2-getcaretrange
     */
    GetCaretRange(isActive) {
        isActiveMarshal := isActive is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, isActiveMarshal, isActive, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }
}
