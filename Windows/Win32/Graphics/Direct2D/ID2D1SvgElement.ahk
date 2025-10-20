#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * Interface for all SVG elements.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nn-d2d1svg-id2d1svgelement
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1SvgElement extends ID2D1Resource{
    /**
     * The interface identifier for ID2D1SvgElement
     * @type {Guid}
     */
    static IID => Guid("{ac7b67a6-183e-49c1-a823-0ebe40b0db29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer<ID2D1SvgDocument>} document 
     * @returns {String} Nothing - always returns an empty string
     */
    GetDocument(document) {
        ComCall(4, this, "ptr", document)
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} nameCount 
     * @returns {HRESULT} 
     */
    GetTagName(name, nameCount) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(5, this, "ptr", name, "uint", nameCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTagNameLength() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsTextContent() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @param {Pointer<ID2D1SvgElement>} parent 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getparent
     */
    GetParent(parent) {
        ComCall(8, this, "ptr", parent)
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    HasChildren() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1SvgElement>} child 
     * @returns {String} Nothing - always returns an empty string
     */
    GetFirstChild(child) {
        ComCall(10, this, "ptr", child)
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1SvgElement>} child 
     * @returns {String} Nothing - always returns an empty string
     */
    GetLastChild(child) {
        ComCall(11, this, "ptr", child)
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1SvgElement>} referenceChild 
     * @param {Pointer<ID2D1SvgElement>} previousChild 
     * @returns {HRESULT} 
     */
    GetPreviousChild(referenceChild, previousChild) {
        result := ComCall(12, this, "ptr", referenceChild, "ptr", previousChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1SvgElement>} referenceChild 
     * @param {Pointer<ID2D1SvgElement>} nextChild 
     * @returns {HRESULT} 
     */
    GetNextChild(referenceChild, nextChild) {
        result := ComCall(13, this, "ptr", referenceChild, "ptr", nextChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1SvgElement>} newChild 
     * @param {Pointer<ID2D1SvgElement>} referenceChild 
     * @returns {HRESULT} 
     */
    InsertChildBefore(newChild, referenceChild) {
        result := ComCall(14, this, "ptr", newChild, "ptr", referenceChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1SvgElement>} newChild 
     * @returns {HRESULT} 
     */
    AppendChild(newChild) {
        result := ComCall(15, this, "ptr", newChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1SvgElement>} newChild 
     * @param {Pointer<ID2D1SvgElement>} oldChild 
     * @returns {HRESULT} 
     */
    ReplaceChild(newChild, oldChild) {
        result := ComCall(16, this, "ptr", newChild, "ptr", oldChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1SvgElement>} oldChild 
     * @returns {HRESULT} 
     */
    RemoveChild(oldChild) {
        result := ComCall(17, this, "ptr", oldChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} tagName 
     * @param {Pointer<ID2D1SvgElement>} newChild 
     * @returns {HRESULT} 
     */
    CreateChild(tagName, newChild) {
        tagName := tagName is String ? StrPtr(tagName) : tagName

        result := ComCall(18, this, "ptr", tagName, "ptr", newChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Pointer<BOOL>} inherited 
     * @returns {BOOL} 
     */
    IsAttributeSpecified(name, inherited) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(19, this, "ptr", name, "ptr", inherited, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSpecifiedAttributeCount() {
        result := ComCall(20, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {PWSTR} name 
     * @param {Integer} nameCount 
     * @param {Pointer<BOOL>} inherited 
     * @returns {HRESULT} 
     */
    GetSpecifiedAttributeName(index, name, nameCount, inherited) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(21, this, "uint", index, "ptr", name, "uint", nameCount, "ptr", inherited, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<UInt32>} nameLength 
     * @param {Pointer<BOOL>} inherited 
     * @returns {HRESULT} 
     */
    GetSpecifiedAttributeNameLength(index, nameLength, inherited) {
        result := ComCall(22, this, "uint", index, "uint*", nameLength, "ptr", inherited, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @returns {HRESULT} 
     */
    RemoveAttribute(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(23, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} nameCount 
     * @returns {HRESULT} 
     */
    SetTextValue(name, nameCount) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(24, this, "ptr", name, "uint", nameCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} nameCount 
     * @returns {HRESULT} 
     */
    GetTextValue(name, nameCount) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(25, this, "ptr", name, "uint", nameCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTextValueLength() {
        result := ComCall(26, this, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Pointer<ID2D1SvgAttribute>} value 
     * @returns {HRESULT} 
     */
    SetAttributeValue(name, value) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(27, this, "ptr", name, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} type 
     * @param {Pointer} value 
     * @param {Integer} valueSizeInBytes 
     * @returns {HRESULT} 
     */
    SetAttributeValue(name, type, value, valueSizeInBytes) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(28, this, "ptr", name, "int", type, "ptr", value, "uint", valueSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} type 
     * @param {PWSTR} value 
     * @returns {HRESULT} 
     */
    SetAttributeValue(name, type, value) {
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        result := ComCall(29, this, "ptr", name, "int", type, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} value 
     * @returns {HRESULT} 
     */
    GetAttributeValue(name, riid, value) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(30, this, "ptr", name, "ptr", riid, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} type 
     * @param {Pointer} value 
     * @param {Integer} valueSizeInBytes 
     * @returns {HRESULT} 
     */
    GetAttributeValue(name, type, value, valueSizeInBytes) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(31, this, "ptr", name, "int", type, "ptr", value, "uint", valueSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} type 
     * @param {PWSTR} value 
     * @param {Integer} valueCount 
     * @returns {HRESULT} 
     */
    GetAttributeValue(name, type, value, valueCount) {
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        result := ComCall(32, this, "ptr", name, "int", type, "ptr", value, "uint", valueCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} type 
     * @param {Pointer<UInt32>} valueLength 
     * @returns {HRESULT} 
     */
    GetAttributeValueLength(name, type, valueLength) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(33, this, "ptr", name, "int", type, "uint*", valueLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
