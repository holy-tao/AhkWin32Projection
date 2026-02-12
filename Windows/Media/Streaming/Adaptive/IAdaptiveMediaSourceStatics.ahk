#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\AdaptiveMediaSourceCreationResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class IAdaptiveMediaSourceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveMediaSourceStatics
     * @type {Guid}
     */
    static IID => Guid("{50a6bd5d-66ef-4cd3-9579-9e660507dc3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsContentTypeSupported", "CreateFromUriAsync", "CreateFromUriWithDownloaderAsync", "CreateFromStreamAsync", "CreateFromStreamWithDownloaderAsync"]

    /**
     * 
     * @param {HSTRING} contentType 
     * @returns {Boolean} 
     */
    IsContentTypeSupported(contentType) {
        if(contentType is String) {
            pin := HSTRING.Create(contentType)
            contentType := pin.Value
        }
        contentType := contentType is Win32Handle ? NumGet(contentType, "ptr") : contentType

        result := ComCall(6, this, "ptr", contentType, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperation<AdaptiveMediaSourceCreationResult>} 
     */
    CreateFromUriAsync(uri_) {
        result := ComCall(7, this, "ptr", uri_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AdaptiveMediaSourceCreationResult, result_)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {HttpClient} httpClient_ 
     * @returns {IAsyncOperation<AdaptiveMediaSourceCreationResult>} 
     */
    CreateFromUriWithDownloaderAsync(uri_, httpClient_) {
        result := ComCall(8, this, "ptr", uri_, "ptr", httpClient_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AdaptiveMediaSourceCreationResult, result_)
    }

    /**
     * 
     * @param {IInputStream} stream 
     * @param {Uri} uri_ 
     * @param {HSTRING} contentType 
     * @returns {IAsyncOperation<AdaptiveMediaSourceCreationResult>} 
     */
    CreateFromStreamAsync(stream, uri_, contentType) {
        if(contentType is String) {
            pin := HSTRING.Create(contentType)
            contentType := pin.Value
        }
        contentType := contentType is Win32Handle ? NumGet(contentType, "ptr") : contentType

        result := ComCall(9, this, "ptr", stream, "ptr", uri_, "ptr", contentType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AdaptiveMediaSourceCreationResult, result_)
    }

    /**
     * 
     * @param {IInputStream} stream 
     * @param {Uri} uri_ 
     * @param {HSTRING} contentType 
     * @param {HttpClient} httpClient_ 
     * @returns {IAsyncOperation<AdaptiveMediaSourceCreationResult>} 
     */
    CreateFromStreamWithDownloaderAsync(stream, uri_, contentType, httpClient_) {
        if(contentType is String) {
            pin := HSTRING.Create(contentType)
            contentType := pin.Value
        }
        contentType := contentType is Win32Handle ? NumGet(contentType, "ptr") : contentType

        result := ComCall(10, this, "ptr", stream, "ptr", uri_, "ptr", contentType, "ptr", httpClient_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AdaptiveMediaSourceCreationResult, result_)
    }
}
