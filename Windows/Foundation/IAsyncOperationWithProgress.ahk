#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\IAsyncInfo.ahk
#Include .\AsyncStatus.ahk
#Include .\AsyncOperationProgressHandler.ahk
#Include .\AsyncOperationWithProgressCompletedHandler.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents an asynchronous operation that can report progress updates to callers. This is the return type for many Windows Runtime asynchronous methods that have results and also report progress.
 * @remarks
 * IAsyncOperationWithProgress&lt;TResult,TProgress&gt; is the return type for many Windows Runtime asynchronous methods that have a result upon completion, and also support notifications that report progress (which callers can subscribe to by assigning a callback for [Progress](iasyncoperationwithprogress_2_progress.md)). This constitutes about 100 different Windows Runtime APIs. APIs that don't report progress (but do have a result) use another interface, [IAsyncOperation<TResult>](iasyncoperation_1.md).
 * 
 * When you use methods that return IAsyncOperationWithProgress&lt;TResult,TProgress&gt; (with a **TResult** specific constraint) in your app code, you usually don't access the IAsyncOperationWithProgress return value directly. That's because you almost always use the language-specific awaitable syntax. In this case, the apparent return value of the method is the type provided as the **TResult** parameter. For more info, see [Asynchronous programming](/windows/uwp/threading-async/asynchronous-programming-universal-windows-platform-apps), or one of the language-specific guides to Windows Runtime asynchronous programming ([Call asynchronous APIs in C# or Visual Basic](/windows/uwp/threading-async/call-asynchronous-apis-in-csharp-or-visual-basic), [C++](/windows/uwp/threading-async/asynchronous-programming-in-cpp-universal-windows-platform-apps), [JavaScript](/previous-versions/windows/apps/hh700330(v=win.10))).
 * 
 * <!--There do not appear to be utilities eg ThreadPool that use IAsyncOperation-->
 * It's not common to use IAsyncOperationWithProgress&lt;TResult,TProgress&gt; directly even if you don't use a language-specific awaitable syntax. Each of the languages has extension points that are generally easier to use than the Windows Runtime interface. JavaScript has [WinJS.Promise](/previous-versions/windows/apps/br211867(v=win.10)), and the **then/done** syntax. .NET has the [AsTask](/dotnet/api/system.windowsruntimesystemextensions.astask?view=dotnet-uwp-10.0&preserve-view=true) extension method, and once the IAsyncOperationWithProgress&lt;TResult,TProgress&gt; is converted to a [Task&lt;TResult&gt;](/dotnet/api/system.threading.tasks.task?view=dotnet-uwp-10.0&preserve-view=true), it's easier to get the result, cancel, get notification on completion, and so on. For C++/CX, you can wrap the calls using the [Concurrency runtime](/cpp/parallel/concrt/reference/concurrency-namespace) (and use [create_task](/cpp/parallel/concrt/reference/concurrency-namespace-functions?view=vs-2017)). In other words, IAsyncOperationWithProgress&lt;TResult,TProgress&gt; can be considered runtime-level infrastructure, which each of the languages use as a framework to support awaitable syntax or asynchronous programming models in their own way.
 * 
 * Specifically, if you want to handle progress in .NET code, use the **AsTask** signature that in an extension usage has a single [IProgress](/dotnet/api/system.iprogress-1?view=dotnet-uwp-10.0&preserve-view=true) reference parameter. (In this usage, the progress unit is already constrained and matches the IAsyncOperationWithProgress method you're using.) Provide an object that implements [IProgress](/dotnet/api/system.iprogress-1?view=dotnet-uwp-10.0&preserve-view=true), and your [Report](/dotnet/api/system.iprogress-1.report?view=dotnet-uwp-10.0&preserve-view=true) method implementation is invoked each time the Windows Runtime method reports a progress notification.
 * 
 * To monitor the progress of the action (if not using the language-specific techniques described above), set the [Progress](iasyncoperationwithprogress_2_progress.md) property, providing it the name of a method that implements the [AsyncOperationProgressHandler<TResult,TProgress>](asyncoperationprogresshandler_2.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.iasyncoperationwithprogress-2
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IAsyncOperationWithProgress extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAsyncOperationWithProgress
     * @type {Guid}
     */
    static IID => Guid("{b5d036d7-e297-498f-ba60-0289e76e23dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Progress", "get_Progress", "put_Completed", "get_Completed", "GetResults"]

    /**
     * @type {AsyncOperationProgressHandler<Generic, Generic>} 
     */
    Progress {
        get => this.get_Progress()
        set => this.put_Progress(value)
    }

    /**
     * @type {AsyncOperationWithProgressCompletedHandler<Generic, Generic>} 
     */
    Completed {
        get => this.get_Completed()
        set => this.put_Completed(value)
    }

    __New(TResult, TProgress, ptr, callbackCreateFlags := "") {
        super.__New(ptr, callbackCreateFlags)

        ; Register generic parameter types
        this.TResult := TResult
        this.TProgress := TProgress
    }

    /**
     * 
     * @param {AsyncOperationProgressHandler<Generic, Generic>} handler 
     * @returns {HRESULT} 
     */
    put_Progress(handler) {
        result := ComCall(6, this, "ptr", handler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AsyncOperationProgressHandler<Generic, Generic>} 
     */
    get_Progress() {
        result := ComCall(7, this, "ptr*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AsyncOperationProgressHandler(this.TResult, this.TProgress, output_)
    }

    /**
     * 
     * @param {AsyncOperationWithProgressCompletedHandler<Generic, Generic>} handler 
     * @returns {HRESULT} 
     */
    put_Completed(handler) {
        result := ComCall(8, this, "ptr", handler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AsyncOperationWithProgressCompletedHandler<Generic, Generic>} 
     */
    get_Completed() {
        result := ComCall(9, this, "ptr*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AsyncOperationWithProgressCompletedHandler(this.TResult, this.TProgress, output_)
    }

    /**
     * Returns the results of the operation.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.iasyncoperationwithprogress-2.getresults
     */
    GetResults() {
        result := ComCall(10, this, "ptr*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return this.TResult.Call(output_)
    }

    /**
     * Synchronously waits until the IAsyncOperationWithProgress is complete. Best for actions that you expect to complete very
     * quickly or which *must* finish before some other action can continue.
     *
     * @param {Integer} timeout If greater than zero, the maximum number of seconds to wait
     * @param {Integer} interval The number of milliseconds to wait between checks (default: 10)
     * @returns {Generic} The result of the IAsyncOperationWithProgress
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
     * Polls the IAsyncOperationWithProgress at some interval using a Timer and invokes a callback funtion when it finishes. Best for
     * long-running operations or operations whose results you don't need immediate access to.
     *
     * @param {Func(Generic) => Any} callback The function to call when the operation finishes. The function
     *      is called with the IAsyncOperationWithProgress appended to its parameter list. Note that the operation may have failed; the
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
     * Throws an error if the status of the IAsyncOperationWithProgress is `Cancelled` or `Error`.
     */
    ThrowIfFailed() {
        info := this.As(IAsyncInfo)
        switch(info.Status) {
            case AsyncStatus.Canceled:
                throw Error("IAsyncOperationWithProgress was cancelled")
            case AsyncStatus.Error:
                err := OSError(info.ErrorCode)
                if(err.message == "")
                    err.message := "IAsyncOperationWithProgress failed"
                throw err
        }
    }
}
