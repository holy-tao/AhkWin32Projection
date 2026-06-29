#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWdsTransportSetupManager.ahk" { IWdsTransportSetupManager }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWdsTransportCollection.ahk" { IWdsTransportCollection }

/**
 * This interface inherits from the IWdsTransportSetupManager interface and extends it. It is available beginning with Windows Server 2012.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportsetupmanager2
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportSetupManager2 extends IWdsTransportSetupManager {
    /**
     * The interface identifier for IWdsTransportSetupManager2
     * @type {Guid}
     */
    static IID := Guid("{02be79da-7e9e-4366-8b6e-2aa9a91be47f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportSetupManager2 interfaces
    */
    struct Vtbl extends IWdsTransportSetupManager.Vtbl {
        get_TftpCapabilities : IntPtr
        get_ContentProviders : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportSetupManager2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    TftpCapabilities {
        get => this.get_TftpCapabilities()
    }

    /**
     * @type {IWdsTransportCollection} 
     */
    ContentProviders {
        get => this.get_ContentProviders()
    }

    /**
     * Receives a mask of WDSTRANSPORT_TFTP_CAPABILITY values that indicates which WDS TFTP features are supported by the WDS TFTP server.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsetupmanager2-get_tftpcapabilities
     */
    get_TftpCapabilities() {
        result := ComCall(12, this, "uint*", &pulTftpCapabilities := 0, "HRESULT")
        return pulTftpCapabilities
    }

    /**
     * Receives a pointer to an instance of the IWdsTransportCollection interface. The collection contains objects of the IWdsTransportContentProvider interface for the content providers registered on the server.
     * @returns {IWdsTransportCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsetupmanager2-get_contentproviders
     */
    get_ContentProviders() {
        result := ComCall(13, this, "ptr*", &ppProviderCollection := 0, "HRESULT")
        return IWdsTransportCollection(ppProviderCollection)
    }

    Query(iid) {
        if (IWdsTransportSetupManager2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_TftpCapabilities := CallbackCreate(GetMethod(implObj, "get_TftpCapabilities"), flags, 2)
        this.vtbl.get_ContentProviders := CallbackCreate(GetMethod(implObj, "get_ContentProviders"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_TftpCapabilities)
        CallbackFree(this.vtbl.get_ContentProviders)
    }
}
