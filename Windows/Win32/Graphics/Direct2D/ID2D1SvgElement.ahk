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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocument", "GetTagName", "GetTagNameLength", "IsTextContent", "GetParent", "HasChildren", "GetFirstChild", "GetLastChild", "GetPreviousChild", "GetNextChild", "InsertChildBefore", "AppendChild", "ReplaceChild", "RemoveChild", "CreateChild", "IsAttributeSpecified", "GetSpecifiedAttributeCount", "GetSpecifiedAttributeName", "GetSpecifiedAttributeNameLength", "RemoveAttribute", "SetTextValue", "GetTextValue", "GetTextValueLength", "SetAttributeValue", "SetAttributeValue1", "SetAttributeValue2", "GetAttributeValue", "GetAttributeValue1", "GetAttributeValue2", "GetAttributeValueLength"]

    /**
     * 
     * @param {Pointer<ID2D1SvgDocument>} document 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-getdocument
     */
    GetDocument(document) {
        ComCall(4, this, "ptr*", document)
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} nameCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-gettagname
     */
    GetTagName(name, nameCount) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(5, this, "ptr", name, "uint", nameCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-gettagnamelength
     */
    GetTagNameLength() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-istextcontent
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
        ComCall(8, this, "ptr*", parent)
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-haschildren
     */
    HasChildren() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1SvgElement>} child 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-getfirstchild
     */
    GetFirstChild(child) {
        ComCall(10, this, "ptr*", child)
    }

    /**
     * 
     * @param {Pointer<ID2D1SvgElement>} child 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-getlastchild
     */
    GetLastChild(child) {
        ComCall(11, this, "ptr*", child)
    }

    /**
     * 
     * @param {ID2D1SvgElement} referenceChild 
     * @param {Pointer<ID2D1SvgElement>} previousChild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-getpreviouschild
     */
    GetPreviousChild(referenceChild, previousChild) {
        result := ComCall(12, this, "ptr", referenceChild, "ptr*", previousChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1SvgElement} referenceChild 
     * @param {Pointer<ID2D1SvgElement>} nextChild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-getnextchild
     */
    GetNextChild(referenceChild, nextChild) {
        result := ComCall(13, this, "ptr", referenceChild, "ptr*", nextChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1SvgElement} newChild 
     * @param {ID2D1SvgElement} referenceChild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-insertchildbefore
     */
    InsertChildBefore(newChild, referenceChild) {
        result := ComCall(14, this, "ptr", newChild, "ptr", referenceChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1SvgElement} newChild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-appendchild
     */
    AppendChild(newChild) {
        result := ComCall(15, this, "ptr", newChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1SvgElement} newChild 
     * @param {ID2D1SvgElement} oldChild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-replacechild
     */
    ReplaceChild(newChild, oldChild) {
        result := ComCall(16, this, "ptr", newChild, "ptr", oldChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1SvgElement} oldChild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-removechild
     */
    RemoveChild(oldChild) {
        result := ComCall(17, this, "ptr", oldChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} tagName 
     * @param {Pointer<ID2D1SvgElement>} newChild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-createchild
     */
    CreateChild(tagName, newChild) {
        tagName := tagName is String ? StrPtr(tagName) : tagName

        result := ComCall(18, this, "ptr", tagName, "ptr*", newChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Pointer<BOOL>} inherited 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-isattributespecified
     */
    IsAttributeSpecified(name, inherited) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(19, this, "ptr", name, "ptr", inherited, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-getspecifiedattributecount
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-getspecifiedattributename
     */
    GetSpecifiedAttributeName(index, name, nameCount, inherited) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(21, this, "uint", index, "ptr", name, "uint", nameCount, "ptr", inherited, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Integer>} nameLength 
     * @param {Pointer<BOOL>} inherited 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-getspecifiedattributenamelength
     */
    GetSpecifiedAttributeNameLength(index, nameLength, inherited) {
        result := ComCall(22, this, "uint", index, "uint*", nameLength, "ptr", inherited, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-removeattribute
     */
    RemoveAttribute(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(23, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} nameCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-settextvalue
     */
    SetTextValue(name, nameCount) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(24, this, "ptr", name, "uint", nameCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} nameCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-gettextvalue
     */
    GetTextValue(name, nameCount) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(25, this, "ptr", name, "uint", nameCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-gettextvaluelength
     */
    GetTextValueLength() {
        result := ComCall(26, this, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {ID2D1SvgAttribute} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgelement-setattributevalue-overload
     */
    SetAttributeValue(name, value) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(27, this, "ptr", name, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} type 
     * @param {Pointer} value 
     * @param {Integer} valueSizeInBytes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgelement-setattributevalue-overload
     */
    SetAttributeValue1(name, type, value, valueSizeInBytes) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(28, this, "ptr", name, "int", type, "ptr", value, "uint", valueSizeInBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} type 
     * @param {PWSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgelement-setattributevalue-overload
     */
    SetAttributeValue2(name, type, value) {
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        result := ComCall(29, this, "ptr", name, "int", type, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgelement-getattributevalue-overload
     */
    GetAttributeValue(name, riid, value) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(30, this, "ptr", name, "ptr", riid, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} type 
     * @param {Pointer} value 
     * @param {Integer} valueSizeInBytes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgelement-getattributevalue-overload
     */
    GetAttributeValue1(name, type, value, valueSizeInBytes) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(31, this, "ptr", name, "int", type, "ptr", value, "uint", valueSizeInBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} type 
     * @param {PWSTR} value 
     * @param {Integer} valueCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgelement-getattributevalue-overload
     */
    GetAttributeValue2(name, type, value, valueCount) {
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        result := ComCall(32, this, "ptr", name, "int", type, "ptr", value, "uint", valueCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} type 
     * @param {Pointer<Integer>} valueLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgelement-getattributevaluelength
     */
    GetAttributeValueLength(name, type, valueLength) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(33, this, "ptr", name, "int", type, "uint*", valueLength, "HRESULT")
        return result
    }
}
