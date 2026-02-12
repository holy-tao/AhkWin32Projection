#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\IXMLDOMAttribute.ahk
#Include .\IXMLDOMNodeList.ahk
#Include .\IXMLDOMNode.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMElement extends IXMLDOMNode{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMElement
     * @type {Guid}
     */
    static IID => Guid("{2933bf86-7b36-11d2-b20e-00c04f983e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 43

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_tagName", "getAttribute", "setAttribute", "removeAttribute", "getAttributeNode", "setAttributeNode", "removeAttributeNode", "getElementsByTagName", "normalize"]

    /**
     * @type {BSTR} 
     */
    tagName {
        get => this.get_tagName()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_tagName() {
        tagName := BSTR()
        result := ComCall(43, this, "ptr", tagName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return tagName
    }

    /**
     * getAttributes Method (SQLServerDatabaseMetaData)
     * @remarks
     * This getAttributes method is specified by the getAttributes method in the java.sql.DatabaseMetaData interface.
     * @param {BSTR} name 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/getattributes-method-sqlserverdatabasemetadata
     */
    getAttribute(name) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        value := VARIANT()
        result := ComCall(44, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     */
    setAttribute(name, value) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        result := ComCall(45, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    removeAttribute(name) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        result := ComCall(46, this, "ptr", name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IXMLDOMAttribute} 
     */
    getAttributeNode(name) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        result := ComCall(47, this, "ptr", name, "ptr*", &attributeNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMAttribute(attributeNode)
    }

    /**
     * 
     * @param {IXMLDOMAttribute} DOMAttribute 
     * @returns {IXMLDOMAttribute} 
     */
    setAttributeNode(DOMAttribute) {
        result := ComCall(48, this, "ptr", DOMAttribute, "ptr*", &attributeNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMAttribute(attributeNode)
    }

    /**
     * 
     * @param {IXMLDOMAttribute} DOMAttribute 
     * @returns {IXMLDOMAttribute} 
     */
    removeAttributeNode(DOMAttribute) {
        result := ComCall(49, this, "ptr", DOMAttribute, "ptr*", &attributeNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMAttribute(attributeNode)
    }

    /**
     * 
     * @param {BSTR} tagName 
     * @returns {IXMLDOMNodeList} 
     */
    getElementsByTagName(tagName) {
        if(tagName is String) {
            pin := BSTR.Alloc(tagName)
            tagName := pin.Value
        }

        result := ComCall(50, this, "ptr", tagName, "ptr*", &resultList := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMNodeList(resultList)
    }

    /**
     * Normalizes the specified floating-point vector according to x / length(x).
     * @remarks
     * The **normalize** HLSL intrinsic function uses the following formula: *x* / [**length**](dx-graphics-hlsl-length.md)(*x*).
     * @returns {HRESULT} | Item                                                   | Description                                            |
     * |--------------------------------------------------------|--------------------------------------------------------|
     * | <span id="x"></span><span id="X"></span>*x*<br/> | \[in\] The specified floating-point vector.<br/> |
     * 
     * 
     * 
     *  
     * 
     * 
     * The normalized *x* parameter. If the length of the *x* parameter is 0, the result is indefinite.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dhlsl/dx-graphics-hlsl-normalize
     */
    normalize() {
        result := ComCall(51, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
