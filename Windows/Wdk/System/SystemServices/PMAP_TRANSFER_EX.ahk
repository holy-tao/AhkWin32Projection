#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PMAP_TRANSFER_EX extends IUnknown {

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
     * @param {Pointer<MDL>} Mdl_ 
     * @param {Pointer<Void>} MapRegisterBase 
     * @param {Integer} Offset 
     * @param {Integer} DeviceOffset 
     * @param {Pointer<Integer>} Length 
     * @param {BOOLEAN} WriteToDevice 
     * @param {Pointer} ScatterGatherBuffer 
     * @param {Integer} ScatterGatherBufferLength 
     * @param {Pointer<PDMA_COMPLETION_ROUTINE>} DmaCompletionRoutine 
     * @param {Pointer<Void>} CompletionContext 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(DmaAdapter, Mdl_, MapRegisterBase, Offset, DeviceOffset, Length, WriteToDevice, ScatterGatherBuffer, ScatterGatherBufferLength, DmaCompletionRoutine, CompletionContext) {
        MapRegisterBaseMarshal := MapRegisterBase is VarRef ? "ptr" : "ptr"
        LengthMarshal := Length is VarRef ? "uint*" : "ptr"
        CompletionContextMarshal := CompletionContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", DmaAdapter, "ptr", Mdl_, MapRegisterBaseMarshal, MapRegisterBase, "uint", Offset, "uint", DeviceOffset, LengthMarshal, Length, "char", WriteToDevice, "ptr", ScatterGatherBuffer, "uint", ScatterGatherBufferLength, "ptr", DmaCompletionRoutine, CompletionContextMarshal, CompletionContext, "int")
        return result
    }
}
