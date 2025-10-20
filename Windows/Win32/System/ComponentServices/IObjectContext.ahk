#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides access to the current object's context. An object's context is primarily used when working with transactions or dealing with the security of an object.
 * @remarks
 * 
  * As with any COM object, you must release an <b>IObjectContext</b> object when you are finished using it, unless it is a local variable.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iobjectcontext
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IObjectContext extends IUnknown{
    /**
     * The interface identifier for IObjectContext
     * @type {Guid}
     */
    static IID => Guid("{51372ae0-cae7-11cf-be81-00aa00a2fa25}")

    /**
     * The class identifier for ObjectContext
     * @type {Guid}
     */
    static CLSID => Guid("{74c08646-cedb-11cf-8b49-00aa00b8a790}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateInstance(rclsid, riid, ppv) {
        result := ComCall(3, this, "ptr", rclsid, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetComplete() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetAbort() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnableCommit() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableCommit() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsInTransaction() {
        result := ComCall(8, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsSecurityEnabled() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRole 
     * @param {Pointer<BOOL>} pfIsInRole 
     * @returns {HRESULT} 
     */
    IsCallerInRole(bstrRole, pfIsInRole) {
        bstrRole := bstrRole is String ? BSTR.Alloc(bstrRole).Value : bstrRole

        result := ComCall(10, this, "ptr", bstrRole, "ptr", pfIsInRole, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
