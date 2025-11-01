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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "SetComplete", "SetAbort", "EnableCommit", "DisableCommit", "IsInTransaction", "IsSecurityEnabled", "IsCallerInRole"]

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontext-createinstance
     */
    CreateInstance(rclsid, riid, ppv) {
        result := ComCall(3, this, "ptr", rclsid, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontext-setcomplete
     */
    SetComplete() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontext-setabort
     */
    SetAbort() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontext-enablecommit
     */
    EnableCommit() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontext-disablecommit
     */
    DisableCommit() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontext-isintransaction
     */
    IsInTransaction() {
        result := ComCall(8, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontext-issecurityenabled
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
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontext-iscallerinrole
     */
    IsCallerInRole(bstrRole, pfIsInRole) {
        bstrRole := bstrRole is String ? BSTR.Alloc(bstrRole).Value : bstrRole

        result := ComCall(10, this, "ptr", bstrRole, "ptr", pfIsInRole, "HRESULT")
        return result
    }
}
