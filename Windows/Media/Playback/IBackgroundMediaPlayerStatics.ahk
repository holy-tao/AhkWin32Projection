#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaPlayer.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IBackgroundMediaPlayerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundMediaPlayerStatics
     * @type {Guid}
     */
    static IID => Guid("{856ddbc1-55f7-471f-a0f2-68ac4c904592}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Current", "add_MessageReceivedFromBackground", "remove_MessageReceivedFromBackground", "add_MessageReceivedFromForeground", "remove_MessageReceivedFromForeground", "SendMessageToBackground", "SendMessageToForeground", "IsMediaPlaying", "Shutdown"]

    /**
     * @type {MediaPlayer} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * 
     * @returns {MediaPlayer} 
     */
    get_Current() {
        result := ComCall(6, this, "ptr*", &player := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlayer(player)
    }

    /**
     * 
     * @param {EventHandler<MediaPlayerDataReceivedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MessageReceivedFromBackground(value) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", value, "ptr", token, "int")
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
    remove_MessageReceivedFromBackground(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<MediaPlayerDataReceivedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MessageReceivedFromForeground(value) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", value, "ptr", token, "int")
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
    remove_MessageReceivedFromForeground(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ValueSet} value 
     * @returns {HRESULT} 
     */
    SendMessageToBackground(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ValueSet} value 
     * @returns {HRESULT} 
     */
    SendMessageToForeground(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsMediaPlaying() {
        result := ComCall(13, this, "int*", &isMediaPlaying := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isMediaPlaying
    }

    /**
     * Stops the collector. If the collector is running as a service, stopping the service is the better approach.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/BEvtColProv/control-shutdown
     */
    Shutdown() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
