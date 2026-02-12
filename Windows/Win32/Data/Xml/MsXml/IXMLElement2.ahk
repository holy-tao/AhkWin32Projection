#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLElement2.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\IXMLElementCollection.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLElement2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLElement2
     * @type {Guid}
     */
    static IID => Guid("{2b8de2ff-8d2d-11d1-b2fc-00c04fd915a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_tagName", "put_tagName", "get_parent", "setAttribute", "getAttribute", "removeAttribute", "get_children", "get_type", "get_text", "put_text", "addChild", "removeChild", "get_attributes"]

    /**
     * @type {BSTR} 
     */
    tagName {
        get => this.get_tagName()
        set => this.put_tagName(value)
    }

    /**
     * @type {IXMLElement2} 
     */
    parent {
        get => this.get_parent()
    }

    /**
     * @type {IXMLElementCollection} 
     */
    children {
        get => this.get_children()
    }

    /**
     * @type {Integer} 
     */
    type {
        get => this.get_type()
    }

    /**
     * @type {BSTR} 
     */
    text {
        get => this.get_text()
        set => this.put_text(value)
    }

    /**
     * @type {IXMLElementCollection} 
     */
    attributes {
        get => this.get_attributes()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_tagName() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} p 
     * @returns {HRESULT} 
     */
    put_tagName(p) {
        if(p is String) {
            pin := BSTR.Alloc(p)
            p := pin.Value
        }

        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IXMLElement2} 
     */
    get_parent() {
        result := ComCall(9, this, "ptr*", &ppParent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLElement2(ppParent)
    }

    /**
     * 
     * @param {BSTR} strPropertyName 
     * @param {VARIANT} PropertyValue_ 
     * @returns {HRESULT} 
     */
    setAttribute(strPropertyName, PropertyValue_) {
        if(strPropertyName is String) {
            pin := BSTR.Alloc(strPropertyName)
            strPropertyName := pin.Value
        }

        result := ComCall(10, this, "ptr", strPropertyName, "ptr", PropertyValue_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * getAttributes Method (SQLServerDatabaseMetaData)
     * @remarks
     * This getAttributes method is specified by the getAttributes method in the java.sql.DatabaseMetaData interface.
     * @param {BSTR} strPropertyName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/getattributes-method-sqlserverdatabasemetadata
     */
    getAttribute(strPropertyName) {
        if(strPropertyName is String) {
            pin := BSTR.Alloc(strPropertyName)
            strPropertyName := pin.Value
        }

        PropertyValue_ := VARIANT()
        result := ComCall(11, this, "ptr", strPropertyName, "ptr", PropertyValue_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PropertyValue_
    }

    /**
     * 
     * @param {BSTR} strPropertyName 
     * @returns {HRESULT} 
     */
    removeAttribute(strPropertyName) {
        if(strPropertyName is String) {
            pin := BSTR.Alloc(strPropertyName)
            strPropertyName := pin.Value
        }

        result := ComCall(12, this, "ptr", strPropertyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IXMLElementCollection} 
     */
    get_children() {
        result := ComCall(13, this, "ptr*", &pp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLElementCollection(pp)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_type() {
        result := ComCall(14, this, "int*", &plType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plType
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_text() {
        p := BSTR()
        result := ComCall(15, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} p 
     * @returns {HRESULT} 
     */
    put_text(p) {
        if(p is String) {
            pin := BSTR.Alloc(p)
            p := pin.Value
        }

        result := ComCall(16, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXMLElement2} pChildElem 
     * @param {Integer} lIndex 
     * @param {Integer} lReserved 
     * @returns {HRESULT} 
     */
    addChild(pChildElem, lIndex, lReserved) {
        result := ComCall(17, this, "ptr", pChildElem, "int", lIndex, "int", lReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXMLElement2} pChildElem 
     * @returns {HRESULT} 
     */
    removeChild(pChildElem) {
        result := ComCall(18, this, "ptr", pChildElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IXMLElementCollection} 
     */
    get_attributes() {
        result := ComCall(19, this, "ptr*", &pp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLElementCollection(pp)
    }
}
