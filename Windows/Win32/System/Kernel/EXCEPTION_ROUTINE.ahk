#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Kernel
 * @version v4.0.30319
 */
class EXCEPTION_ROUTINE extends IUnknown {

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
     * @param {Pointer<EXCEPTION_RECORD>} ExceptionRecord 
     * @param {Pointer<Void>} EstablisherFrame 
     * @param {Pointer<CONTEXT>} ContextRecord 
     * @param {Pointer<Void>} DispatcherContext 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ExceptionRecord, EstablisherFrame, ContextRecord, DispatcherContext) {
        EstablisherFrameMarshal := EstablisherFrame is VarRef ? "ptr" : "ptr"
        DispatcherContextMarshal := DispatcherContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", ExceptionRecord, EstablisherFrameMarshal, EstablisherFrame, "ptr", ContextRecord, DispatcherContextMarshal, DispatcherContext, "int")
        return result
    }
}
