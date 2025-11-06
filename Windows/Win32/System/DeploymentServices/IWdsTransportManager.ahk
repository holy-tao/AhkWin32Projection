#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWdsTransportServer.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages a WDS transport server. This is the top-level interface into the Windows Deployment Services (WDS) Transport Management API and the only interface that can be created using the CoCreateInstance function.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportmanager
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportManager
     * @type {Guid}
     */
    static IID => Guid("{5b0d35f5-1b13-4afd-b878-6526dc340b5d}")

    /**
     * The class identifier for WdsTransportManager
     * @type {Guid}
     */
    static CLSID => Guid("{f21523f6-837c-4a58-af99-8a7e27f8ff59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWdsTransportServer"]

    /**
     * 
     * @param {BSTR} bszServerName 
     * @returns {IWdsTransportServer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmanager-getwdstransportserver
     */
    GetWdsTransportServer(bszServerName) {
        bszServerName := bszServerName is String ? BSTR.Alloc(bszServerName).Value : bszServerName

        result := ComCall(7, this, "ptr", bszServerName, "ptr*", &ppWdsTransportServer := 0, "HRESULT")
        return IWdsTransportServer(ppWdsTransportServer)
    }
}
