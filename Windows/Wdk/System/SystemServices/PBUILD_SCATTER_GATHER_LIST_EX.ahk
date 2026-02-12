#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PBUILD_SCATTER_GATHER_LIST_EX extends IUnknown {

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
     * @param {Pointer<DMA_ADAPTER>} DmaAdapter 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<Void>} DmaTransferContext 
     * @param {Pointer<MDL>} Mdl_ 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @param {Integer} Flags 
     * @param {Pointer<DRIVER_LIST_CONTROL>} ExecutionRoutine 
     * @param {Pointer<Void>} Context_ 
     * @param {BOOLEAN} WriteToDevice 
     * @param {Pointer<Void>} ScatterGatherBuffer 
     * @param {Integer} ScatterGatherLength 
     * @param {Pointer<PDMA_COMPLETION_ROUTINE>} DmaCompletionRoutine 
     * @param {Pointer<Void>} CompletionContext 
     * @param {Pointer<Void>} ScatterGatherList 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(DmaAdapter, DeviceObject, DmaTransferContext, Mdl_, Offset, Length, Flags, ExecutionRoutine, Context_, WriteToDevice, ScatterGatherBuffer, ScatterGatherLength, DmaCompletionRoutine, CompletionContext, ScatterGatherList) {
        DmaTransferContextMarshal := DmaTransferContext is VarRef ? "ptr" : "ptr"
        Context_Marshal := Context_ is VarRef ? "ptr" : "ptr"
        ScatterGatherBufferMarshal := ScatterGatherBuffer is VarRef ? "ptr" : "ptr"
        CompletionContextMarshal := CompletionContext is VarRef ? "ptr" : "ptr"
        ScatterGatherListMarshal := ScatterGatherList is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", DmaAdapter, "ptr", DeviceObject, DmaTransferContextMarshal, DmaTransferContext, "ptr", Mdl_, "uint", Offset, "uint", Length, "uint", Flags, "ptr", ExecutionRoutine, Context_Marshal, Context_, "char", WriteToDevice, ScatterGatherBufferMarshal, ScatterGatherBuffer, "uint", ScatterGatherLength, "ptr", DmaCompletionRoutine, CompletionContextMarshal, CompletionContext, ScatterGatherListMarshal, ScatterGatherList, "int")
        return result
    }
}
