#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\WebTokenResponse.ahk
#Include .\WebProviderError.ahk
#Include ..\..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class IWebTokenRequestResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebTokenRequestResult
     * @type {Guid}
     */
    static IID => Guid("{c12a8305-d1f8-4483-8d54-38fe292784ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ResponseData", "get_ResponseStatus", "get_ResponseError", "InvalidateCacheAsync"]

    /**
     * @type {IVectorView<WebTokenResponse>} 
     */
    ResponseData {
        get => this.get_ResponseData()
    }

    /**
     * @type {Integer} 
     */
    ResponseStatus {
        get => this.get_ResponseStatus()
    }

    /**
     * @type {WebProviderError} 
     */
    ResponseError {
        get => this.get_ResponseError()
    }

    /**
     * 
     * @returns {IVectorView<WebTokenResponse>} 
     */
    get_ResponseData() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(WebTokenResponse, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResponseStatus() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {WebProviderError} 
     */
    get_ResponseError() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebProviderError(value)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    InvalidateCacheAsync() {
        result := ComCall(9, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }
}
