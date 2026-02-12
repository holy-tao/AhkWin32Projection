#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\IAsyncInfo.ahk
#Include .\AsyncStatus.ahk
#Include .\AsyncActionProgressHandler.ahk
#Include .\AsyncActionWithProgressCompletedHandler.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents an asynchronous action that can report progress updates to callers. This is the return type for all Windows Runtime asynchronous methods that don't have a result object, but do report progress to callback listeners.
 * @remarks
 * IAsyncActionWithProgress&lt;TProgress&gt; is the return type for all Windows Runtime asynchronous methods that don't communicate a result object, but do enable an app to check the progress of the action. There aren't nearly as many of these as there are methods that use [IAsyncAction](iasyncaction.md). [IAsyncAction](iasyncaction.md) APIs don't report progress and don't have a result.
 * 
 * When you use methods that return IAsyncActionWithProgress&lt;TProgress&gt; in your app code, you usually don't access the [IAsyncAction](iasyncaction.md) return value directly. That's because you almost always use the language-specific awaitable syntax. In this case, the apparent return value of the method is **void**. For more info, see [Asynchronous programming](/windows/uwp/threading-async/asynchronous-programming-universal-windows-platform-apps), or one of the language-specific guides to Windows Runtime asynchronous programming ([Call asynchronous APIs in C# or Visual Basic](/windows/uwp/threading-async/call-asynchronous-apis-in-csharp-or-visual-basic), [C++](/windows/uwp/threading-async/asynchronous-programming-in-cpp-universal-windows-platform-apps), [JavaScript](/previous-versions/windows/apps/hh700330(v=win.10))).
 * 
 * It's not common to use IAsyncActionWithProgress&lt;TProgress&gt; directly even if you don't use a language-specific awaitable syntax. Each of the languages has extension points that are generally easier to use than the Windows Runtime interface. JavaScript has [WinJS.Promise](/previous-versions/windows/apps/br211867(v=win.10)), and the **then/done** with **onProgress** syntax. .NET has the [AsTask](/dotnet/api/system.windowsruntimesystemextensions.astask?view=dotnet-uwp-10.0&preserve-view=true) extension methods, and once the IAsyncActionWithProgress&lt;TProgress&gt; is converted to a [Task](/dotnet/api/system.threading.tasks.task?view=dotnet-uwp-10.0&preserve-view=true), it's easier to cancel, get notification on completion, use [IProgress&lt;T&gt;](/dotnet/api/system.iprogress-1?view=dotnet-uwp-10.0&preserve-view=true), and so on. For C++/CX, you can wrap the calls using the [Concurrency runtime](/cpp/parallel/concrt/reference/concurrency-namespace) (and use [create_task](/cpp/parallel/concrt/reference/concurrency-namespace-functions?view=vs-2017)). In other words, IAsyncActionWithProgress&lt;TProgress&gt; can be considered runtime-level infrastructure, which each of the languages use as a framework to support awaitable syntax or asynchronous programming models in their own way.
 * 
 * Specifically, if you want to handle progress in .NET code, use the **AsTask** signature that in an extension usage has a single [IProgress](/dotnet/api/system.iprogress-1?view=dotnet-uwp-10.0&preserve-view=true) reference parameter. (In this usage, the progress unit is already constrained and matches the IAsyncActionWithProgress method you're using.) Provide an object that implements [IProgress](/dotnet/api/system.iprogress-1?view=dotnet-uwp-10.0&preserve-view=true), and your [Report](/dotnet/api/system.iprogress-1.report?view=dotnet-uwp-10.0&preserve-view=true) method implementation is invoked each time the Windows Runtime method reports a progress notification.
 * 
 * To monitor the progress of the action (if not using the language-specific techniques described above), set the [Progress](iasyncactionwithprogress_1_progress.md) property, providing it the name of a method that implements the [AsyncActionProgressHandler<TProgress>](asyncactionprogresshandler_1.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.iasyncactionwithprogress-1
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IAsyncActionWithProgress extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAsyncActionWithProgress
     * @type {Guid}
     */
    static IID => Guid("{1f6db258-e803-48a1-9546-eb7353398884}")

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
     * @type {AsyncActionProgressHandler<Generic>} 
     */
    Progress {
        get => this.get_Progress()
        set => this.put_Progress(value)
    }

    /**
     * @type {AsyncActionWithProgressCompletedHandler<Generic>} 
     */
    Completed {
        get => this.get_Completed()
        set => this.put_Completed(value)
    }

    __New(TProgress, ptr, callbackCreateFlags := "") {
        super.__New(ptr, callbackCreateFlags)

        ; Register generic parameter types
        this.TProgress := TProgress
    }

    /**
     * 
     * @param {AsyncActionProgressHandler<Generic>} handler 
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
     * @returns {AsyncActionProgressHandler<Generic>} 
     */
    get_Progress() {
        result := ComCall(7, this, "ptr*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AsyncActionProgressHandler(this.TProgress, output_)
    }

    /**
     * 
     * @param {AsyncActionWithProgressCompletedHandler<Generic>} handler 
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
     * @returns {AsyncActionWithProgressCompletedHandler<Generic>} 
     */
    get_Completed() {
        result := ComCall(9, this, "ptr*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AsyncActionWithProgressCompletedHandler(this.TProgress, output_)
    }

    /**
     * Returns the results of the action.
     * @remarks
     * The interface definition of this method has a **void** return, and **void** is what methods that use the default [IAsyncActionWithProgress<TProgress>](iasyncactionwithprogress_1.md) behavior will return after completing, when a language-specific awaitable syntax is used.
     * 
     * If you want the method to return a result you probably should be using [IAsyncOperationWithProgress<TResult,TProgress>](iasyncoperationwithprogress_2.md) instead. For [IAsyncActionWithProgress<TProgress>](iasyncactionwithprogress_1.md), any added logic should be in the [Completed](iasyncactionwithprogress_1_completed.md) implementation, not GetResults.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.iasyncactionwithprogress-1.getresults
     */
    GetResults() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Synchronously waits until the IAsyncActionWithProgress is complete. Best for actions that you expect to complete very
     * quickly or which *must* finish before some other action can continue.
     *
     * @param {Integer} timeout If greater than zero, the maximum number of seconds to wait
     * @param {Integer} interval The number of milliseconds to wait between checks (default: 10)
     * @returns {Generic} The result of the IAsyncActionWithProgress
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
     * Polls the IAsyncActionWithProgress at some interval using a Timer and invokes a callback funtion when it finishes. Best for
     * long-running operations or operations whose results you don't need immediate access to.
     *
     * @param {Func(Generic) => Any} callback The function to call when the operation finishes. The function
     *      is called with the IAsyncActionWithProgress appended to its parameter list. Note that the operation may have failed; the
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
     * Throws an error if the status of the IAsyncActionWithProgress is `Cancelled` or `Error`.
     */
    ThrowIfFailed() {
        info := this.As(IAsyncInfo)
        switch(info.Status) {
            case AsyncStatus.Canceled:
                throw Error("IAsyncActionWithProgress was cancelled")
            case AsyncStatus.Error:
                err := OSError(info.ErrorCode)
                if(err.message == "")
                    err.message := "IAsyncActionWithProgress failed"
                throw err
        }
    }
}
