#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\HttpRequestResult.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\HttpGetBufferResult.ahk
#Include .\HttpGetInputStreamResult.ahk
#Include .\HttpGetStringResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpClient2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpClient2
     * @type {Guid}
     */
    static IID => Guid("{cdd83348-e8b7-4cec-b1b0-dc455fe72c92}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryDeleteAsync", "TryGetAsync", "TryGetAsync2", "TryGetBufferAsync", "TryGetInputStreamAsync", "TryGetStringAsync", "TryPostAsync", "TryPutAsync", "TrySendRequestAsync", "TrySendRequestAsync2"]

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperationWithProgress<HttpRequestResult, HttpProgress>} 
     */
    TryDeleteAsync(uri_) {
        result := ComCall(6, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpRequestResult, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperationWithProgress<HttpRequestResult, HttpProgress>} 
     */
    TryGetAsync(uri_) {
        result := ComCall(7, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpRequestResult, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {Integer} completionOption 
     * @returns {IAsyncOperationWithProgress<HttpRequestResult, HttpProgress>} 
     */
    TryGetAsync2(uri_, completionOption) {
        result := ComCall(8, this, "ptr", uri_, "int", completionOption, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpRequestResult, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperationWithProgress<HttpGetBufferResult, HttpProgress>} 
     */
    TryGetBufferAsync(uri_) {
        result := ComCall(9, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpGetBufferResult, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperationWithProgress<HttpGetInputStreamResult, HttpProgress>} 
     */
    TryGetInputStreamAsync(uri_) {
        result := ComCall(10, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpGetInputStreamResult, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperationWithProgress<HttpGetStringResult, HttpProgress>} 
     */
    TryGetStringAsync(uri_) {
        result := ComCall(11, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpGetStringResult, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {IHttpContent} content 
     * @returns {IAsyncOperationWithProgress<HttpRequestResult, HttpProgress>} 
     */
    TryPostAsync(uri_, content) {
        result := ComCall(12, this, "ptr", uri_, "ptr", content, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpRequestResult, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {IHttpContent} content 
     * @returns {IAsyncOperationWithProgress<HttpRequestResult, HttpProgress>} 
     */
    TryPutAsync(uri_, content) {
        result := ComCall(13, this, "ptr", uri_, "ptr", content, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpRequestResult, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }

    /**
     * 
     * @param {HttpRequestMessage} request 
     * @returns {IAsyncOperationWithProgress<HttpRequestResult, HttpProgress>} 
     */
    TrySendRequestAsync(request) {
        result := ComCall(14, this, "ptr", request, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpRequestResult, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }

    /**
     * 
     * @param {HttpRequestMessage} request 
     * @param {Integer} completionOption 
     * @returns {IAsyncOperationWithProgress<HttpRequestResult, HttpProgress>} 
     */
    TrySendRequestAsync2(request, completionOption) {
        result := ComCall(15, this, "ptr", request, "int", completionOption, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpRequestResult, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }
}
