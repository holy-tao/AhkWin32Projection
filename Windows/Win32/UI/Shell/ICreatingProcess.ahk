#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICreateProcessInputs.ahk" { ICreateProcessInputs }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Used by ShellExecuteEx and IContextMenu to allow the caller to alter some parameters of the process being created.
 * @remarks
 * The caller should install an object into the site chain which implements <a href="https://docs.microsoft.com/dotnet/api/microsoft.visualstudio.shell.package.microsoft-visualstudio-ole-interop-iserviceprovider-queryservice?view=visualstudiosdk-2017&preserve-view=true">IServiceProvider::QueryService</a> and responds to the <b>SID_ExecuteCreatingProcess</b> service ID with an object that implements the <b>ICreatingProcess</b> interface.
 * 
 * After performing the desired operations, the object should forward the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icreatingprocess-oncreating">ICreatingProcess::OnCreating</a> call up the site chain to allow other members of the site chain to participate.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icreatingprocess
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ICreatingProcess extends IUnknown {
    /**
     * The interface identifier for ICreatingProcess
     * @type {Guid}
     */
    static IID := Guid("{c2b937a9-3110-4398-8a56-f34c6342d244}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICreatingProcess interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnCreating : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICreatingProcess.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Allows you to modify the parameters of the process being created.
     * @param {ICreateProcessInputs} pcpi A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icreateprocessinputs">ICreateProcessInputs</a> interface which allows you to set some parameters for the process that is being created.
     * @returns {HRESULT} <b> S_OK</b> if the method succeeds. Otherwise, an <b>HRESULT</b> error code, and the process is not created.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icreatingprocess-oncreating
     */
    OnCreating(pcpi) {
        result := ComCall(3, this, "ptr", pcpi, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICreatingProcess.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnCreating := CallbackCreate(GetMethod(implObj, "OnCreating"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnCreating)
    }
}
