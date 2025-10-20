#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides methods for obtaining information about the running package and establishing event sinks.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-imtsevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IMtsEvents extends IDispatch{
    /**
     * The interface identifier for IMtsEvents
     * @type {Guid}
     */
    static IID => Guid("{bacedf4d-74ab-11d0-b162-00aa00ba3258}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_PackageName(pVal) {
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_PackageGuid(pVal) {
        result := ComCall(8, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} vEvent 
     * @returns {HRESULT} 
     */
    PostEvent(vEvent) {
        result := ComCall(9, this, "ptr", vEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_FireEvents(pVal) {
        result := ComCall(10, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} id 
     * @returns {HRESULT} 
     */
    GetProcessID(id) {
        result := ComCall(11, this, "int*", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
