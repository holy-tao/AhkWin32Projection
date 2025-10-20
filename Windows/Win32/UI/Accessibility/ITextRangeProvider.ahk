#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<ITextRangeProvider>} pRetVal 
     * @returns {HRESULT} 
     */
    Clone(pRetVal) {
        result := ComCall(3, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextRangeProvider>} range 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     */
    Compare(range, pRetVal) {
        result := ComCall(4, this, "ptr", range, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} endpoint 
     * @param {Pointer<ITextRangeProvider>} targetRange 
     * @param {Integer} targetEndpoint 
     * @param {Pointer<Int32>} pRetVal 
     * @returns {HRESULT} 
     */
    CompareEndpoints(endpoint, targetRange, targetEndpoint, pRetVal) {
        result := ComCall(5, this, "int", endpoint, "ptr", targetRange, "int", targetEndpoint, "int*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} unit 
     * @returns {HRESULT} 
     */
    ExpandToEnclosingUnit(unit) {
        result := ComCall(6, this, "int", unit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} attributeId 
     * @param {VARIANT} val 
     * @param {BOOL} backward 
     * @param {Pointer<ITextRangeProvider>} pRetVal 
     * @returns {HRESULT} 
     */
    FindAttribute(attributeId, val, backward, pRetVal) {
        result := ComCall(7, this, "int", attributeId, "ptr", val, "int", backward, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @param {BOOL} backward 
     * @param {BOOL} ignoreCase 
     * @param {Pointer<ITextRangeProvider>} pRetVal 
     * @returns {HRESULT} 
     */
    FindText(text, backward, ignoreCase, pRetVal) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(8, this, "ptr", text, "int", backward, "int", ignoreCase, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} attributeId 
     * @param {Pointer<VARIANT>} pRetVal 
     * @returns {HRESULT} 
     */
    GetAttributeValue(attributeId, pRetVal) {
        result := ComCall(9, this, "int", attributeId, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pRetVal 
     * @returns {HRESULT} 
     */
    GetBoundingRectangles(pRetVal) {
        result := ComCall(10, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRawElementProviderSimple>} pRetVal 
     * @returns {HRESULT} 
     */
    GetEnclosingElement(pRetVal) {
        result := ComCall(11, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} maxLength 
     * @param {Pointer<BSTR>} pRetVal 
     * @returns {HRESULT} 
     */
    GetText(maxLength, pRetVal) {
        result := ComCall(12, this, "int", maxLength, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} unit 
     * @param {Integer} count 
     * @param {Pointer<Int32>} pRetVal 
     * @returns {HRESULT} 
     */
    Move(unit, count, pRetVal) {
        result := ComCall(13, this, "int", unit, "int", count, "int*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} endpoint 
     * @param {Integer} unit 
     * @param {Integer} count 
     * @param {Pointer<Int32>} pRetVal 
     * @returns {HRESULT} 
     */
    MoveEndpointByUnit(endpoint, unit, count, pRetVal) {
        result := ComCall(14, this, "int", endpoint, "int", unit, "int", count, "int*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} endpoint 
     * @param {Pointer<ITextRangeProvider>} targetRange 
     * @param {Integer} targetEndpoint 
     * @returns {HRESULT} 
     */
    MoveEndpointByRange(endpoint, targetRange, targetEndpoint) {
        result := ComCall(15, this, "int", endpoint, "ptr", targetRange, "int", targetEndpoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Select() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AddToSelection() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveFromSelection() {
        result := ComCall(18, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} alignToTop 
     * @returns {HRESULT} 
     */
    ScrollIntoView(alignToTop) {
        result := ComCall(19, this, "int", alignToTop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pRetVal 
     * @returns {HRESULT} 
     */
    GetChildren(pRetVal) {
        result := ComCall(20, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
