#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Supports asynchronous actions and operations. IAsyncInfo is a base interface for [IAsyncAction](iasyncaction.md), [IAsyncActionWithProgress<TProgress>](iasyncactionwithprogress_1.md), [IAsyncOperation<TResult>](iasyncoperation_1.md) and [IAsyncOperationWithProgress<TResult,TProgress>](iasyncoperationwithprogress_2.md), each of which support combinations of return type and progress for an asynchronous method.
 * @remarks
 * IAsyncInfo is an inherited interface for each of the 4 Windows Runtime interfaces that are used for asynchronous method support. These are:
 * + [IAsyncAction](iasyncaction.md)
 * + [IAsyncActionWithProgress<TProgress>](iasyncactionwithprogress_1.md)
 * + [IAsyncOperation<TResult>](iasyncoperation_1.md)
 * + [IAsyncOperationWithProgress<TResult,TProgress>](iasyncoperationwithprogress_2.md)
 * 
 * 
 * When you use asynchronous methods in your app code, you usually don't see any of these interfaces as the return value. That's because you almost always use the language-specific awaitable syntax, which handles the interfaces internally. For more info, see [Asynchronous programming](/windows/uwp/threading-async/asynchronous-programming-universal-windows-platform-apps), or one of the language-specific guides to Windows Runtime asynchronous programming ([Call asynchronous APIs in C# or Visual Basic](/windows/uwp/threading-async/call-asynchronous-apis-in-csharp-or-visual-basic), [C++](/windows/uwp/threading-async/asynchronous-programming-in-cpp-universal-windows-platform-apps), [JavaScript](/previous-versions/windows/apps/hh700330(v=win.10))).
 * 
 * For most app code, it's uncommon to use IAsyncInfo as an API even if you don't use an awaitable syntax. Each of the languages has extension points that are generally easier to use than is the Windows RuntimeIAsyncInfo interface. JavaScript has the **then/done** syntax. .NET has the [AsTask](/dotnet/api/system.windowsruntimesystemextensions.astask?view=dotnet-uwp-10.0&preserve-view=true) extension method, and once the [IAsyncAction](iasyncaction.md) is converted to a [Task](/dotnet/api/system.threading.tasks.task?view=dotnet-uwp-10.0&preserve-view=true), it's easier to cancel, get notification on completion, and so on. For C++/CX, you can wrap the calls using the [Concurrency runtime](/cpp/parallel/concrt/reference/concurrency-namespace). In other words, IAsyncInfo is runtime-level infrastructure, which each of the languages use as a framework to support awaitable syntax in their own way.
 * 
 * If you're implementing a custom action or custom operation (an advanced scenario) don't implement [IAsyncAction](iasyncaction.md) directly. Implement one of the 4 interfaces previously listed instead.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.iasyncinfo
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IAsyncInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAsyncInfo
     * @type {Guid}
     */
    static IID => Guid("{00000036-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_Status", "get_ErrorCode", "Cancel", "Close"]

    /**
     * Gets the handle of the asynchronous operation.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.iasyncinfo.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a value that indicates the status of the asynchronous operation.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.iasyncinfo.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets a string that describes an error condition of the asynchronous operation.
     * @remarks
     * Error codes are exposed as different types depending on the programming language you are using. Similarly, each language has different techniques for wrapping asynchronous method calls so that error conditions or cancellation can be handled. For more info see one of these topics:
     * + [Exception handling for  in C# or Visual Basic](/previous-versions/windows/apps/dn532194(v=win.10))
     * + [Exceptions (C++/CX)](/cpp/cppcx/exceptions-c-cx)
     * + [JavaScript Run-time Errors](/scripting/javascript/reference/javascript-run-time-errors)
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.iasyncinfo.errorcode
     * @type {HRESULT} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * Retrieves the identifier of the asynchronous operation.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/asyncinfo/nf-asyncinfo-iasyncinfo-get_id
     */
    get_Id() {
        result := ComCall(6, this, "uint*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return output_
    }

    /**
     * Gets a value that indicates the status of the asynchronous operation.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/asyncinfo/nf-asyncinfo-iasyncinfo-get_status
     */
    get_Status() {
        result := ComCall(7, this, "int*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return output_
    }

    /**
     * Retrieves the termination status of the asynchronous operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/asyncinfo/nf-asyncinfo-iasyncinfo-get_errorcode
     */
    get_ErrorCode() {
        result := ComCall(8, this, "int*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return output_
    }

    /**
     * Requests cancellation of the asynchronous operation already in progress.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/asyncinfo/nf-asyncinfo-iasyncinfo-cancel
     */
    Cancel() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Closes the asynchronous work object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/asyncinfo/nf-asyncinfo-iasyncinfo-close
     */
    Close() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
