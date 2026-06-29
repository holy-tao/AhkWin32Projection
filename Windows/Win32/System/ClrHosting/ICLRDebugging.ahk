#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CLR_DEBUGGING_VERSION.ahk" { CLR_DEBUGGING_VERSION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICLRDebuggingLibraryProvider.ahk" { ICLRDebuggingLibraryProvider }
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\CLR_DEBUGGING_PROCESS_FLAGS.ahk" { CLR_DEBUGGING_PROCESS_FLAGS }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRDebugging extends IUnknown {
    /**
     * The interface identifier for ICLRDebugging
     * @type {Guid}
     */
    static IID := Guid("{d28f3c5a-9634-4206-a509-477552eefb10}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRDebugging interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OpenVirtualProcess : IntPtr
        CanUnloadNow       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRDebugging.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} moduleBaseAddress 
     * @param {IUnknown} pDataTarget 
     * @param {ICLRDebuggingLibraryProvider} pLibraryProvider 
     * @param {Pointer<CLR_DEBUGGING_VERSION>} pMaxDebuggerSupportedVersion 
     * @param {Pointer<Guid>} riidProcess 
     * @param {Pointer<IUnknown>} ppProcess 
     * @param {Pointer<CLR_DEBUGGING_VERSION>} pVersion 
     * @param {Pointer<CLR_DEBUGGING_PROCESS_FLAGS>} pdwFlags 
     * @returns {HRESULT} 
     */
    OpenVirtualProcess(moduleBaseAddress, pDataTarget, pLibraryProvider, pMaxDebuggerSupportedVersion, riidProcess, ppProcess, pVersion, pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", moduleBaseAddress, "ptr", pDataTarget, "ptr", pLibraryProvider, CLR_DEBUGGING_VERSION.Ptr, pMaxDebuggerSupportedVersion, Guid.Ptr, riidProcess, IUnknown.Ptr, ppProcess, CLR_DEBUGGING_VERSION.Ptr, pVersion, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HMODULE} _hModule 
     * @returns {HRESULT} 
     */
    CanUnloadNow(_hModule) {
        result := ComCall(4, this, HMODULE, _hModule, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRDebugging.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OpenVirtualProcess := CallbackCreate(GetMethod(implObj, "OpenVirtualProcess"), flags, 9)
        this.vtbl.CanUnloadNow := CallbackCreate(GetMethod(implObj, "CanUnloadNow"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OpenVirtualProcess)
        CallbackFree(this.vtbl.CanUnloadNow)
    }
}
