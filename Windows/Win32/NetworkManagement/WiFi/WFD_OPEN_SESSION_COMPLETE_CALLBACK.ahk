#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines the callback function that is called by the WFDStartOpenSession function when the WFDStartOpenSession operation completes.
 * @remarks
 * The <b>WFD_OPEN_SESSION_COMPLETE_CALLBACK</b> function is part of Wi-Fi Direct, a new feature in Windows 8 and Windows Server 2012. Wi-Fi Direct is based on the development of the Wi-Fi Peer-to-Peer Technical Specification v1.1 by the Wi-Fi Alliance (see <a href="https://www.wi-fi.org/featured-topics">Wi-Fi Alliance Published Specifications</a>). The goal of the Wi-Fi Peer-to-Peer Technical Specification is to provide a solution for Wi-Fi device-to-device connectivity without the need for either a Wireless Access Point (wireless AP) to setup the connection or the use of the existing Wi-Fi adhoc (IBSS) mechanism. 
 * 
 * 
 * 
 * The  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdstartopensession">WFDStartOpenSession</a> function starts an asynchronous operation to start an on-demand connection to  a specific Wi-Fi Direct device. The target Wi-Fi device must previously have been paired through the Windows Pairing experience. When the asynchronous operation to make the Wi-FI Direct connection completes, the callback function specified in the <i>pfnCallback</i> parameter is called.
 * @see https://learn.microsoft.com/windows/win32/api//content/wlanapi/nc-wlanapi-wfd_open_session_complete_callback
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WFD_OPEN_SESSION_COMPLETE_CALLBACK extends IUnknown {

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
     * @param {HANDLE} hSessionHandle 
     * @param {Pointer<Void>} pvContext 
     * @param {Guid} guidSessionInterface 
     * @param {Integer} dwError 
     * @param {Integer} dwReasonCode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hSessionHandle, pvContext, guidSessionInterface, dwError, dwReasonCode) {
        hSessionHandle := hSessionHandle is Win32Handle ? NumGet(hSessionHandle, "ptr") : hSessionHandle

        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", hSessionHandle, pvContextMarshal, pvContext, "ptr", guidSessionInterface, "uint", dwError, "uint", dwReasonCode)
    }
}
