#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWdsTransportNamespace.ahk

/**
 * Represents a base interface to the derived interfaces:\_IWdsTransportNamespaceScheduledCastManualStart and IWdsTransportNamespaceScheduledCastAutoStart.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportnamespacescheduledcast
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportNamespaceScheduledCast extends IWdsTransportNamespace{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportNamespaceScheduledCast
     * @type {Guid}
     */
    static IID => Guid("{3840cecf-d76c-416e-a4cc-31c741d2874b}")

    /**
     * The class identifier for WdsTransportNamespaceScheduledCast
     * @type {Guid}
     */
    static CLSID => Guid("{badc1897-7025-44eb-9108-fb61c4055792}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartTransmission"]

    /**
     * Starts a transmission on a namespace.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespacescheduledcast-starttransmission
     */
    StartTransmission() {
        result := ComCall(28, this, "HRESULT")
        return result
    }
}
