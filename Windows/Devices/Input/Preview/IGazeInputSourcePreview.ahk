#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Input.Preview
 * @version WindowsRuntime 1.4
 */
class IGazeInputSourcePreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGazeInputSourcePreview
     * @type {Guid}
     */
    static IID => Guid("{e79e7ee8-b389-11e7-b201-c8d3ffb75721}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_GazeMoved", "remove_GazeMoved", "add_GazeEntered", "remove_GazeEntered", "add_GazeExited", "remove_GazeExited"]

    /**
     * 
     * @param {TypedEventHandler<GazeInputSourcePreview, GazeMovedPreviewEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GazeMoved(handler) {
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
    remove_GazeMoved(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GazeInputSourcePreview, GazeEnteredPreviewEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GazeEntered(handler) {
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
    remove_GazeEntered(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GazeInputSourcePreview, GazeExitedPreviewEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GazeExited(handler) {
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
    remove_GazeExited(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
