#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Retrieves information about an assembly when using managed code in the .NET Framework common language runtime.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iassemblylocator
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IAssemblyLocator extends IDispatch {
    /**
     * The interface identifier for IAssemblyLocator
     * @type {Guid}
     */
    static IID := Guid("{391ffbb9-a8ee-432a-abc8-baa238dab90f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAssemblyLocator interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetModules : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAssemblyLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Used to get the names of the modules that are contained in an assembly.
     * @param {BSTR} applicationDir The directory containing the application.
     * @param {BSTR} applicationName The name of the application domain.
     * @param {BSTR} assemblyName The name of the assembly.
     * @returns {Pointer<SAFEARRAY>} An array listing the names of the modules in the assembly.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iassemblylocator-getmodules
     */
    GetModules(applicationDir, applicationName, assemblyName) {
        applicationDir := applicationDir is String ? BSTR.Alloc(applicationDir).Value : applicationDir
        applicationName := applicationName is String ? BSTR.Alloc(applicationName).Value : applicationName
        assemblyName := assemblyName is String ? BSTR.Alloc(assemblyName).Value : assemblyName

        result := ComCall(7, this, BSTR, applicationDir, BSTR, applicationName, BSTR, assemblyName, "ptr*", &pModules := 0, "HRESULT")
        return pModules
    }

    Query(iid) {
        if (IAssemblyLocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetModules := CallbackCreate(GetMethod(implObj, "GetModules"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetModules)
    }
}
