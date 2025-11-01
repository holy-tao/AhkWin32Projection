#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICorThreadpool extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorThreadpool
     * @type {Guid}
     */
    static IID => Guid("{84680d3a-b2c1-46e8-acc2-dbc0a359159a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CorRegisterWaitForSingleObject", "CorUnregisterWait", "CorQueueUserWorkItem", "CorCreateTimer", "CorChangeTimer", "CorDeleteTimer", "CorBindIoCompletionCallback", "CorCallOrQueueUserWorkItem", "CorSetMaxThreads", "CorGetMaxThreads", "CorGetAvailableThreads"]

    /**
     * 
     * @param {Pointer<HANDLE>} phNewWaitObject 
     * @param {HANDLE} hWaitObject 
     * @param {Pointer<WAITORTIMERCALLBACK>} Callback 
     * @param {Pointer<Void>} Context 
     * @param {Integer} timeout 
     * @param {BOOL} executeOnlyOnce 
     * @param {Pointer<BOOL>} result 
     * @returns {HRESULT} 
     */
    CorRegisterWaitForSingleObject(phNewWaitObject, hWaitObject, Callback, Context, timeout, executeOnlyOnce, result) {
        hWaitObject := hWaitObject is Win32Handle ? NumGet(hWaitObject, "ptr") : hWaitObject

        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", phNewWaitObject, "ptr", hWaitObject, "ptr", Callback, ContextMarshal, Context, "uint", timeout, "int", executeOnlyOnce, "ptr", result, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hWaitObject 
     * @param {HANDLE} CompletionEvent 
     * @param {Pointer<BOOL>} result 
     * @returns {HRESULT} 
     */
    CorUnregisterWait(hWaitObject, CompletionEvent, result) {
        hWaitObject := hWaitObject is Win32Handle ? NumGet(hWaitObject, "ptr") : hWaitObject
        CompletionEvent := CompletionEvent is Win32Handle ? NumGet(CompletionEvent, "ptr") : CompletionEvent

        result := ComCall(4, this, "ptr", hWaitObject, "ptr", CompletionEvent, "ptr", result, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<LPTHREAD_START_ROUTINE>} Function 
     * @param {Pointer<Void>} Context 
     * @param {BOOL} executeOnlyOnce 
     * @param {Pointer<BOOL>} result 
     * @returns {HRESULT} 
     */
    CorQueueUserWorkItem(Function, Context, executeOnlyOnce, result) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "ptr", Function, ContextMarshal, Context, "int", executeOnlyOnce, "ptr", result, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} phNewTimer 
     * @param {Pointer<WAITORTIMERCALLBACK>} Callback 
     * @param {Pointer<Void>} Parameter 
     * @param {Integer} DueTime 
     * @param {Integer} Period 
     * @param {Pointer<BOOL>} result 
     * @returns {HRESULT} 
     */
    CorCreateTimer(phNewTimer, Callback, Parameter, DueTime, Period, result) {
        ParameterMarshal := Parameter is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "ptr", phNewTimer, "ptr", Callback, ParameterMarshal, Parameter, "uint", DueTime, "uint", Period, "ptr", result, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} Timer 
     * @param {Integer} DueTime 
     * @param {Integer} Period 
     * @param {Pointer<BOOL>} result 
     * @returns {HRESULT} 
     */
    CorChangeTimer(Timer, DueTime, Period, result) {
        Timer := Timer is Win32Handle ? NumGet(Timer, "ptr") : Timer

        result := ComCall(7, this, "ptr", Timer, "uint", DueTime, "uint", Period, "ptr", result, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} Timer 
     * @param {HANDLE} CompletionEvent 
     * @param {Pointer<BOOL>} result 
     * @returns {HRESULT} 
     */
    CorDeleteTimer(Timer, CompletionEvent, result) {
        Timer := Timer is Win32Handle ? NumGet(Timer, "ptr") : Timer
        CompletionEvent := CompletionEvent is Win32Handle ? NumGet(CompletionEvent, "ptr") : CompletionEvent

        result := ComCall(8, this, "ptr", Timer, "ptr", CompletionEvent, "ptr", result, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} fileHandle 
     * @param {Pointer<LPOVERLAPPED_COMPLETION_ROUTINE>} callback 
     * @returns {HRESULT} 
     */
    CorBindIoCompletionCallback(fileHandle, callback) {
        fileHandle := fileHandle is Win32Handle ? NumGet(fileHandle, "ptr") : fileHandle

        result := ComCall(9, this, "ptr", fileHandle, "ptr", callback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<LPTHREAD_START_ROUTINE>} Function 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<BOOL>} result 
     * @returns {HRESULT} 
     */
    CorCallOrQueueUserWorkItem(Function, Context, result) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "ptr", Function, ContextMarshal, Context, "ptr", result, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} MaxWorkerThreads 
     * @param {Integer} MaxIOCompletionThreads 
     * @returns {HRESULT} 
     */
    CorSetMaxThreads(MaxWorkerThreads, MaxIOCompletionThreads) {
        result := ComCall(11, this, "uint", MaxWorkerThreads, "uint", MaxIOCompletionThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} MaxWorkerThreads 
     * @param {Pointer<Integer>} MaxIOCompletionThreads 
     * @returns {HRESULT} 
     */
    CorGetMaxThreads(MaxWorkerThreads, MaxIOCompletionThreads) {
        MaxWorkerThreadsMarshal := MaxWorkerThreads is VarRef ? "uint*" : "ptr"
        MaxIOCompletionThreadsMarshal := MaxIOCompletionThreads is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, MaxWorkerThreadsMarshal, MaxWorkerThreads, MaxIOCompletionThreadsMarshal, MaxIOCompletionThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} AvailableWorkerThreads 
     * @param {Pointer<Integer>} AvailableIOCompletionThreads 
     * @returns {HRESULT} 
     */
    CorGetAvailableThreads(AvailableWorkerThreads, AvailableIOCompletionThreads) {
        AvailableWorkerThreadsMarshal := AvailableWorkerThreads is VarRef ? "uint*" : "ptr"
        AvailableIOCompletionThreadsMarshal := AvailableIOCompletionThreads is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, AvailableWorkerThreadsMarshal, AvailableWorkerThreads, AvailableIOCompletionThreadsMarshal, AvailableIOCompletionThreads, "HRESULT")
        return result
    }
}
