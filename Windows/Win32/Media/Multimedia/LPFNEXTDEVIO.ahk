#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class LPFNEXTDEVIO extends IUnknown {

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
     * @param {LPARAM} lParam_ 
     * @param {Integer} dwFlags 
     * @param {Integer} dwIoControlCode 
     * @param {Pointer<Void>} lpInBuffer 
     * @param {Integer} nInBufferSize 
     * @param {Pointer<Void>} lpOutBuffer 
     * @param {Integer} nOutBufferSize 
     * @param {Pointer<Integer>} lpBytesReturned 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lParam_, dwFlags, dwIoControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned, lpOverlapped) {
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        lpInBufferMarshal := lpInBuffer is VarRef ? "ptr" : "ptr"
        lpOutBufferMarshal := lpOutBuffer is VarRef ? "ptr" : "ptr"
        lpBytesReturnedMarshal := lpBytesReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", lParam_, "uint", dwFlags, "uint", dwIoControlCode, lpInBufferMarshal, lpInBuffer, "uint", nInBufferSize, lpOutBufferMarshal, lpOutBuffer, "uint", nOutBufferSize, lpBytesReturnedMarshal, lpBytesReturned, "ptr", lpOverlapped, "int")
        return result
    }
}
