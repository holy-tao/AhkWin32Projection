#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a span of continuous text in a container that supports the IUIAutomationTextPattern interface. Client applications can use the IUIAutomationTextRange interface to select, compare, and retrieve embedded objects from the text span.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtextrange
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTextRange extends IUnknown{
    /**
     * The interface identifier for IUIAutomationTextRange
     * @type {Guid}
     */
    static IID => Guid("{a543cc6a-f4ae-494b-8239-c814481187a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUIAutomationTextRange>} clonedRange 
     * @returns {HRESULT} 
     */
    Clone(clonedRange) {
        result := ComCall(3, this, "ptr", clonedRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationTextRange>} range 
     * @param {Pointer<BOOL>} areSame 
     * @returns {HRESULT} 
     */
    Compare(range, areSame) {
        result := ComCall(4, this, "ptr", range, "ptr", areSame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} srcEndPoint 
     * @param {Pointer<IUIAutomationTextRange>} range 
     * @param {Integer} targetEndPoint 
     * @param {Pointer<Int32>} compValue 
     * @returns {HRESULT} 
     */
    CompareEndpoints(srcEndPoint, range, targetEndPoint, compValue) {
        result := ComCall(5, this, "int", srcEndPoint, "ptr", range, "int", targetEndPoint, "int*", compValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} textUnit 
     * @returns {HRESULT} 
     */
    ExpandToEnclosingUnit(textUnit) {
        result := ComCall(6, this, "int", textUnit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} attr 
     * @param {VARIANT} val 
     * @param {BOOL} backward 
     * @param {Pointer<IUIAutomationTextRange>} found 
     * @returns {HRESULT} 
     */
    FindAttribute(attr, val, backward, found) {
        result := ComCall(7, this, "int", attr, "ptr", val, "int", backward, "ptr", found, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @param {BOOL} backward 
     * @param {BOOL} ignoreCase 
     * @param {Pointer<IUIAutomationTextRange>} found 
     * @returns {HRESULT} 
     */
    FindText(text, backward, ignoreCase, found) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(8, this, "ptr", text, "int", backward, "int", ignoreCase, "ptr", found, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} attr 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} 
     */
    GetAttributeValue(attr, value) {
        result := ComCall(9, this, "int", attr, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} boundingRects 
     * @returns {HRESULT} 
     */
    GetBoundingRectangles(boundingRects) {
        result := ComCall(10, this, "ptr", boundingRects, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} enclosingElement 
     * @returns {HRESULT} 
     */
    GetEnclosingElement(enclosingElement) {
        result := ComCall(11, this, "ptr", enclosingElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} maxLength 
     * @param {Pointer<BSTR>} text 
     * @returns {HRESULT} 
     */
    GetText(maxLength, text) {
        result := ComCall(12, this, "int", maxLength, "ptr", text, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} unit 
     * @param {Integer} count 
     * @param {Pointer<Int32>} moved 
     * @returns {HRESULT} 
     */
    Move(unit, count, moved) {
        result := ComCall(13, this, "int", unit, "int", count, "int*", moved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} endpoint 
     * @param {Integer} unit 
     * @param {Integer} count 
     * @param {Pointer<Int32>} moved 
     * @returns {HRESULT} 
     */
    MoveEndpointByUnit(endpoint, unit, count, moved) {
        result := ComCall(14, this, "int", endpoint, "int", unit, "int", count, "int*", moved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} srcEndPoint 
     * @param {Pointer<IUIAutomationTextRange>} range 
     * @param {Integer} targetEndPoint 
     * @returns {HRESULT} 
     */
    MoveEndpointByRange(srcEndPoint, range, targetEndPoint) {
        result := ComCall(15, this, "int", srcEndPoint, "ptr", range, "int", targetEndPoint, "int")
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
     * @param {Pointer<IUIAutomationElementArray>} children 
     * @returns {HRESULT} 
     */
    GetChildren(children) {
        result := ComCall(20, this, "ptr", children, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
