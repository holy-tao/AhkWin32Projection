#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.UI
 * @version WindowsRuntime 1.4
 */
class IGameChatOverlayMessageSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameChatOverlayMessageSource
     * @type {Guid}
     */
    static IID => Guid("{1e177397-59fb-4f4f-8e9a-80acf817743c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_MessageReceived", "remove_MessageReceived", "SetDelayBeforeClosingAfterMessageReceived"]

    /**
     * 
     * @param {TypedEventHandler<GameChatOverlayMessageSource, GameChatMessageReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MessageReceived(handler) {
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
    remove_MessageReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    SetDelayBeforeClosingAfterMessageReceived(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
