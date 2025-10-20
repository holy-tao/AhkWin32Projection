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
     * 
     * @param {VARIANT} resourceUri 
     * @param {Integer} flags 
     * @param {Pointer<BSTR>} resource 
     * @returns {HRESULT} 
     */
    Get(resourceUri, flags, resource) {
        result := ComCall(7, this, "ptr", resourceUri, "int", flags, "ptr", resource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} resourceUri 
     * @param {BSTR} resource 
     * @param {Integer} flags 
     * @param {Pointer<BSTR>} resultResource 
     * @returns {HRESULT} 
     */
    Put(resourceUri, resource, flags, resultResource) {
        resource := resource is String ? BSTR.Alloc(resource).Value : resource

        result := ComCall(8, this, "ptr", resourceUri, "ptr", resource, "int", flags, "ptr", resultResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} resourceUri 
     * @param {BSTR} resource 
     * @param {Integer} flags 
     * @param {Pointer<BSTR>} newUri 
     * @returns {HRESULT} 
     */
    Create(resourceUri, resource, flags, newUri) {
        resource := resource is String ? BSTR.Alloc(resource).Value : resource

        result := ComCall(9, this, "ptr", resourceUri, "ptr", resource, "int", flags, "ptr", newUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} resourceUri 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    Delete(resourceUri, flags) {
        result := ComCall(10, this, "ptr", resourceUri, "int", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} actionUri 
     * @param {VARIANT} resourceUri 
     * @param {BSTR} parameters 
     * @param {Integer} flags 
     * @param {Pointer<BSTR>} result 
     * @returns {HRESULT} 
     */
    Invoke(actionUri, resourceUri, parameters, flags, result) {
        actionUri := actionUri is String ? BSTR.Alloc(actionUri).Value : actionUri
        parameters := parameters is String ? BSTR.Alloc(parameters).Value : parameters

        result := ComCall(11, this, "ptr", actionUri, "ptr", resourceUri, "ptr", parameters, "int", flags, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} resourceUri 
     * @param {BSTR} filter 
     * @param {BSTR} dialect 
     * @param {Integer} flags 
     * @param {Pointer<IDispatch>} resultSet 
     * @returns {HRESULT} 
     */
    Enumerate(resourceUri, filter, dialect, flags, resultSet) {
        filter := filter is String ? BSTR.Alloc(filter).Value : filter
        dialect := dialect is String ? BSTR.Alloc(dialect).Value : dialect

        result := ComCall(12, this, "ptr", resourceUri, "ptr", filter, "ptr", dialect, "int", flags, "ptr", resultSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Pointer<BSTR>} result 
     * @returns {HRESULT} 
     */
    Identify(flags, result) {
        result := ComCall(13, this, "int", flags, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     */
    get_Error(value) {
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_BatchItems(value) {
        result := ComCall(15, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BatchItems(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_Timeout(value) {
        result := ComCall(17, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Timeout(value) {
        result := ComCall(18, this, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
