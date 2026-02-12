#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\Protection\MediaProtectionManager.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Storage\FileProperties\MusicProperties.ahk
#Include ..\..\Storage\FileProperties\VideoProperties.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaStreamSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaStreamSource
     * @type {Guid}
     */
    static IID => Guid("{3712d543-45eb-4138-aa62-c01e26f3843f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_Closed", "remove_Closed", "add_Starting", "remove_Starting", "add_Paused", "remove_Paused", "add_SampleRequested", "remove_SampleRequested", "add_SwitchStreamsRequested", "remove_SwitchStreamsRequested", "NotifyError", "AddStreamDescriptor", "put_MediaProtectionManager", "get_MediaProtectionManager", "put_Duration", "get_Duration", "put_CanSeek", "get_CanSeek", "put_BufferTime", "get_BufferTime", "SetBufferedRange", "get_MusicProperties", "get_VideoProperties", "put_Thumbnail", "get_Thumbnail", "AddProtectionKey"]

    /**
     * @type {MediaProtectionManager} 
     */
    MediaProtectionManager {
        get => this.get_MediaProtectionManager()
        set => this.put_MediaProtectionManager(value)
    }

    /**
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * @type {Boolean} 
     */
    CanSeek {
        get => this.get_CanSeek()
        set => this.put_CanSeek(value)
    }

    /**
     * @type {TimeSpan} 
     */
    BufferTime {
        get => this.get_BufferTime()
        set => this.put_BufferTime(value)
    }

    /**
     * @type {MusicProperties} 
     */
    MusicProperties {
        get => this.get_MusicProperties()
    }

    /**
     * @type {VideoProperties} 
     */
    VideoProperties {
        get => this.get_VideoProperties()
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
        set => this.put_Thumbnail(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaStreamSource, MediaStreamSourceClosedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
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
    remove_Closed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaStreamSource, MediaStreamSourceStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Starting(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
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
    remove_Starting(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaStreamSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Paused(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
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
    remove_Paused(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaStreamSource, MediaStreamSourceSampleRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SampleRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
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
    remove_SampleRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaStreamSource, MediaStreamSourceSwitchStreamsRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SwitchStreamsRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
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
    remove_SwitchStreamsRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} errorStatus 
     * @returns {HRESULT} 
     */
    NotifyError(errorStatus) {
        result := ComCall(16, this, "int", errorStatus, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IMediaStreamDescriptor} descriptor 
     * @returns {HRESULT} 
     */
    AddStreamDescriptor(descriptor) {
        result := ComCall(17, this, "ptr", descriptor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {MediaProtectionManager} value 
     * @returns {HRESULT} 
     */
    put_MediaProtectionManager(value) {
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaProtectionManager} 
     */
    get_MediaProtectionManager() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaProtectionManager(value)
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        value := TimeSpan()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanSeek(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSeek() {
        result := ComCall(23, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_BufferTime(value) {
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_BufferTime() {
        value := TimeSpan()
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} startOffset 
     * @param {TimeSpan} endOffset 
     * @returns {HRESULT} 
     */
    SetBufferedRange(startOffset, endOffset) {
        result := ComCall(26, this, "ptr", startOffset, "ptr", endOffset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MusicProperties} 
     */
    get_MusicProperties() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MusicProperties(value)
    }

    /**
     * 
     * @returns {VideoProperties} 
     */
    get_VideoProperties() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoProperties(value)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Thumbnail(value) {
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Thumbnail() {
        result := ComCall(30, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @param {IMediaStreamDescriptor} streamDescriptor 
     * @param {Integer} keyIdentifier_length 
     * @param {Pointer<Integer>} keyIdentifier 
     * @param {Integer} licenseData_length 
     * @param {Pointer<Integer>} licenseData 
     * @returns {HRESULT} 
     */
    AddProtectionKey(streamDescriptor, keyIdentifier_length, keyIdentifier, licenseData_length, licenseData) {
        keyIdentifierMarshal := keyIdentifier is VarRef ? "char*" : "ptr"
        licenseDataMarshal := licenseData is VarRef ? "char*" : "ptr"

        result := ComCall(31, this, "ptr", streamDescriptor, "uint", keyIdentifier_length, keyIdentifierMarshal, keyIdentifier, "uint", licenseData_length, licenseDataMarshal, licenseData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
