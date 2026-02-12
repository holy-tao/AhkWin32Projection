#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IVBSAXAttributes extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVBSAXAttributes
     * @type {Guid}
     */
    static IID => Guid("{10dc0586-132b-4cac-8bb3-db00ac8b7ee0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_length", "getURI", "getLocalName", "getQName", "getIndexFromName", "getIndexFromQName", "getType", "getTypeFromName", "getTypeFromQName", "getValue", "getValueFromName", "getValueFromQName"]

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(7, this, "int*", &nLength := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return nLength
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     */
    getURI(nIndex) {
        strURI := BSTR()
        result := ComCall(8, this, "int", nIndex, "ptr", strURI, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strURI
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     */
    getLocalName(nIndex) {
        strLocalName := BSTR()
        result := ComCall(9, this, "int", nIndex, "ptr", strLocalName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strLocalName
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     */
    getQName(nIndex) {
        strQName := BSTR()
        result := ComCall(10, this, "int", nIndex, "ptr", strQName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strQName
    }

    /**
     * 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @returns {Integer} 
     */
    getIndexFromName(strURI, strLocalName) {
        if(strURI is String) {
            pin := BSTR.Alloc(strURI)
            strURI := pin.Value
        }
        if(strLocalName is String) {
            pin := BSTR.Alloc(strLocalName)
            strLocalName := pin.Value
        }

        result := ComCall(11, this, "ptr", strURI, "ptr", strLocalName, "int*", &nIndex := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return nIndex
    }

    /**
     * 
     * @param {BSTR} strQName 
     * @returns {Integer} 
     */
    getIndexFromQName(strQName) {
        if(strQName is String) {
            pin := BSTR.Alloc(strQName)
            strQName := pin.Value
        }

        result := ComCall(12, this, "ptr", strQName, "int*", &nIndex := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return nIndex
    }

    /**
     * getType Method (SQLServerResultSet)
     * @remarks
     * This getType method is specified by the getType method in the java.sql.ResultSet interface.  
     *   
     *  This method can be used to determine the actual cursor type. If the application selected TYPE_FORWARD_ONLY or used a default cursor type, TYPE_FORWARD_ONLY will be returned.
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/gettype-method-sqlserverresultset
     */
    getType(nIndex) {
        strType := BSTR()
        result := ComCall(13, this, "int", nIndex, "ptr", strType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strType
    }

    /**
     * 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @returns {BSTR} 
     */
    getTypeFromName(strURI, strLocalName) {
        if(strURI is String) {
            pin := BSTR.Alloc(strURI)
            strURI := pin.Value
        }
        if(strLocalName is String) {
            pin := BSTR.Alloc(strLocalName)
            strLocalName := pin.Value
        }

        strType := BSTR()
        result := ComCall(14, this, "ptr", strURI, "ptr", strLocalName, "ptr", strType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strType
    }

    /**
     * 
     * @param {BSTR} strQName 
     * @returns {BSTR} 
     */
    getTypeFromQName(strQName) {
        if(strQName is String) {
            pin := BSTR.Alloc(strQName)
            strQName := pin.Value
        }

        strType := BSTR()
        result := ComCall(15, this, "ptr", strQName, "ptr", strType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strType
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     */
    getValue(nIndex) {
        strValue := BSTR()
        result := ComCall(16, this, "int", nIndex, "ptr", strValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strValue
    }

    /**
     * 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @returns {BSTR} 
     */
    getValueFromName(strURI, strLocalName) {
        if(strURI is String) {
            pin := BSTR.Alloc(strURI)
            strURI := pin.Value
        }
        if(strLocalName is String) {
            pin := BSTR.Alloc(strLocalName)
            strLocalName := pin.Value
        }

        strValue := BSTR()
        result := ComCall(17, this, "ptr", strURI, "ptr", strLocalName, "ptr", strValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strValue
    }

    /**
     * 
     * @param {BSTR} strQName 
     * @returns {BSTR} 
     */
    getValueFromQName(strQName) {
        if(strQName is String) {
            pin := BSTR.Alloc(strQName)
            strQName := pin.Value
        }

        strValue := BSTR()
        result := ComCall(18, this, "ptr", strQName, "ptr", strValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strValue
    }
}
