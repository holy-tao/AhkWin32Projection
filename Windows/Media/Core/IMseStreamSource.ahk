#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\MseSourceBufferList.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MseSourceBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMseStreamSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMseStreamSource
     * @type {Guid}
     */
    static IID => Guid("{b0b4198d-02f4-4923-88dd-81bc3f360ffa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_Opened", "remove_Opened", "add_Ended", "remove_Ended", "add_Closed", "remove_Closed", "get_SourceBuffers", "get_ActiveSourceBuffers", "get_ReadyState", "get_Duration", "put_Duration", "AddSourceBuffer", "RemoveSourceBuffer", "EndOfStream"]

    /**
     * @type {MseSourceBufferList} 
     */
    SourceBuffers {
        get => this.get_SourceBuffers()
    }

    /**
     * @type {MseSourceBufferList} 
     */
    ActiveSourceBuffers {
        get => this.get_ActiveSourceBuffers()
    }

    /**
     * @type {Integer} 
     */
    ReadyState {
        get => this.get_ReadyState()
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MseStreamSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Opened(handler) {
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
    remove_Opened(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MseStreamSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Ended(handler) {
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
    remove_Ended(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MseStreamSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
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
    remove_Closed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MseSourceBufferList} 
     */
    get_SourceBuffers() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MseSourceBufferList(value)
    }

    /**
     * 
     * @returns {MseSourceBufferList} 
     */
    get_ActiveSourceBuffers() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MseSourceBufferList(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadyState() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Duration() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} mimeType 
     * @returns {MseSourceBuffer} 
     */
    AddSourceBuffer(mimeType) {
        if(mimeType is String) {
            pin := HSTRING.Create(mimeType)
            mimeType := pin.Value
        }
        mimeType := mimeType is Win32Handle ? NumGet(mimeType, "ptr") : mimeType

        result := ComCall(17, this, "ptr", mimeType, "ptr*", &buffer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MseSourceBuffer(buffer_)
    }

    /**
     * 
     * @param {MseSourceBuffer} buffer_ 
     * @returns {HRESULT} 
     */
    RemoveSourceBuffer(buffer_) {
        result := ComCall(18, this, "ptr", buffer_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The EndOfStream event is reserved for future use.
     * @remarks
     * This event is reserved for future use.
     * @param {Integer} status_ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/axwmplib-axwindowsmediaplayer-endofstream
     */
    EndOfStream(status_) {
        result := ComCall(19, this, "int", status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
