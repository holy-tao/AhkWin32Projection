#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWdsTransportNamespace.ahk

/**
 * The WDS transport server can create, start, and end multicast sessions that are hosted by a namespace object of this interface.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportnamespaceautocast
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportNamespaceAutoCast extends IWdsTransportNamespace{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportNamespaceAutoCast
     * @type {Guid}
     */
    static IID => Guid("{ad931a72-c4bd-4c41-8fbc-59c9c748df9e}")

    /**
     * The class identifier for WdsTransportNamespaceAutoCast
     * @type {Guid}
     */
    static CLSID => Guid("{b091f5a8-6a99-478d-b23b-09e8fee04574}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
