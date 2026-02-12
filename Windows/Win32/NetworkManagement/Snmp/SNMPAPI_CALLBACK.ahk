#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The Microsoft WinSNMP implementation calls the SNMPAPI_CALLBACK function to notify a WinSNMP session that an SNMP message or asynchronous event is available.
 * @remarks
 * When the implementation is executing the retransmission policy for the WinSNMP application and a transmission time-out occurs, the implementation informs the session of the error. In this situation the value of the <i>wParam</i> parameter would be SNMPAPI_TL_TIMEOUT. For a list of other transport layer errors, see the reference pages for the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpregister">SnmpRegister</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpsendmsg">SnmpSendMsg</a>, and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmprecvmsg">SnmpRecvMsg</a> functions.
 * @see https://learn.microsoft.com/windows/win32/api//content/winsnmp/nc-winsnmp-snmpapi_callback
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class SNMPAPI_CALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer} hSession 
     * @param {HWND} hWnd_ 
     * @param {Integer} wMsg 
     * @param {WPARAM} wParam_ 
     * @param {LPARAM} lParam_ 
     * @param {Pointer<Void>} lpClientData 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hSession, hWnd_, wMsg, wParam_, lParam_, lpClientData) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        lpClientDataMarshal := lpClientData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", hSession, "ptr", hWnd_, "uint", wMsg, "ptr", wParam_, "ptr", lParam_, lpClientDataMarshal, lpClientData, "uint")
        return result
    }
}
