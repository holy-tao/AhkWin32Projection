#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Providers implement this function to provide custom memory management for PERFLIB.A
 * @remarks
 * If you used the <b>-MemoryRoutines</b> when calling <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a>, you must implement this callback function. You pass the name of your callback function to <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/counterinitialize">CounterInitialize</a>.
 * 
 * <b>Windows Vista:  </b>The <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/counterinitialize">CounterInitialize</a> function is named <b>PerfAutoInitialize</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/perflib/nc-perflib-perf_mem_alloc
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_MEM_ALLOC extends IUnknown {

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
     * @param {Pointer} AllocSize 
     * @param {Pointer<Void>} pContext 
     * @returns {Pointer<Void>} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(AllocSize, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", AllocSize, pContextMarshal, pContext, "ptr")
        return result
    }
}
