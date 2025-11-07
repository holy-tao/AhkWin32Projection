#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITextRangeProvider.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IRawElementProviderSimple.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a span of continuous text in a text container that implements ITextProvider or ITextProvider2.
 * @remarks
 * 
  * A range can represent an insertion point, a portion of text, or all of the text in a container.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-itextrangeprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ITextRangeProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextRangeProvider
     * @type {Guid}
     */
    static IID => Guid("{5347ad7b-c355-46f8-aff5-909033582f63}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clone", "Compare", "CompareEndpoints", "ExpandToEnclosingUnit", "FindAttribute", "FindText", "GetAttributeValue", "GetBoundingRectangles", "GetEnclosingElement", "GetText", "Move", "MoveEndpointByUnit", "MoveEndpointByRange", "Select", "AddToSelection", "RemoveFromSelection", "ScrollIntoView", "GetChildren"]

    /**
     * 
     * @returns {ITextRangeProvider} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    /**
     * 
     * @param {ITextRangeProvider} range 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-compare
     */
    Compare(range) {
        result := ComCall(4, this, "ptr", range, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @param {Integer} endpoint 
     * @param {ITextRangeProvider} targetRange 
     * @param {Integer} targetEndpoint 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-compareendpoints
     */
    CompareEndpoints(endpoint, targetRange, targetEndpoint) {
        result := ComCall(5, this, "int", endpoint, "ptr", targetRange, "int", targetEndpoint, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @param {Integer} unit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-expandtoenclosingunit
     */
    ExpandToEnclosingUnit(unit) {
        result := ComCall(6, this, "int", unit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} attributeId 
     * @param {VARIANT} val 
     * @param {BOOL} backward 
     * @returns {ITextRangeProvider} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-findattribute
     */
    FindAttribute(attributeId, val, backward) {
        result := ComCall(7, this, "int", attributeId, "ptr", val, "int", backward, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    /**
     * 
     * @param {BSTR} text 
     * @param {BOOL} backward 
     * @param {BOOL} ignoreCase 
     * @returns {ITextRangeProvider} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-findtext
     */
    FindText(text, backward, ignoreCase) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(8, this, "ptr", text, "int", backward, "int", ignoreCase, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    /**
     * 
     * @param {Integer} attributeId 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-getattributevalue
     */
    GetAttributeValue(attributeId) {
        pRetVal := VARIANT()
        result := ComCall(9, this, "int", attributeId, "ptr", pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-getboundingrectangles
     */
    GetBoundingRectangles() {
        result := ComCall(10, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-getenclosingelement
     */
    GetEnclosingElement() {
        result := ComCall(11, this, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderSimple(pRetVal)
    }

    /**
     * 
     * @param {Integer} maxLength 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-gettext
     */
    GetText(maxLength) {
        pRetVal := BSTR()
        result := ComCall(12, this, "int", maxLength, "ptr", pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @param {Integer} unit 
     * @param {Integer} count 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-move
     */
    Move(unit, count) {
        result := ComCall(13, this, "int", unit, "int", count, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @param {Integer} endpoint 
     * @param {Integer} unit 
     * @param {Integer} count 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-moveendpointbyunit
     */
    MoveEndpointByUnit(endpoint, unit, count) {
        result := ComCall(14, this, "int", endpoint, "int", unit, "int", count, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @param {Integer} endpoint 
     * @param {ITextRangeProvider} targetRange 
     * @param {Integer} targetEndpoint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-moveendpointbyrange
     */
    MoveEndpointByRange(endpoint, targetRange, targetEndpoint) {
        result := ComCall(15, this, "int", endpoint, "ptr", targetRange, "int", targetEndpoint, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-select
     */
    Select() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-addtoselection
     */
    AddToSelection() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-removefromselection
     */
    RemoveFromSelection() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} alignToTop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-scrollintoview
     */
    ScrollIntoView(alignToTop) {
        result := ComCall(19, this, "int", alignToTop, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-getchildren
     */
    GetChildren() {
        result := ComCall(20, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}
