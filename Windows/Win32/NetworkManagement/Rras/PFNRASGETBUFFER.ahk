#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The custom-scripting DLL calls RasGetBuffer to allocate memory for sending or receiving data over the port connected to the server.
 * @remarks
 * The maximum buffer size that can be obtained is 1500 bytes.
 * 
 * The custom-scripting DLL calls 
 * <i>RasGetBuffer</i> through a function pointer. The function pointer is passed to the custom-scripting DLL as a parameter when RAS calls the DLL's implementation of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-rascustomscriptexecutefn">RasCustomScriptExecute</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/ras/nc-ras-pfnrasgetbuffer
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PFNRASGETBUFFER extends IUnknown {

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
     * @param {Pointer<Pointer<Integer>>} ppBuffer 
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
    Invoke(ppBuffer, pdwSize) {
        ppBufferMarshal := ppBuffer is VarRef ? "ptr*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppBufferMarshal, ppBuffer, pdwSizeMarshal, pdwSize, "uint")
        return result
    }
}
