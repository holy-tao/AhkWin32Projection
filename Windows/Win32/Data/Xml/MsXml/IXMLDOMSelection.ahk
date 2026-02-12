#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLDOMNode.ahk
#Include .\IXMLDOMSelection.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\IXMLDOMNodeList.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMSelection extends IXMLDOMNodeList{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMSelection
     * @type {Guid}
     */
    static IID => Guid("{aa634fc7-5888-44a7-a257-3a47150d3a0e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_expr", "put_expr", "get_context", "putref_context", "peekNode", "matches", "removeNext", "removeAll", "clone", "getProperty", "setProperty"]

    /**
     * @type {BSTR} 
     */
    expr {
        get => this.get_expr()
        set => this.put_expr(value)
    }

    /**
     * @type {IXMLDOMNode} 
     */
    context {
        get => this.get_context()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_expr() {
        expression := BSTR()
        result := ComCall(12, this, "ptr", expression, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return expression
    }

    /**
     * 
     * @param {BSTR} expression 
     * @returns {HRESULT} 
     */
    put_expr(expression) {
        if(expression is String) {
            pin := BSTR.Alloc(expression)
            expression := pin.Value
        }

        result := ComCall(13, this, "ptr", expression, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    get_context() {
        result := ComCall(14, this, "ptr*", &ppNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMNode(ppNode)
    }

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @returns {HRESULT} 
     */
    putref_context(pNode) {
        result := ComCall(15, this, "ptr", pNode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    peekNode() {
        result := ComCall(16, this, "ptr*", &ppNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMNode(ppNode)
    }

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @returns {IXMLDOMNode} 
     */
    matches(pNode) {
        result := ComCall(17, this, "ptr", pNode, "ptr*", &ppNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMNode(ppNode)
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    removeNext() {
        result := ComCall(18, this, "ptr*", &ppNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMNode(ppNode)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    removeAll() {
        result := ComCall(19, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IXMLDOMSelection} 
     */
    clone() {
        result := ComCall(20, this, "ptr*", &ppNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMSelection(ppNode)
    }

    /**
     * getPropertyInfo Method (SQLServerDriver)
     * @remarks
     * This getPropertyInfo method is specified by the getPropertyInfo method in the java.sql.Driver interface.
     * @param {BSTR} name 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/getpropertyinfo-method-sqlserverdriver
     */
    getProperty(name) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        value := VARIANT()
        result := ComCall(21, this, "ptr", name, "ptr", value, "int")
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
    setProperty(name, value) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        result := ComCall(22, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
