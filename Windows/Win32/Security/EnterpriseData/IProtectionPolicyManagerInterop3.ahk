#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\WinRT\IInspectable.ahk" { IInspectable }
#Import "..\..\System\WinRT\HSTRING.ahk" { HSTRING }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Security.EnterpriseData
 */
export default struct IProtectionPolicyManagerInterop3 extends IInspectable {
    /**
     * The interface identifier for IProtectionPolicyManagerInterop3
     * @type {Guid}
     */
    static IID := Guid("{c1c03933-b398-4d93-b0fd-2972adf802c2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProtectionPolicyManagerInterop3 interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        RequestAccessWithBehaviorForWindowAsync                            : IntPtr
        RequestAccessForAppWithBehaviorForWindowAsync                      : IntPtr
        RequestAccessToFilesForAppForWindowAsync                           : IntPtr
        RequestAccessToFilesForAppWithMessageAndBehaviorForWindowAsync     : IntPtr
        RequestAccessToFilesForProcessForWindowAsync                       : IntPtr
        RequestAccessToFilesForProcessWithMessageAndBehaviorForWindowAsync : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProtectionPolicyManagerInterop3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} targetIdentity 
     * @param {IUnknown} auditInfoUnk 
     * @param {HSTRING} messageFromApp 
     * @param {Integer} behavior 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RequestAccessWithBehaviorForWindowAsync(appWindow, sourceIdentity, targetIdentity, auditInfoUnk, messageFromApp, behavior, riid) {
        result := ComCall(6, this, HWND, appWindow, HSTRING, sourceIdentity, HSTRING, targetIdentity, "ptr", auditInfoUnk, HSTRING, messageFromApp, "uint", behavior, Guid.Ptr, riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} appPackageFamilyName 
     * @param {IUnknown} auditInfoUnk 
     * @param {HSTRING} messageFromApp 
     * @param {Integer} behavior 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RequestAccessForAppWithBehaviorForWindowAsync(appWindow, sourceIdentity, appPackageFamilyName, auditInfoUnk, messageFromApp, behavior, riid) {
        result := ComCall(7, this, HWND, appWindow, HSTRING, sourceIdentity, HSTRING, appPackageFamilyName, "ptr", auditInfoUnk, HSTRING, messageFromApp, "uint", behavior, Guid.Ptr, riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {IUnknown} sourceItemListUnk 
     * @param {HSTRING} appPackageFamilyName 
     * @param {IUnknown} auditInfoUnk 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RequestAccessToFilesForAppForWindowAsync(appWindow, sourceItemListUnk, appPackageFamilyName, auditInfoUnk, riid) {
        result := ComCall(8, this, HWND, appWindow, "ptr", sourceItemListUnk, HSTRING, appPackageFamilyName, "ptr", auditInfoUnk, Guid.Ptr, riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {IUnknown} sourceItemListUnk 
     * @param {HSTRING} appPackageFamilyName 
     * @param {IUnknown} auditInfoUnk 
     * @param {HSTRING} messageFromApp 
     * @param {Integer} behavior 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RequestAccessToFilesForAppWithMessageAndBehaviorForWindowAsync(appWindow, sourceItemListUnk, appPackageFamilyName, auditInfoUnk, messageFromApp, behavior, riid) {
        result := ComCall(9, this, HWND, appWindow, "ptr", sourceItemListUnk, HSTRING, appPackageFamilyName, "ptr", auditInfoUnk, HSTRING, messageFromApp, "uint", behavior, Guid.Ptr, riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {IUnknown} sourceItemListUnk 
     * @param {Integer} processId 
     * @param {IUnknown} auditInfoUnk 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RequestAccessToFilesForProcessForWindowAsync(appWindow, sourceItemListUnk, processId, auditInfoUnk, riid) {
        result := ComCall(10, this, HWND, appWindow, "ptr", sourceItemListUnk, "uint", processId, "ptr", auditInfoUnk, Guid.Ptr, riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {IUnknown} sourceItemListUnk 
     * @param {Integer} processId 
     * @param {IUnknown} auditInfoUnk 
     * @param {HSTRING} messageFromApp 
     * @param {Integer} behavior 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RequestAccessToFilesForProcessWithMessageAndBehaviorForWindowAsync(appWindow, sourceItemListUnk, processId, auditInfoUnk, messageFromApp, behavior, riid) {
        result := ComCall(11, this, HWND, appWindow, "ptr", sourceItemListUnk, "uint", processId, "ptr", auditInfoUnk, HSTRING, messageFromApp, "uint", behavior, Guid.Ptr, riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    Query(iid) {
        if (IProtectionPolicyManagerInterop3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestAccessWithBehaviorForWindowAsync := CallbackCreate(GetMethod(implObj, "RequestAccessWithBehaviorForWindowAsync"), flags, 9)
        this.vtbl.RequestAccessForAppWithBehaviorForWindowAsync := CallbackCreate(GetMethod(implObj, "RequestAccessForAppWithBehaviorForWindowAsync"), flags, 9)
        this.vtbl.RequestAccessToFilesForAppForWindowAsync := CallbackCreate(GetMethod(implObj, "RequestAccessToFilesForAppForWindowAsync"), flags, 7)
        this.vtbl.RequestAccessToFilesForAppWithMessageAndBehaviorForWindowAsync := CallbackCreate(GetMethod(implObj, "RequestAccessToFilesForAppWithMessageAndBehaviorForWindowAsync"), flags, 9)
        this.vtbl.RequestAccessToFilesForProcessForWindowAsync := CallbackCreate(GetMethod(implObj, "RequestAccessToFilesForProcessForWindowAsync"), flags, 7)
        this.vtbl.RequestAccessToFilesForProcessWithMessageAndBehaviorForWindowAsync := CallbackCreate(GetMethod(implObj, "RequestAccessToFilesForProcessWithMessageAndBehaviorForWindowAsync"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestAccessWithBehaviorForWindowAsync)
        CallbackFree(this.vtbl.RequestAccessForAppWithBehaviorForWindowAsync)
        CallbackFree(this.vtbl.RequestAccessToFilesForAppForWindowAsync)
        CallbackFree(this.vtbl.RequestAccessToFilesForAppWithMessageAndBehaviorForWindowAsync)
        CallbackFree(this.vtbl.RequestAccessToFilesForProcessForWindowAsync)
        CallbackFree(this.vtbl.RequestAccessToFilesForProcessWithMessageAndBehaviorForWindowAsync)
    }
}
