#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaSource.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaSourceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaSourceStatics
     * @type {Guid}
     */
    static IID => Guid("{f77d6fa4-4652-410e-b1d8-e9a5e245a45c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromAdaptiveMediaSource", "CreateFromMediaStreamSource", "CreateFromMseStreamSource", "CreateFromIMediaSource", "CreateFromStorageFile", "CreateFromStream", "CreateFromStreamReference", "CreateFromUri"]

    /**
     * 
     * @param {AdaptiveMediaSource} mediaSource_ 
     * @returns {MediaSource} 
     */
    CreateFromAdaptiveMediaSource(mediaSource_) {
        result := ComCall(6, this, "ptr", mediaSource_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaSource(result_)
    }

    /**
     * 
     * @param {MediaStreamSource} mediaSource_ 
     * @returns {MediaSource} 
     */
    CreateFromMediaStreamSource(mediaSource_) {
        result := ComCall(7, this, "ptr", mediaSource_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaSource(result_)
    }

    /**
     * 
     * @param {MseStreamSource} mediaSource_ 
     * @returns {MediaSource} 
     */
    CreateFromMseStreamSource(mediaSource_) {
        result := ComCall(8, this, "ptr", mediaSource_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaSource(result_)
    }

    /**
     * 
     * @param {IMediaSource} mediaSource_ 
     * @returns {MediaSource} 
     */
    CreateFromIMediaSource(mediaSource_) {
        result := ComCall(9, this, "ptr", mediaSource_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaSource(result_)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {MediaSource} 
     */
    CreateFromStorageFile(file_) {
        result := ComCall(10, this, "ptr", file_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaSource(result_)
    }

    /**
     * 
     * @param {IRandomAccessStream} stream 
     * @param {HSTRING} contentType 
     * @returns {MediaSource} 
     */
    CreateFromStream(stream, contentType) {
        if(contentType is String) {
            pin := HSTRING.Create(contentType)
            contentType := pin.Value
        }
        contentType := contentType is Win32Handle ? NumGet(contentType, "ptr") : contentType

        result := ComCall(11, this, "ptr", stream, "ptr", contentType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaSource(result_)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} stream 
     * @param {HSTRING} contentType 
     * @returns {MediaSource} 
     */
    CreateFromStreamReference(stream, contentType) {
        if(contentType is String) {
            pin := HSTRING.Create(contentType)
            contentType := pin.Value
        }
        contentType := contentType is Win32Handle ? NumGet(contentType, "ptr") : contentType

        result := ComCall(12, this, "ptr", stream, "ptr", contentType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaSource(result_)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {MediaSource} 
     */
    CreateFromUri(uri_) {
        result := ComCall(13, this, "ptr", uri_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaSource(result_)
    }
}
