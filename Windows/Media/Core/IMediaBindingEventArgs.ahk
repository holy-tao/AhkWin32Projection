#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\MediaBinder.ahk
#Include ..\..\Foundation\Deferral.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaBindingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaBindingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{b61cb25a-1b6d-4630-a86d-2f0837f712e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_Canceled", "remove_Canceled", "get_MediaBinder", "GetDeferral", "SetUri", "SetStream", "SetStreamReference"]

    /**
     * @type {MediaBinder} 
     */
    MediaBinder {
        get => this.get_MediaBinder()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaBindingEventArgs, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Canceled(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Canceled(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaBinder} 
     */
    get_MediaBinder() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaBinder(value)
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(9, this, "ptr*", &deferral_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(deferral_)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {HRESULT} 
     */
    SetUri(uri_) {
        result := ComCall(10, this, "ptr", uri_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IRandomAccessStream} stream 
     * @param {HSTRING} contentType 
     * @returns {HRESULT} 
     */
    SetStream(stream, contentType) {
        if(contentType is String) {
            pin := HSTRING.Create(contentType)
            contentType := pin.Value
        }
        contentType := contentType is Win32Handle ? NumGet(contentType, "ptr") : contentType

        result := ComCall(11, this, "ptr", stream, "ptr", contentType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} stream 
     * @param {HSTRING} contentType 
     * @returns {HRESULT} 
     */
    SetStreamReference(stream, contentType) {
        if(contentType is String) {
            pin := HSTRING.Create(contentType)
            contentType := pin.Value
        }
        contentType := contentType is Win32Handle ? NumGet(contentType, "ptr") : contentType

        result := ComCall(12, this, "ptr", stream, "ptr", contentType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
