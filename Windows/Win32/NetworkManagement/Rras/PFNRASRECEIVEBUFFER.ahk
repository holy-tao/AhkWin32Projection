#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The custom-scripting DLL calls the RasReceiveBuffer function to inform RAS that it is ready to receive data from the server over the specified port.
 * @remarks
 * <i>RasReceiveBuffer</i> is an asynchronous function. 
 * <i>RasReceiveBuffer</i> returns immediately even if the data is not yet available. The custom-scripting DLL must wait on the event object specified by the <i>hEvent</i> parameter. When the data is available, RAS signals this event. The custom-scripting DLL should then call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-pfnrasretrievebuffer">RasRetrieveBuffer</a> function to obtain the data. The custom-scripting DLL may pass the same buffer pointer in 
 * <b>RasRetrieveBuffer</b> that it passed in <b>RasReceiveBuffer</b>.
 * 
 * RAS also signals the event object if, for some reason, the port is disconnected before the data is posted. In this case, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-pfnrasretrievebuffer">RasRetrieveBuffer</a> returns an error defined in Raserror.h, that indicates the cause of the failure.
 * 
 * The custom-scripting DLL calls 
 * <i>RasReceiveBuffer</i> through a function pointer. The function pointer is passed to the custom-scripting DLL as a parameter when RAS calls the DLL's implementation of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-rascustomscriptexecutefn">RasCustomScriptExecute</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/ras/nc-ras-pfnrasreceivebuffer
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PFNRASRECEIVEBUFFER extends IUnknown {

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
     * @param {Pointer<Integer>} pBuffer 
     * @param {Pointer<Integer>} pdwSize 
     * @param {Integer} dwTimeOut 
     * @param {HANDLE} hEvent 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hPort, pBuffer, pdwSize, dwTimeOut, hEvent) {
        hPort := hPort is Win32Handle ? NumGet(hPort, "ptr") : hPort
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hPort, pBufferMarshal, pBuffer, pdwSizeMarshal, pdwSize, "uint", dwTimeOut, "ptr", hEvent, "uint")
        return result
    }
}
