#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Providers can implement this function to receive notification when consumers perform certain actions, such as adding or removing counters from a query.
 * @remarks
 * If the <b>callback</b> attribute of the <a href="https://docs.microsoft.com/previous-versions/aa373164(v=vs.85)">provider</a> element is "custom" or you used the <b>-NotificationCallback</b> argument when calling <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a>, you must implement this function. You pass the name of your callback function to <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/counterinitialize">CounterInitialize</a>.
 * 
 * <b>Windows Vista:  </b>The <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/counterinitialize">CounterInitialize</a> function is named <b>PerfAutoInitialize</b>. The <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool also generates a skeleton of this callback for you that includes all the request codes. You then add code to the request codes that you want to support and remove the others.
 * 
 * The callback must complete within one second. If the callback does not complete in time, PERFLIB continues with the consumer's request and ignores the callback's return value when it completes.
 * @see https://learn.microsoft.com/windows/win32/api//content/perflib/nc-perflib-perflibrequest
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERFLIBREQUEST extends IUnknown {

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
     * @param {Integer} RequestCode 
     * @param {Pointer<Void>} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(RequestCode, Buffer_, BufferSize) {
        Buffer_Marshal := Buffer_ is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", RequestCode, Buffer_Marshal, Buffer_, "uint", BufferSize, "uint")
        return result
    }
}
