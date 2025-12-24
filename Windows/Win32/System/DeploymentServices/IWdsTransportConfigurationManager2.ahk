#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWdsTransportMulticastSessionPolicy.ahk
#Include .\IWdsTransportConfigurationManager.ahk

/**
 * This interface inherits from the IWdsTransportConfigurationManager interface and extends it with configuration settings, such as multicast session policy, that are available beginning with Windows Server 2008 R2.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportconfigurationmanager2
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportConfigurationManager2 extends IWdsTransportConfigurationManager{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportConfigurationManager2
     * @type {Guid}
     */
    static IID => Guid("{d0d85caf-a153-4f1d-a9dd-96f431c50717}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MulticastSessionPolicy"]

    /**
     * @type {IWdsTransportMulticastSessionPolicy} 
     */
    MulticastSessionPolicy {
        get => this.get_MulticastSessionPolicy()
    }

    /**
     * Receives an interface pointer to the Configuration Manager’s Multicast Session Policy object. This object can be used to configure multicast session parameters that are available beginning with Windows Server 2008 R2.
     * @returns {IWdsTransportMulticastSessionPolicy} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager2-get_multicastsessionpolicy
     */
    get_MulticastSessionPolicy() {
        result := ComCall(16, this, "ptr*", &ppWdsTransportMulticastSessionPolicy := 0, "HRESULT")
        return IWdsTransportMulticastSessionPolicy(ppWdsTransportMulticastSessionPolicy)
    }
}
