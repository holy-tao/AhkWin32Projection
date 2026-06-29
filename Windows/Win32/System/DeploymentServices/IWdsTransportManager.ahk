#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWdsTransportServer.ahk" { IWdsTransportServer }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Manages a WDS transport server. This is the top-level interface into the Windows Deployment Services (WDS) Transport Management API and the only interface that can be created using the CoCreateInstance function.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportmanager
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportManager extends IDispatch {
    /**
     * The interface identifier for IWdsTransportManager
     * @type {Guid}
     */
    static IID := Guid("{5b0d35f5-1b13-4afd-b878-6526dc340b5d}")

    /**
     * The class identifier for WdsTransportManager
     * @type {Guid}
     */
    static CLSID := Guid("{f21523f6-837c-4a58-af99-8a7e27f8ff59}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetWdsTransportServer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an object of the IWdsTransportServer interface that can be used to manage a WDS transport server. The method confirms that the system can reach a WDS transport server with the specified name.
     * @param {BSTR} bszServerName The name of the WDS transport server to be represented by this object. This can be a NetBIOS name or a fully qualified DNS name. If the value is an empty string, the object represents the local computer.
     * @returns {IWdsTransportServer} A pointer to the object of the  <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportserver">IWdsTransportServer</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmanager-getwdstransportserver
     */
    GetWdsTransportServer(bszServerName) {
        bszServerName := bszServerName is String ? BSTR.Alloc(bszServerName).Value : bszServerName

        result := ComCall(7, this, BSTR, bszServerName, "ptr*", &ppWdsTransportServer := 0, "HRESULT")
        return IWdsTransportServer(ppWdsTransportServer)
    }

    Query(iid) {
        if (IWdsTransportManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetWdsTransportServer := CallbackCreate(GetMethod(implObj, "GetWdsTransportServer"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetWdsTransportServer)
    }
}
