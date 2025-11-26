#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Defines operations and session settings.
 * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nn-wsmandisp-iwsmansession
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class IWSManSession extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSManSession
     * @type {Guid}
     */
    static IID => Guid("{fc84fc58-1286-40c4-9da0-c8ef6ec241e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Get", "Put", "Create", "Delete", "Invoke", "Enumerate", "Identify", "get_Error", "get_BatchItems", "put_BatchItems", "get_Timeout", "put_Timeout"]

    /**
     * @type {BSTR} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * @type {Integer} 
     */
    BatchItems {
        get => this.get_BatchItems()
        set => this.put_BatchItems(value)
    }

    /**
     * @type {Integer} 
     */
    Timeout {
        get => this.get_Timeout()
        set => this.put_Timeout(value)
    }

    /**
     * 
     * @param {VARIANT} resourceUri 
     * @param {Integer} flags 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmansession-get
     */
    Get(resourceUri, flags) {
        resource := BSTR()
        result := ComCall(7, this, "ptr", resourceUri, "int", flags, "ptr", resource, "HRESULT")
        return resource
    }

    /**
     * 
     * @param {VARIANT} resourceUri 
     * @param {BSTR} resource 
     * @param {Integer} flags 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmansession-put
     */
    Put(resourceUri, resource, flags) {
        resource := resource is String ? BSTR.Alloc(resource).Value : resource

        resultResource := BSTR()
        result := ComCall(8, this, "ptr", resourceUri, "ptr", resource, "int", flags, "ptr", resultResource, "HRESULT")
        return resultResource
    }

    /**
     * 
     * @param {VARIANT} resourceUri 
     * @param {BSTR} resource 
     * @param {Integer} flags 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmansession-create
     */
    Create(resourceUri, resource, flags) {
        resource := resource is String ? BSTR.Alloc(resource).Value : resource

        newUri := BSTR()
        result := ComCall(9, this, "ptr", resourceUri, "ptr", resource, "int", flags, "ptr", newUri, "HRESULT")
        return newUri
    }

    /**
     * 
     * @param {VARIANT} resourceUri 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmansession-delete
     */
    Delete(resourceUri, flags) {
        result := ComCall(10, this, "ptr", resourceUri, "int", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} actionUri 
     * @param {VARIANT} resourceUri 
     * @param {BSTR} parameters 
     * @param {Integer} flags 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmansession-invoke
     */
    Invoke(actionUri, resourceUri, parameters, flags) {
        actionUri := actionUri is String ? BSTR.Alloc(actionUri).Value : actionUri
        parameters := parameters is String ? BSTR.Alloc(parameters).Value : parameters

        result := BSTR()
        result := ComCall(11, this, "ptr", actionUri, "ptr", resourceUri, "ptr", parameters, "int", flags, "ptr", result, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} resourceUri 
     * @param {BSTR} filter 
     * @param {BSTR} dialect 
     * @param {Integer} flags 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmansession-enumerate
     */
    Enumerate(resourceUri, filter, dialect, flags) {
        filter := filter is String ? BSTR.Alloc(filter).Value : filter
        dialect := dialect is String ? BSTR.Alloc(dialect).Value : dialect

        result := ComCall(12, this, "ptr", resourceUri, "ptr", filter, "ptr", dialect, "int", flags, "ptr*", &resultSet := 0, "HRESULT")
        return IDispatch(resultSet)
    }

    /**
     * 
     * @param {Integer} flags 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmansession-identify
     */
    Identify(flags) {
        result := BSTR()
        result := ComCall(13, this, "int", flags, "ptr", result, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmansession-get_error
     */
    get_Error() {
        value := BSTR()
        result := ComCall(14, this, "ptr", value, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmansession-get_batchitems
     */
    get_BatchItems() {
        result := ComCall(15, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmansession-put_batchitems
     */
    put_BatchItems(value) {
        result := ComCall(16, this, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmansession-get_timeout
     */
    get_Timeout() {
        result := ComCall(17, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmansession-put_timeout
     */
    put_Timeout(value) {
        result := ComCall(18, this, "int", value, "HRESULT")
        return result
    }
}
