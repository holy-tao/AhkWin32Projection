#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWdsTransportMulticastSessionPolicy.ahk" { IWdsTransportMulticastSessionPolicy }
#Import ".\IWdsTransportConfigurationManager.ahk" { IWdsTransportConfigurationManager }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * This interface inherits from the IWdsTransportConfigurationManager interface and extends it with configuration settings, such as multicast session policy, that are available beginning with Windows Server 2008 R2.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportconfigurationmanager2
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportConfigurationManager2 extends IWdsTransportConfigurationManager {
    /**
     * The interface identifier for IWdsTransportConfigurationManager2
     * @type {Guid}
     */
    static IID := Guid("{d0d85caf-a153-4f1d-a9dd-96f431c50717}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportConfigurationManager2 interfaces
    */
    struct Vtbl extends IWdsTransportConfigurationManager.Vtbl {
        get_MulticastSessionPolicy : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportConfigurationManager2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IWdsTransportMulticastSessionPolicy} 
     */
    MulticastSessionPolicy {
        get => this.get_MulticastSessionPolicy()
    }

    /**
     * Receives an interface pointer to the Configuration Manager’s Multicast Session Policy object. This object can be used to configure multicast session parameters that are available beginning with Windows Server 2008 R2.
     * @returns {IWdsTransportMulticastSessionPolicy} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager2-get_multicastsessionpolicy
     */
    get_MulticastSessionPolicy() {
        result := ComCall(16, this, "ptr*", &ppWdsTransportMulticastSessionPolicy := 0, "HRESULT")
        return IWdsTransportMulticastSessionPolicy(ppWdsTransportMulticastSessionPolicy)
    }

    Query(iid) {
        if (IWdsTransportConfigurationManager2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MulticastSessionPolicy := CallbackCreate(GetMethod(implObj, "get_MulticastSessionPolicy"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MulticastSessionPolicy)
    }
}
