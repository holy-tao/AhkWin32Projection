#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1SvgElement.ahk
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
     * Gets the document that contains this element.
     * @param {Pointer<ID2D1SvgDocument>} document Type: <b>ID2D1SvgDocument**</b>
     * 
     * Ouputs the document that contains this element. This argument will be null if the element has been removed from the tree.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-getdocument
     */
    GetDocument(document) {
        ComCall(4, this, "ptr*", document)
    }

    /**
     * Gets the tag name.
     * @param {PWSTR} name Type: <b>PWSTR</b>
     * 
     * The tag name.
     * @param {Integer} nameCount Type: <b>UINT32</b>
     * 
     * Length of the value in the name argument.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-gettagname
     */
    GetTagName(name, nameCount) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(5, this, "ptr", name, "uint", nameCount, "HRESULT")
        return result
    }

    /**
     * Gets the string length of the tag name.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the string length of the tag name. The returned string length does not include room for the null terminator.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-gettagnamelength
     */
    GetTagNameLength() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * Returns a boolean indicating wether this element represents text content.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns TRUE if this element represents text content, e.g. the content of a 'title' or 'desc' element. Text content does not have a tag name.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-istextcontent
     */
    IsTextContent() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * Gets the parent element.
     * @param {Pointer<ID2D1SvgElement>} parent Type: <b>ID2D1SvgElement**</b>
     * 
     * Outputs the parent element.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-getparent
     */
    GetParent(parent) {
        ComCall(8, this, "ptr*", parent)
    }

    /**
     * Returns a boolean indicating whether this element has children.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns TRUE if this element has children.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-haschildren
     */
    HasChildren() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * Gets the first child of this element.
     * @param {Pointer<ID2D1SvgElement>} child Type: <b>ID2D1SvgElement**</b>
     * 
     * Outputs the first child of this element.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-getfirstchild
     */
    GetFirstChild(child) {
        ComCall(10, this, "ptr*", child)
    }

    /**
     * Gets the last child of this element.
     * @param {Pointer<ID2D1SvgElement>} child Type: <b>ID2D1SvgElement**</b>
     * 
     * Outputs the last child of this element.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-getlastchild
     */
    GetLastChild(child) {
        ComCall(11, this, "ptr*", child)
    }

    /**
     * Gets the previous sibling of the referenceChild element.
     * @param {ID2D1SvgElement} referenceChild Type: <b>ID2D1SvgElement*</b>
     * 
     * The referenceChild must be an immediate child of this element.
     * @returns {ID2D1SvgElement} Type: <b>ID2D1SvgElement**</b>
     * 
     * The output previousChild element will be non-null if the referenceChild has a previous sibling. If the referenceChild is the first child, the output is null.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-getpreviouschild
     */
    GetPreviousChild(referenceChild) {
        result := ComCall(12, this, "ptr", referenceChild, "ptr*", &previousChild := 0, "HRESULT")
        return ID2D1SvgElement(previousChild)
    }

    /**
     * Gets the next sibling of the referenceChild element.
     * @param {ID2D1SvgElement} referenceChild Type: <b>ID2D1SvgElement*</b>
     * 
     * The referenceChild must be an immediate child of this element.
     * @returns {ID2D1SvgElement} Type: <b>ID2D1SvgElement**</b>
     * 
     * The output nextChild element will be non-null if the referenceChild has a next sibling. If the referenceChild is the last child, the output is null.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-getnextchild
     */
    GetNextChild(referenceChild) {
        result := ComCall(13, this, "ptr", referenceChild, "ptr*", &nextChild := 0, "HRESULT")
        return ID2D1SvgElement(nextChild)
    }

    /**
     * Inserts newChild as a child of this element, before the referenceChild element.
     * @param {ID2D1SvgElement} newChild Type: <b>ID2D1SvgElement*</b>
     * 
     * The element to be inserted.
     * @param {ID2D1SvgElement} referenceChild Type: <b>ID2D1SvgElement*</b>
     * 
     * The element that the child should be inserted before.
     *             If referenceChild is null, the newChild is placed as the last child.
     *             If referenceChild is non-null, it must be an immediate child of this element.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code. Returns an error if this element cannot accept children
     *             of the type of newChild. Returns an error if the newChild is an ancestor of this
     *             element.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-insertchildbefore
     */
    InsertChildBefore(newChild, referenceChild) {
        result := ComCall(14, this, "ptr", newChild, "ptr", referenceChild, "HRESULT")
        return result
    }

    /**
     * Appends an element to the list of children.
     * @param {ID2D1SvgElement} newChild Type: <b>ID2D1SvgElement*</b>
     * 
     * The element to append.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     *           Returns an error if this element cannot accept children of the type of newChild. 
     *           Returns an error if the newChild is an ancestor of this element.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-appendchild
     */
    AppendChild(newChild) {
        result := ComCall(15, this, "ptr", newChild, "HRESULT")
        return result
    }

    /**
     * Replaces the oldChild element with the newChild.
     * @param {ID2D1SvgElement} newChild Type: <b>ID2D1SvgElement*</b>
     * 
     * The element to be inserted.
     * @param {ID2D1SvgElement} oldChild Type: <b>ID2D1SvgElement*</b>
     * 
     * The child element to be replaced. The oldChild element must be an immediate child of this element.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code. Returns an error if
     *             this element cannot accept children of the type of newChild. Returns an error if
     *             the newChild is an ancestor of this element.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-replacechild
     */
    ReplaceChild(newChild, oldChild) {
        result := ComCall(16, this, "ptr", newChild, "ptr", oldChild, "HRESULT")
        return result
    }

    /**
     * Removes the oldChild from the tree. Children of oldChild remain children of oldChild.
     * @param {ID2D1SvgElement} oldChild Type: <b>ID2D1SvgElement*</b>
     * 
     * The child element to be removed. The oldChild element must be an immediate child of this element.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-removechild
     */
    RemoveChild(oldChild) {
        result := ComCall(17, this, "ptr", oldChild, "HRESULT")
        return result
    }

    /**
     * Creates an element from a tag name. The element is appended to the list of children.
     * @param {PWSTR} tagName Type: <b>PCWSTR</b>
     * 
     * The tag name of the new child. An empty string is interpreted to be a text content element.
     * @returns {ID2D1SvgElement} Type: <b>ID2D1SvgElement**</b>
     * 
     * The new child element.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-createchild
     */
    CreateChild(tagName) {
        tagName := tagName is String ? StrPtr(tagName) : tagName

        result := ComCall(18, this, "ptr", tagName, "ptr*", &newChild := 0, "HRESULT")
        return ID2D1SvgElement(newChild)
    }

    /**
     * Returns a boolean indicating if the attribute is explicitly set on the element.
     * @param {PWSTR} name Type: <b>PCWSTR</b>
     * 
     * The name of the attribute.
     * @param {Pointer<BOOL>} inherited Type: <b>BOOL*</b>
     * 
     * Outputs whether the attribute is set to the inherit value.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * TReturns true if the attribute is explicitly set on the element or if it is present within an inline style. Returns FALSE if the attribute is not a valid
     *             attribute on this element.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-isattributespecified
     */
    IsAttributeSpecified(name, inherited) {
        name := name is String ? StrPtr(name) : name

        inheritedMarshal := inherited is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, "ptr", name, inheritedMarshal, inherited, "int")
        return result
    }

    /**
     * Returns the number of specified attributes on this element.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the number of specified attributes on this element.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-getspecifiedattributecount
     */
    GetSpecifiedAttributeCount() {
        result := ComCall(20, this, "uint")
        return result
    }

    /**
     * Gets the name of the attribute at the given index.
     * @param {Integer} index Type: <b>UINT32</b>
     * 
     * The index of the attribute.
     * @param {PWSTR} name Type: <b>PWSTR</b>
     * 
     * Outputs the name of the attribute.
     * @param {Integer} nameCount Type: <b>UINT32</b>
     * 
     * Length of the string returned in the name argument.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Outputs whether the attribute is set to the inherit value.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-getspecifiedattributename
     */
    GetSpecifiedAttributeName(index, name, nameCount) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(21, this, "uint", index, "ptr", name, "uint", nameCount, "int*", &inherited := 0, "HRESULT")
        return inherited
    }

    /**
     * Gets the string length of the name of the specified attribute at the given index.
     * @param {Integer} index Type: <b>UINT32</b>
     * 
     * The index of the attribute.
     * @param {Pointer<Integer>} nameLength Type: <b>UINT32*</b>
     * 
     * Outputs the string length of the name of the specified attribute.
     * @param {Pointer<BOOL>} inherited Type: <b>BOOL*</b>
     * 
     * Indicates whether the attribute is set to the inherit value.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-getspecifiedattributenamelength
     */
    GetSpecifiedAttributeNameLength(index, nameLength, inherited) {
        nameLengthMarshal := nameLength is VarRef ? "uint*" : "ptr"
        inheritedMarshal := inherited is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, "uint", index, nameLengthMarshal, nameLength, inheritedMarshal, inherited, "HRESULT")
        return result
    }

    /**
     * Removes the attribute from this element.
     * @param {PWSTR} name Type: <b>PCWSTR</b>
     * 
     * The name of the attribute to remove.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code. Returns an error if the attribute name is not valid
     *             on this element.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-removeattribute
     */
    RemoveAttribute(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(23, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * Sets the value of a text content element.
     * @param {PWSTR} name Type: <b>const WCHAR*</b>
     * 
     * The new value of the text content element.
     * @param {Integer} nameCount Type: <b>UINT32</b>
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-settextvalue
     */
    SetTextValue(name, nameCount) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(24, this, "ptr", name, "uint", nameCount, "HRESULT")
        return result
    }

    /**
     * Gets the value of a text content element.
     * @param {PWSTR} name Type: <b>PWSTR</b>
     * 
     * The value of the text content element.
     * @param {Integer} nameCount Type: <b>UINT32</b>
     * 
     * The length of the value in the name argument.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-gettextvalue
     */
    GetTextValue(name, nameCount) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(25, this, "ptr", name, "uint", nameCount, "HRESULT")
        return result
    }

    /**
     * Gets the length of the text content value.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the length of the text content value.  The returned string length does not include room for the null terminator.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-gettextvaluelength
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
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgelement-getattributevalue-overload
     */
    GetAttributeValue(name, riid) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(30, this, "ptr", name, "ptr", riid, "ptr*", &value := 0, "HRESULT")
        return value
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
     * Gets the string length of an attribute of this element.
     * @param {PWSTR} name Type: <b>PCWSTR</b>
     * 
     * The name of the attribute.
     * @param {Integer} type Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1svg/ne-d2d1svg-d2d1_svg_attribute_string_type">D2D1_SVG_ATTRIBUTE_STRING_TYPE</a></b>
     * 
     * The string type of the attribute.
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * The lengthe of the attribute. The returned string length does not include room for the null terminator.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgelement-getattributevaluelength
     */
    GetAttributeValueLength(name, type) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(33, this, "ptr", name, "int", type, "uint*", &valueLength := 0, "HRESULT")
        return valueLength
    }
}
