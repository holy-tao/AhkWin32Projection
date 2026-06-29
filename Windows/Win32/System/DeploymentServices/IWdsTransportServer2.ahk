#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWdsTransportTftpManager.ahk" { IWdsTransportTftpManager }
#Import ".\IWdsTransportServer.ahk" { IWdsTransportServer }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * This interface inherits from the IWdsTransportServer interface and extends it. It is available beginning with Windows Server 2012.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportserver2
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportServer2 extends IWdsTransportServer {
    /**
     * The interface identifier for IWdsTransportServer2
     * @type {Guid}
     */
    static IID := Guid("{256e999f-6df4-4538-81b9-857b9ab8fb47}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportServer2 interfaces
    */
    struct Vtbl extends IWdsTransportServer.Vtbl {
        get_TftpManager : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportServer2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IWdsTransportTftpManager} 
     */
    TftpManager {
        get => this.get_TftpManager()
    }

    /**
     * Receives a pointer to the object of the IWdsTransportTftpManager interface used to manage the WDS TFTP server.
     * @returns {IWdsTransportTftpManager} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportserver2-get_tftpmanager
     */
    get_TftpManager() {
        result := ComCall(12, this, "ptr*", &ppWdsTransportTftpManager := 0, "HRESULT")
        return IWdsTransportTftpManager(ppWdsTransportTftpManager)
    }

    Query(iid) {
        if (IWdsTransportServer2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_TftpManager := CallbackCreate(GetMethod(implObj, "get_TftpManager"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_TftpManager)
    }
}
