#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\IAsyncInfo.ahk
#Include .\AsyncStatus.ahk
#Include .\AsyncOperationCompletedHandler.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents an asynchronous operation, which returns a result upon completion. This is the return type for many Windows Runtime (WinRT) asynchronous methods that have results but don't report progress.
 * @remarks
 * `IAsyncOperation<TResult>` is the return type for many WinRT asynchronous methods that have a result upon completion, but don't report progress. This constitutes over 650 different WinRT APIs. APIs that report progress and have a result use another interface, [IAsyncOperationWithProgress<TResult,TProgress>](iasyncoperationwithprogress_2.md).
 * 
 * When you use methods that return `IAsyncOperation<TResult>` (with a `TResult` specific constraint) in your app code, you usually don't access the `IAsyncOperation` return value directly. That's because you almost always use the language-specific awaitable syntax. In this case, the apparent return value of the method is the type provided as the `TResult` parameter. For more info, see [Asynchronous programming](/windows/uwp/threading-async/asynchronous-programming-universal-windows-platform-apps), or one of the language-specific guides to WinRT asynchronous programming ([Call asynchronous APIs in C# or Visual Basic](/windows/uwp/threading-async/call-asynchronous-apis-in-csharp-or-visual-basic), [C++](/windows/uwp/threading-async/asynchronous-programming-in-cpp-universal-windows-platform-apps), [JavaScript](/previous-versions/windows/apps/hh700330(v=win.10))).
 * 
 * It's not common to use `IAsyncOperation<TResult>` directly even if you don't use a language-specific awaitable syntax. Each of the languages has extension points that are generally easier to use than the WinRT interface. JavaScript has [WinJS.Promise](/previous-versions/windows/apps/br211867(v=win.10)), and the `then`/`done` syntax. .NET has the [AsTask](/dotnet/api/system.windowsruntimesystemextensions.astask?view=dotnet-uwp-10.0&preserve-view=true) extension method, and once the `IAsyncOperation<TResult>` is converted to a [Task&lt;TResult&gt;](/dotnet/api/system.threading.tasks.task?view=dotnet-uwp-10.0&preserve-view=true), it's easier to get the result, cancel, get notification on completion, and so on. For C++/CX, you can wrap the calls using the [Concurrency runtime](/cpp/parallel/concrt/reference/concurrency-namespace) (and use [create_task](/cpp/parallel/concrt/reference/concurrency-namespace-functions?view=vs-2017)). In other words, `IAsyncOperation<TResult>` can be considered runtime-level infrastructure, which each of the languages use as a framework to support awaitable syntax or asynchronous programming models in their own way.
 * 
 * Instead of using `IAsyncOperation<TResult>`, some WinRT asynchronous methods use custom operation types. For example, [DataReaderLoadOperation](../windows.storage.streams/datareaderloadoperation.md) is a WinRT type that implements `IAsyncOperation` using `uint` as the result type. The [DataReaderLoadOperation](../windows.storage.streams/datareaderloadoperation.md) type is then used as the custom operation/result type for the [DataReader.LoadAsync](../windows.storage.streams/datareader_loadasync_972718946.md) method.
 * 
 * If you have a method that returns a .NET `Task<T>` and need an `IAsyncOperation<TResult>` to pass to a WinRT API, you can use the [AsAsyncOperation](/dotnet/api/system.windowsruntimesystemextensions.asasyncoperation?view=dotnet-uwp-10.0&preserve-view=true) extension method.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.iasyncoperation-1
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IAsyncOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAsyncOperation
     * @type {Guid}
     */
    static IID => Guid("{9fc2b0bb-e446-44e2-aa61-9cab8f636af2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Completed", "get_Completed", "GetResults"]

    /**
     * @type {AsyncOperationCompletedHandler<Generic>} 
     */
    Completed {
        get => this.get_Completed()
        set => this.put_Completed(value)
    }

    __New(TResult, ptr, callbackCreateFlags := "") {
        super.__New(ptr, callbackCreateFlags)

        ; Register generic parameter types
        this.TResult := TResult
    }

    /**
     * 
     * @param {AsyncOperationCompletedHandler<Generic>} handler 
     * @returns {HRESULT} 
     */
    put_Completed(handler) {
        result := ComCall(6, this, "ptr", handler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AsyncOperationCompletedHandler<Generic>} 
     */
    get_Completed() {
        result := ComCall(7, this, "ptr*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AsyncOperationCompletedHandler(this.TResult, output_)
    }

    /**
     * Returns the results of the operation.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.iasyncoperation-1.getresults
     */
    GetResults() {
        result := ComCall(8, this, "ptr*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return this.TResult.Call(output_)
    }

    /**
     * Synchronously waits until the IAsyncOperation is complete. Best for actions that you expect to complete very
     * quickly or which *must* finish before some other action can continue.
     *
     * @param {Integer} timeout If greater than zero, the maximum number of seconds to wait
     * @param {Integer} interval The number of milliseconds to wait between checks (default: 10)
     * @returns {Generic} The result of the IAsyncOperation
     */
    Await(timeout := 0, interval := 10) {
        info := this.As(IAsyncInfo)
    
        start := A_Now
        while(info.Status == AsyncStatus.Started) {
            if(timeout > 0 && DateDiff(start, A_Now, "seconds") > timeout) {
                throw TimeoutError(type(this) " timed out", -1, timeout)
            }
            sleep(10)
        }
    
        this.ThrowIfFailed()
        return this.GetResults()
    }
    
    /**
     * Polls the IAsyncOperation at some interval using a Timer and invokes a callback funtion when it finishes. Best for
     * long-running operations or operations whose results you don't need immediate access to.
     *
     * @param {Func(Generic) => Any} callback The function to call when the operation finishes. The function
     *      is called with the IAsyncOperation appended to its parameter list. Note that the operation may have failed; the
     *      callback should check its status before accessing any other information.
     * @param {Integer} Timeout If greater than zero, the number of seconds to wait (default: 0)
     * @param {Integer} Interval the number of milliseconds between polling attempts (default: 250)
     * @returns {Func} A reference to the timer function created, which can be used to cancel it.
     */
    AwaitWithCallback(callback, timeout := 0, interval := 250) {
        if(!HasMethod(callback, , 1))
            throw MethodError("Callback is not callable with 1 argument", -1, callback)
    
        callbackFunc := Poll.Bind(this, this.As(IAsyncInfo), A_Now, timeout, callback)
        SetTimer(callbackFunc, interval)
        return callbackFunc
    
        Poll(op, info, startTime, timeout, callback) {
            if(info.Status != AsyncStatus.Started){
                SetTimer(, 0)
                callback.Call(op)
            }
            else if(timeout > 0 && DateDiff(startTime, A_Now, "seconds") > timeout){
                SetTimer(, 0)
                throw TimeoutError(type(op) . " timed out", , timeout)
            }
        }
    }
    
    /**
     * Throws an error if the status of the IAsyncOperation is `Cancelled` or `Error`.
     */
    ThrowIfFailed() {
        info := this.As(IAsyncInfo)
        switch(info.Status) {
            case AsyncStatus.Canceled:
                throw Error("IAsyncOperation was cancelled")
            case AsyncStatus.Error:
                err := OSError(info.ErrorCode)
                if(err.message == "")
                    err.message := "IAsyncOperation failed"
                throw err
        }
    }
}
