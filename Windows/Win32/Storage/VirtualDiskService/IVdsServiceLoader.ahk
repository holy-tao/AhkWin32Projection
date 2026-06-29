#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IVdsService.ahk" { IVdsService }

/**
 * Instantiates a service loader object.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsserviceloader
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsServiceLoader extends IUnknown {
    /**
     * The interface identifier for IVdsServiceLoader
     * @type {Guid}
     */
    static IID := Guid("{e0393303-90d4-4a97-ab71-e9b671ee2729}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsServiceLoader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LoadService : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsServiceLoader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Launches VDS on the specified computer and returns a pointer to the service object.
     * @remarks
     * Although <b>S_OK</b> indicates that VDS has launched successfully, the service initialization can be incomplete when the method returns. For this reason, after calling this method, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-waitforserviceready">IVdsService::WaitForServiceReady</a> method to wait for VDS initialization to complete.
     * 
     * For a code example, see <a href="https://docs.microsoft.com/windows/desktop/VDS/loading-vds">Loading VDS</a>.
     * @param {PWSTR} pwszMachineName This parameter must be set to <b>NULL</b>.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This parameter contains the name of the host computer. Setting it to <b>NULL</b> causes VDS to be loaded and initialized on the local host.
     * @returns {IVdsService} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsservice">IVdsService</a> interface pointer. Callers must release the interface when it is no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceloader-loadservice
     */
    LoadService(pwszMachineName) {
        pwszMachineName := pwszMachineName is String ? StrPtr(pwszMachineName) : pwszMachineName

        result := ComCall(3, this, "ptr", pwszMachineName, "ptr*", &ppService := 0, "HRESULT")
        return IVdsService(ppService)
    }

    Query(iid) {
        if (IVdsServiceLoader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LoadService := CallbackCreate(GetMethod(implObj, "LoadService"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LoadService)
    }
}
