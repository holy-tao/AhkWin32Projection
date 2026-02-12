#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Function definition for the BufferCallback that will be invoked by ProcessTrace.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/evntrace/nc-evntrace-petw_buffer_callback
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class PETW_BUFFER_CALLBACK extends IUnknown {

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
     * @param {Pointer} Buffer_ 
     * @param {Integer} BufferSize 
     * @param {Pointer<ETW_BUFFER_CALLBACK_INFORMATION>} ConsumerInfo 
     * @param {Pointer<Void>} CallbackContext 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Buffer_, BufferSize, ConsumerInfo, CallbackContext) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", Buffer_, "uint", BufferSize, "ptr", ConsumerInfo, CallbackContextMarshal, CallbackContext, "int")
        return result
    }
}
