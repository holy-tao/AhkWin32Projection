#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IMXAttributes extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMXAttributes
     * @type {Guid}
     */
    static IID => Guid("{f10d27cc-3ec0-415c-8ed8-77ab1c5e7262}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["addAttribute", "addAttributeFromIndex", "clear", "removeAttribute", "setAttribute", "setAttributes", "setLocalName", "setQName", "setType", "setURI", "setValue"]

    /**
     * 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @param {BSTR} strQName 
     * @param {BSTR} strType 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    addAttribute(strURI, strLocalName, strQName, strType, strValue) {
        if(strURI is String) {
            pin := BSTR.Alloc(strURI)
            strURI := pin.Value
        }
        if(strLocalName is String) {
            pin := BSTR.Alloc(strLocalName)
            strLocalName := pin.Value
        }
        if(strQName is String) {
            pin := BSTR.Alloc(strQName)
            strQName := pin.Value
        }
        if(strType is String) {
            pin := BSTR.Alloc(strType)
            strType := pin.Value
        }
        if(strValue is String) {
            pin := BSTR.Alloc(strValue)
            strValue := pin.Value
        }

        result := ComCall(7, this, "ptr", strURI, "ptr", strLocalName, "ptr", strQName, "ptr", strType, "ptr", strValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT} varAtts 
     * @param {Integer} nIndex 
     * @returns {HRESULT} 
     */
    addAttributeFromIndex(varAtts, nIndex) {
        result := ComCall(8, this, "ptr", varAtts, "int", nIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * clearBatch Method (SQLServerStatement)
     * @remarks
     * This clearBatch method is specified by the clearBatch method in the java.sql.Statement interface.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/clearbatch-method-sqlserverstatement
     */
    clear() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {HRESULT} 
     */
    removeAttribute(nIndex) {
        result := ComCall(10, this, "int", nIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @param {BSTR} strQName 
     * @param {BSTR} strType 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    setAttribute(nIndex, strURI, strLocalName, strQName, strType, strValue) {
        if(strURI is String) {
            pin := BSTR.Alloc(strURI)
            strURI := pin.Value
        }
        if(strLocalName is String) {
            pin := BSTR.Alloc(strLocalName)
            strLocalName := pin.Value
        }
        if(strQName is String) {
            pin := BSTR.Alloc(strQName)
            strQName := pin.Value
        }
        if(strType is String) {
            pin := BSTR.Alloc(strType)
            strType := pin.Value
        }
        if(strValue is String) {
            pin := BSTR.Alloc(strValue)
            strValue := pin.Value
        }

        result := ComCall(11, this, "int", nIndex, "ptr", strURI, "ptr", strLocalName, "ptr", strQName, "ptr", strType, "ptr", strValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT} varAtts 
     * @returns {HRESULT} 
     */
    setAttributes(varAtts) {
        result := ComCall(12, this, "ptr", varAtts, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} strLocalName 
     * @returns {HRESULT} 
     */
    setLocalName(nIndex, strLocalName) {
        if(strLocalName is String) {
            pin := BSTR.Alloc(strLocalName)
            strLocalName := pin.Value
        }

        result := ComCall(13, this, "int", nIndex, "ptr", strLocalName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} strQName 
     * @returns {HRESULT} 
     */
    setQName(nIndex, strQName) {
        if(strQName is String) {
            pin := BSTR.Alloc(strQName)
            strQName := pin.Value
        }

        result := ComCall(14, this, "int", nIndex, "ptr", strQName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * setTypeMap Method (SQLServerConnection)
     * @remarks
     * This setTypeMap method is specified by the setTypeMap method in the java.sql.Connection interface.
     * @param {Integer} nIndex 
     * @param {BSTR} strType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/settypemap-method-sqlserverconnection
     */
    setType(nIndex, strType) {
        if(strType is String) {
            pin := BSTR.Alloc(strType)
            strType := pin.Value
        }

        result := ComCall(15, this, "int", nIndex, "ptr", strType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} strURI 
     * @returns {HRESULT} 
     */
    setURI(nIndex, strURI) {
        if(strURI is String) {
            pin := BSTR.Alloc(strURI)
            strURI := pin.Value
        }

        result := ComCall(16, this, "int", nIndex, "ptr", strURI, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    setValue(nIndex, strValue) {
        if(strValue is String) {
            pin := BSTR.Alloc(strValue)
            strValue := pin.Value
        }

        result := ComCall(17, this, "int", nIndex, "ptr", strValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
