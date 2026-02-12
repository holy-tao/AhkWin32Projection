#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The custom-scripting DLL calls the RasRetrieveBuffer function to obtain data received from the RAS server over the specified port.
 * @remarks
 * The 
 * <i>RasRetrieveBuffer</i> function is synchronous. When it returns, the buffer pointed to by the <i>pBuffer</i> parameter contains the data received over the specified port. The custom-scripting DLL should call 
 * <i>RasRetrieveBuffer</i> only after RAS has signaled the event object that the DLL passed in the call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-pfnrasreceivebuffer">RasReceiveBuffer</a>.
 * 
 * The custom-scripting DLL calls 
 * <i>RasRetrieveBuffer</i> through a function pointer. The function pointer is passed to the custom-scripting DLL as a parameter when RAS calls the DLL's implementation of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-rascustomscriptexecutefn">RasCustomScriptExecute</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/ras/nc-ras-pfnrasretrievebuffer
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PFNRASRETRIEVEBUFFER extends IUnknown {

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
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hPort, pBuffer, pdwSize) {
        hPort := hPort is Win32Handle ? NumGet(hPort, "ptr") : hPort

        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hPort, pBufferMarshal, pBuffer, pdwSizeMarshal, pdwSize, "uint")
        return result
    }
}
