#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to receive a success or failure notification when a Windows Connect Now connect session completes.
 * @see https://docs.microsoft.com/windows/win32/api//wcndevice/nn-wcndevice-iwcnconnectnotify
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class IWCNConnectNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWCNConnectNotify
     * @type {Guid}
     */
    static IID => Guid("{c100be9f-d33a-4a4b-bf23-bbef4663d017}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConnectSucceeded", "ConnectFailed"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcnconnectnotify-connectsucceeded
     */
    ConnectSucceeded() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrFailure 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcnconnectnotify-connectfailed
     */
    ConnectFailed(hrFailure) {
        result := ComCall(4, this, "int", hrFailure, "HRESULT")
        return result
    }
}
