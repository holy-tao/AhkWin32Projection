#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWdsTransportCollection.ahk" { IWdsTransportCollection }

/**
 * This interface provides a method to retrieve all the clients currently connected to the TFTP server.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransporttftpmanager
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportTftpManager extends IDispatch {
    /**
     * The interface identifier for IWdsTransportTftpManager
     * @type {Guid}
     */
    static IID := Guid("{1327a7c8-ae8a-4fb3-8150-136227c37e9a}")

    /**
     * The class identifier for WdsTransportTftpManager
     * @type {Guid}
     */
    static CLSID := Guid("{c8e9dca2-3241-4e4d-b806-bc74019dfeda}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportTftpManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        RetrieveTftpClients : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportTftpManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns a pointer to the object of an IWdsTransportCollection interface containing a collection of objects of the IWdsTransportTftpClient interface for the clients currently connected to the TFTP server.
     * @returns {IWdsTransportCollection} A pointer to a pointer to an object of the <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportcollection">IWdsTransportCollection</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpmanager-retrievetftpclients
     */
    RetrieveTftpClients() {
        result := ComCall(7, this, "ptr*", &ppWdsTransportTftpClients := 0, "HRESULT")
        return IWdsTransportCollection(ppWdsTransportTftpClients)
    }

    Query(iid) {
        if (IWdsTransportTftpManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RetrieveTftpClients := CallbackCreate(GetMethod(implObj, "RetrieveTftpClients"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RetrieveTftpClients)
    }
}
