#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppCapture extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppCapture
     * @type {Guid}
     */
    static IID => Guid("{9749d453-a29a-45ed-8f29-22d09942cff7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsCapturingAudio", "get_IsCapturingVideo", "add_CapturingChanged", "remove_CapturingChanged"]

    /**
     * @type {Boolean} 
     */
    IsCapturingAudio {
        get => this.get_IsCapturingAudio()
    }

    /**
     * @type {Boolean} 
     */
    IsCapturingVideo {
        get => this.get_IsCapturingVideo()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCapturingAudio() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCapturingVideo() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<AppCapture, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CapturingChanged(handler) {
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
    remove_CapturingChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
