#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\MiracastTransmitter.ahk
#Include .\MiracastReceiverInputDevices.ahk
#Include .\MiracastReceiverCursorImageChannel.ahk
#Include .\MiracastReceiverStreamControl.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class IMiracastReceiverConnection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMiracastReceiverConnection
     * @type {Guid}
     */
    static IID => Guid("{704b2f36-d2e5-551f-a854-f822b7917d28}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Disconnect", "DisconnectWithMessage", "Pause", "PauseAsync", "Resume", "ResumeAsync", "get_Transmitter", "get_InputDevices", "get_CursorImageChannel", "get_StreamControl"]

    /**
     * @type {MiracastTransmitter} 
     */
    Transmitter {
        get => this.get_Transmitter()
    }

    /**
     * @type {MiracastReceiverInputDevices} 
     */
    InputDevices {
        get => this.get_InputDevices()
    }

    /**
     * @type {MiracastReceiverCursorImageChannel} 
     */
    CursorImageChannel {
        get => this.get_CursorImageChannel()
    }

    /**
     * @type {MiracastReceiverStreamControl} 
     */
    StreamControl {
        get => this.get_StreamControl()
    }

    /**
     * The Disconnect event is reserved for future use.
     * @remarks
     * This event is reserved for future use.
     * @param {Integer} reason 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/axwmplib-axwindowsmediaplayer-disconnect
     */
    Disconnect(reason) {
        result := ComCall(6, this, "int", reason, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Disconnect event is reserved for future use.
     * @remarks
     * This event is reserved for future use.
     * @param {Integer} reason 
     * @param {HSTRING} message 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/axwmplib-axwindowsmediaplayer-disconnect
     */
    DisconnectWithMessage(reason, message) {
        if(message is String) {
            pin := HSTRING.Create(message)
            message := pin.Value
        }
        message := message is Win32Handle ? NumGet(message, "ptr") : message

        result := ComCall(7, this, "int", reason, "ptr", message, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/pause-method
     */
    Pause() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    PauseAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/resume-method
     */
    Resume() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ResumeAsync() {
        result := ComCall(11, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {MiracastTransmitter} 
     */
    get_Transmitter() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MiracastTransmitter(value)
    }

    /**
     * 
     * @returns {MiracastReceiverInputDevices} 
     */
    get_InputDevices() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MiracastReceiverInputDevices(value)
    }

    /**
     * 
     * @returns {MiracastReceiverCursorImageChannel} 
     */
    get_CursorImageChannel() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MiracastReceiverCursorImageChannel(value)
    }

    /**
     * 
     * @returns {MiracastReceiverStreamControl} 
     */
    get_StreamControl() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MiracastReceiverStreamControl(value)
    }
}
