#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaPlaybackCommandManager.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlaybackCommandManagerCommandBehavior extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlaybackCommandManagerCommandBehavior
     * @type {Guid}
     */
    static IID => Guid("{786c1e78-ce78-4a10-afd6-843fcbb90c2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CommandManager", "get_IsEnabled", "get_EnablingRule", "put_EnablingRule", "add_IsEnabledChanged", "remove_IsEnabledChanged"]

    /**
     * @type {MediaPlaybackCommandManager} 
     */
    CommandManager {
        get => this.get_CommandManager()
    }

    /**
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * @type {Integer} 
     */
    EnablingRule {
        get => this.get_EnablingRule()
        set => this.put_EnablingRule(value)
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManager} 
     */
    get_CommandManager() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackCommandManager(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EnablingRule() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_EnablingRule(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManagerCommandBehavior, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsEnabledChanged(handler) {
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
    remove_IsEnabledChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
