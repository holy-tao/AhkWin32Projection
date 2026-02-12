#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * An application-defined timer completion routine. Specify this address when calling the SetWaitableTimer function.
 * @remarks
 * The completion routine is executed by the thread that activates the timer using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-setwaitabletimer">SetWaitableTimer</a>. However, the thread must be in an alertable state. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Sync/asynchronous-procedure-calls">Asynchronous Procedure Calls</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/synchapi/nc-synchapi-ptimerapcroutine
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PTIMERAPCROUTINE extends IUnknown {

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
     * @param {Pointer<Void>} lpArgToCompletionRoutine 
     * @param {Integer} dwTimerLowValue 
     * @param {Integer} dwTimerHighValue 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpArgToCompletionRoutine, dwTimerLowValue, dwTimerHighValue) {
        lpArgToCompletionRoutineMarshal := lpArgToCompletionRoutine is VarRef ? "ptr" : "ptr"

        ComCall(3, this, lpArgToCompletionRoutineMarshal, lpArgToCompletionRoutine, "uint", dwTimerLowValue, "uint", dwTimerHighValue)
    }
}
