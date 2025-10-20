#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWdsTransportNamespaceScheduledCast.ahk

/**
 * An administrator must start transmission on an object of an IWdsTransportNamespaceScheduledCastManualStart interface. Applications can continue to join sessions of the namespace until the administrator starts transmission.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportnamespacescheduledcastmanualstart
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportNamespaceScheduledCastManualStart extends IWdsTransportNamespaceScheduledCast{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportNamespaceScheduledCastManualStart
     * @type {Guid}
     */
    static IID => Guid("{013e6e4c-e6a7-4fb5-b7ff-d9f5da805c31}")

    /**
     * The class identifier for WdsTransportNamespaceScheduledCastManualStart
     * @type {Guid}
     */
    static CLSID => Guid("{d3e1a2aa-caac-460e-b98a-47f9f318a1fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 29

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
