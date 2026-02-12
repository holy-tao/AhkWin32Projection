#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLOpsProfile extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLOpsProfile
     * @type {Guid}
     */
    static IID => Guid("{3050f401-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["addRequest", "clearRequest", "doRequest", "getAttribute", "setAttribute", "commitChanges", "addReadRequest", "doReadRequest", "doWriteRequest"]

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} reserved 
     * @returns {VARIANT_BOOL} 
     */
    addRequest(name, reserved) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        result := ComCall(7, this, "ptr", name, "ptr", reserved, "short*", &success := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return success
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    clearRequest() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT} usage 
     * @param {VARIANT} fname 
     * @param {VARIANT} domain 
     * @param {VARIANT} path_ 
     * @param {VARIANT} expire 
     * @param {VARIANT} reserved 
     * @returns {HRESULT} 
     */
    doRequest(usage, fname, domain, path_, expire, reserved) {
        result := ComCall(9, this, "ptr", usage, "ptr", fname, "ptr", domain, "ptr", path_, "ptr", expire, "ptr", reserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * getAttributes Method (SQLServerDatabaseMetaData)
     * @remarks
     * This getAttributes method is specified by the getAttributes method in the java.sql.DatabaseMetaData interface.
     * @param {BSTR} name 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/getattributes-method-sqlserverdatabasemetadata
     */
    getAttribute(name) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        value := BSTR()
        result := ComCall(10, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} value 
     * @param {VARIANT} prefs 
     * @returns {VARIANT_BOOL} 
     */
    setAttribute(name, value, prefs) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }
        if(value is String) {
            pin := BSTR.Alloc(value)
            value := pin.Value
        }

        result := ComCall(11, this, "ptr", name, "ptr", value, "ptr", prefs, "short*", &success := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return success
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    commitChanges() {
        result := ComCall(12, this, "short*", &success := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return success
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} reserved 
     * @returns {VARIANT_BOOL} 
     */
    addReadRequest(name, reserved) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        result := ComCall(13, this, "ptr", name, "ptr", reserved, "short*", &success := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return success
    }

    /**
     * 
     * @param {VARIANT} usage 
     * @param {VARIANT} fname 
     * @param {VARIANT} domain 
     * @param {VARIANT} path_ 
     * @param {VARIANT} expire 
     * @param {VARIANT} reserved 
     * @returns {HRESULT} 
     */
    doReadRequest(usage, fname, domain, path_, expire, reserved) {
        result := ComCall(14, this, "ptr", usage, "ptr", fname, "ptr", domain, "ptr", path_, "ptr", expire, "ptr", reserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    doWriteRequest() {
        result := ComCall(15, this, "short*", &success := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return success
    }
}
