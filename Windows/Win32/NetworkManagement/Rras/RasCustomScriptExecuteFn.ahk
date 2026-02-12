#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * RAS calls the RasCustomScriptExecute function when establishing a connection for a phone-book entry that has the RASEO_CustomScript option set.
 * @remarks
 * When RAS calls 
 * <b>RasCustomScriptExecute</b>, the <i>pRasDialParams</i> parameter will point to the Unicode 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377238(v=vs.85)">RASDIALPARAMS</a> structure. That is, the structure contains only Unicode strings.
 * 
 * In some cases, the <b>szUserName</b> of the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377238(v=vs.85)">RASDIALPARAMS</a> structure will be an empty string. In these cases, the custom-scripting DLL should use the Unicode version of the 
 * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/iamtimelineobj-getusername">GetUserName</a> function to obtain the name of the current user.
 * @see https://learn.microsoft.com/windows/win32/api//content/ras/nc-ras-rascustomscriptexecutefn
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RasCustomScriptExecuteFn extends IUnknown {

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
     * @param {HANDLE} hPort 
     * @param {PWSTR} lpszPhonebook 
     * @param {PWSTR} lpszEntryName 
     * @param {Pointer<PFNRASGETBUFFER>} pfnRasGetBuffer_ 
     * @param {Pointer<PFNRASFREEBUFFER>} pfnRasFreeBuffer_ 
     * @param {Pointer<PFNRASSENDBUFFER>} pfnRasSendBuffer_ 
     * @param {Pointer<PFNRASRECEIVEBUFFER>} pfnRasReceiveBuffer_ 
     * @param {Pointer<PFNRASRETRIEVEBUFFER>} pfnRasRetrieveBuffer_ 
     * @param {HWND} hWnd_ 
     * @param {Pointer<RASDIALPARAMSA>} pRasDialParams 
     * @param {Pointer<Void>} pvReserved 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hPort, lpszPhonebook, lpszEntryName, pfnRasGetBuffer_, pfnRasFreeBuffer_, pfnRasSendBuffer_, pfnRasReceiveBuffer_, pfnRasRetrieveBuffer_, hWnd_, pRasDialParams, pvReserved) {
        hPort := hPort is Win32Handle ? NumGet(hPort, "ptr") : hPort
        lpszPhonebook := lpszPhonebook is String ? StrPtr(lpszPhonebook) : lpszPhonebook
        lpszEntryName := lpszEntryName is String ? StrPtr(lpszEntryName) : lpszEntryName
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_

        pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", hPort, "ptr", lpszPhonebook, "ptr", lpszEntryName, "ptr", pfnRasGetBuffer_, "ptr", pfnRasFreeBuffer_, "ptr", pfnRasSendBuffer_, "ptr", pfnRasReceiveBuffer_, "ptr", pfnRasRetrieveBuffer_, "ptr", hWnd_, "ptr", pRasDialParams, pvReservedMarshal, pvReserved, "uint")
        return result
    }
}
