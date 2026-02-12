#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to receive a success or failure notification when a Windows Connect Now connect session completes.
 * @see https://learn.microsoft.com/windows/win32/api//content/wcndevice/nn-wcndevice-iwcnconnectnotify
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
     * The IWCNConnectNotify::ConnectSucceeded callback method that indicates a successful IWCNDevice::Connect operation.
     * @remarks
     * Notification of  success does not implicitly indicate that the device is ready, as some devices reboot in order to apply settings provided during the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-connect">IWCNDevice::Connect</a> operation.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nn-wcndevice-iwcndevice">IWCNDevice</a> interface was used to obtain network settings from a device, then the network profile is immediately ready for use.
     * @returns {HRESULT} ...
     * @see https://learn.microsoft.com/windows/win32/api//content/wcndevice/nf-wcndevice-iwcnconnectnotify-connectsucceeded
     */
    ConnectSucceeded() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Callback method indicates a IWCNDevice::Connect failure.
     * @param {HRESULT} hrFailure An <b>HRESULT</b> that specifies the reason for the connection failure.
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api//content/wcndevice/nf-wcndevice-iwcnconnectnotify-connectfailed
     */
    ConnectFailed(hrFailure) {
        result := ComCall(4, this, "int", hrFailure, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
