#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioFrameInputNode extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioFrameInputNode
     * @type {Guid}
     */
    static IID => Guid("{01b266c7-fd96-4ff5-a3c5-d27a9bf44237}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_PlaybackSpeedFactor", "get_PlaybackSpeedFactor", "AddFrame", "DiscardQueuedFrames", "get_QueuedSampleCount", "add_AudioFrameCompleted", "remove_AudioFrameCompleted", "add_QuantumStarted", "remove_QuantumStarted"]

    /**
     * @type {Float} 
     */
    PlaybackSpeedFactor {
        get => this.get_PlaybackSpeedFactor()
        set => this.put_PlaybackSpeedFactor(value)
    }

    /**
     * @type {Integer} 
     */
    QueuedSampleCount {
        get => this.get_QueuedSampleCount()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PlaybackSpeedFactor(value) {
        result := ComCall(6, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PlaybackSpeedFactor() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {AudioFrame} frame_ 
     * @returns {HRESULT} 
     */
    AddFrame(frame_) {
        result := ComCall(8, this, "ptr", frame_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DiscardQueuedFrames() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_QueuedSampleCount() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<AudioFrameInputNode, AudioFrameCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AudioFrameCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
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
    remove_AudioFrameCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AudioFrameInputNode, FrameInputNodeQuantumStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_QuantumStarted(handler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", token, "int")
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
    remove_QuantumStarted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
