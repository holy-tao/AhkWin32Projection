#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CameraOcclusionState.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class ICameraOcclusionInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICameraOcclusionInfo
     * @type {Guid}
     */
    static IID => Guid("{af6c4ad0-a84d-5db6-be58-a5da21cfe011}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetState", "IsOcclusionKindSupported", "add_StateChanged", "remove_StateChanged"]

    /**
     * Gets current Interaction Context state and the time when the context will return to idle state.
     * @remarks
     * After interaction ends, the interaction context might still be busy reporting inertia, or expecting second tap in a double tap gesture (in general, if multi-stroke gesture is possible). This function allows the caller to find out when it is safe to treat the Interaction Context object as idle. The main purpose of this function is management of pools of interaction contexts.
     * @returns {CameraOcclusionState} 
     * @see https://learn.microsoft.com/windows/win32/api//content/interactioncontext/nf-interactioncontext-getstateinteractioncontext
     */
    GetState() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CameraOcclusionState(result_)
    }

    /**
     * 
     * @param {Integer} occlusionKind 
     * @returns {Boolean} 
     */
    IsOcclusionKindSupported(occlusionKind) {
        result := ComCall(7, this, "int", occlusionKind, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {TypedEventHandler<CameraOcclusionInfo, CameraOcclusionStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(handler) {
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
    remove_StateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
