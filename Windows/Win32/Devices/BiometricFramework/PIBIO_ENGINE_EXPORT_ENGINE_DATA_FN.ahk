#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves a copy of the most recently processed feature set or template from the engine in a standard biometric information record.
 * @remarks
 * You must allocate the buffer to be returned in the <i>SampleBuffer</i> parameter from the process heap by using the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function. After the buffer is created, it becomes the property of the Windows Biometric Framework. Because the Framework deallocates this memory when finished using it, your implementation of this function  must not attempt to deallocate the buffer or save a pointer to it.  By not saving the pointer, you prevent other parts of the engine adapter from attempting to use the buffer after this function returns.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_export_engine_data_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN extends IUnknown {

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
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline 
     * @param {Integer} Flags 
     * @param {Pointer<Pointer<WINBIO_BIR>>} SampleBuffer 
     * @param {Pointer<Pointer>} SampleSize 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, Flags, SampleBuffer, SampleSize) {
        SampleBufferMarshal := SampleBuffer is VarRef ? "ptr*" : "ptr"
        SampleSizeMarshal := SampleSize is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", Pipeline, "char", Flags, SampleBufferMarshal, SampleBuffer, SampleSizeMarshal, SampleSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
