#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a reserved method that is used by the Network Diagnostics Framework (NDF).
 * @remarks
 * This interface is reserved for system use.
 * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nn-ndhelper-inetdiaghelperutilfactory
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct INetDiagHelperUtilFactory extends IUnknown {
    /**
     * The interface identifier for INetDiagHelperUtilFactory
     * @type {Guid}
     */
    static IID := Guid("{104613fb-bc57-4178-95ba-88809698354a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetDiagHelperUtilFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateUtilityInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetDiagHelperUtilFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Used by the Network Diagnostics Framework (NDF). This method is reserved for system use. (INetDiagHelperUtilFactory.CreateUtilityInstance)
     * @remarks
     * This method is reserved for system use.
     * @param {Pointer<Guid>} riid Reserved for system use.
     * @returns {Pointer<Void>} Reserved for system use.
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelperutilfactory-createutilityinstance
     */
    CreateUtilityInstance(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    Query(iid) {
        if (INetDiagHelperUtilFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateUtilityInstance := CallbackCreate(GetMethod(implObj, "CreateUtilityInstance"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateUtilityInstance)
    }
}
