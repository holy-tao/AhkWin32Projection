#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\IAsyncInfo.ahk
#Include .\AsyncStatus.ahk
#Include .\AsyncActionCompletedHandler.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents an asynchronous action. This is the return type for many Windows Runtime (WinRT) asynchronous methods that don't have a result object, and don't report ongoing progress.
 * @remarks
 * `IAsyncAction` is the return type for all WinRT asynchronous methods that don't communicate a result object, or ongoing progress. This constitutes over 300 different WinRT APIs. APIs that report progress but don't have a result use another interface, [IAsyncActionWithProgress&lt;TProgress&gt;](iasyncactionwithprogress_1.md).
 * 
 * When you use methods that return `IAsyncAction` in your app code, you usually don't access the `IAsyncAction` return value directly. That's because you almost always use the language-specific awaitable syntax. In this case, the apparent return value of the method is **void**. For more info, see [Asynchronous programming](/windows/uwp/threading-async/asynchronous-programming-universal-windows-platform-apps), or one of the language-specific guides to WinRT asynchronous programming ([Call asynchronous APIs in C# or Visual Basic](/windows/uwp/threading-async/call-asynchronous-apis-in-csharp-or-visual-basic), [C++](/windows/uwp/threading-async/asynchronous-programming-in-cpp-universal-windows-platform-apps), [JavaScript](/previous-versions/windows/apps/hh700330(v=win.10))).
 * 
 * `IAsyncAction` is also an input type for some advanced-scenario utility APIs such as [CoreDispatcher.RunAsync](../windows.ui.core/coredispatcher_runasync_447339746.md) and [ThreadPool.RunAsync](../windows.system.threading/threadpool_runasync_514988780.md).
 * 
 * It's not common to use `IAsyncAction` directly even if you don't use a language-specific awaitable syntax. Each of the languages has extension points that are generally easier to use than the WinRT interface. JavaScript has [WinJS.Promise](/previous-versions/windows/apps/br211867(v=win.10)), and the `then`/`done` syntax. .NET has the [AsTask](/dotnet/api/system.windowsruntimesystemextensions.astask?view=dotnet-uwp-10.0&preserve-view=true) extension method, and once the `IAsyncAction` is converted to a [Task](/dotnet/api/system.threading.tasks.task?view=dotnet-uwp-10.0&preserve-view=true), it's easier to cancel, get notification on completion, and so on. For C++/CX, you can wrap the calls using the [Concurrency runtime](/cpp/parallel/concrt/reference/concurrency-namespace) (and use [create_task](/cpp/parallel/concrt/reference/concurrency-namespace-functions?view=vs-2017)). In other words, `IAsyncAction` can be considered runtime-level infrastructure, which each of the languages use as a framework to support awaitable syntax or asynchronous programming models in their own way.
 * 
 * Instead of using `IAsyncAction`, some WinRT asynchronous methods use custom action types (which might have "Operation" rather than "Action" in their name). For example, [SignOutUserOperation](../windows.security.authentication.onlineid/signoutuseroperation.md) is a WinRT type that implements `IAsyncAction`. The [SignOutUserOperation](../windows.security.authentication.onlineid/signoutuseroperation.md) type is then used as the custom action return type for the [SignOutUserAsync](../windows.security.authentication.onlineid/onlineidauthenticator_signoutuserasync_658229157.md) method.
 * 
 * If you have a method that returns a .NET `Task` and need an `IAsyncAction` to pass to a WinRT API, you can use the [AsAsyncAction](/dotnet/api/system.windowsruntimesystemextensions.asasyncaction?view=dotnet-uwp-10.0&preserve-view=true) extension method.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.iasyncaction
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IAsyncAction extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAsyncAction
     * @type {Guid}
     */
    static IID => Guid("{5a648006-843a-4da9-865b-9d26e5dfad7b}")

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
     * Gets or sets the delegate that is called when the action completes.
     * @remarks
     * You're not allowed to set the **Completed** property more than once.
     * 
     * Most applications don't use the **Completed** property directly,
     * but instead use a language-specific syntax for awaiting the completion
     * of an asynchronous action,
     * such as `co_await` (C++/WinRT), `await` (C#, Javascript), or `then` (Javascript, C++/CX).
     * 
     * If the **Completed** property is set after the action has already completed,
     * then the action behaves as if it had completed immediately after the handler was received.
     * Note that this can result in the handler being called before the **Completed** property setter
     * has returned; possibly even from the same thread.
     * 
     * <!--Needed- topic on roll-your-own async that covers stuff like that-->
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.iasyncaction.completed
     * @type {AsyncActionCompletedHandler} 
     */
    Completed {
        get => this.get_Completed()
        set => this.put_Completed(value)
    }

    /**
     * Sets the method that is called when the asynchronous action completes.
     * @param {AsyncActionCompletedHandler} handler Type: **[**AsyncActionCompletedHandler**](asyncactioncompletedhandler.md)\***
     * 
     * The method that handles the completion notification.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WinRT/iasyncaction-put-completed
     */
    put_Completed(handler) {
        result := ComCall(6, this, "ptr", handler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the method that is called when the asynchronous action completes.
     * @returns {AsyncActionCompletedHandler} Type: **[**AsyncActionCompletedHandler**](asyncactioncompletedhandler.md)\*\***
     * 
     * The method that handles the completion notification.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WinRT/iasyncaction-get-completed
     */
    get_Completed() {
        result := ComCall(7, this, "ptr*", &handler := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AsyncActionCompletedHandler(handler)
    }

    /**
     * Gets the outcome of an asynchronous action.
     * @remarks
     * Calling the **GetResults** method has no effect if the current implementation has a dynamic type of [**IAsyncAction**](/windows/win32/api/windows.foundation/nn-windows-foundation-iasyncaction).
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * Type: **HRESULT**
     * 
     * This method always returns **S\_OK**.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WinRT/iasyncaction-getresults
     */
    GetResults() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Synchronously waits until the IAsyncAction is complete. Best for actions that you expect to complete very
     * quickly or which *must* finish before some other action can continue.
     *
     * @param {Integer} timeout If greater than zero, the maximum number of seconds to wait
     * @param {Integer} interval The number of milliseconds to wait between checks (default: 10)
     * @returns {Generic} The result of the IAsyncAction
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
     * Polls the IAsyncAction at some interval using a Timer and invokes a callback funtion when it finishes. Best for
     * long-running operations or operations whose results you don't need immediate access to.
     *
     * @param {Func(Generic) => Any} callback The function to call when the operation finishes. The function
     *      is called with the IAsyncAction appended to its parameter list. Note that the operation may have failed; the
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
     * Throws an error if the status of the IAsyncAction is `Cancelled` or `Error`.
     */
    ThrowIfFailed() {
        info := this.As(IAsyncInfo)
        switch(info.Status) {
            case AsyncStatus.Canceled:
                throw Error("IAsyncAction was cancelled")
            case AsyncStatus.Error:
                err := OSError(info.ErrorCode)
                if(err.message == "")
                    err.message := "IAsyncAction failed"
                throw err
        }
    }
}
