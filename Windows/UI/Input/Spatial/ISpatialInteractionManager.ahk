#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\SpatialInteractionSourceState.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables interoperability with a WinRT SpatialInteractionManager object and provides access to SpatialInteractionManager members for accessing user input from hands, motion controllers, and system voice commands.
 * @see https://learn.microsoft.com/windows/win32/api//content/spatialinteractionmanagerinterop/nn-spatialinteractionmanagerinterop-ispatialinteractionmanagerinterop
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialInteractionManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialInteractionManager
     * @type {Guid}
     */
    static IID => Guid("{32a64ea8-a15a-3995-b8bd-80513cb5adef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_SourceDetected", "remove_SourceDetected", "add_SourceLost", "remove_SourceLost", "add_SourceUpdated", "remove_SourceUpdated", "add_SourcePressed", "remove_SourcePressed", "add_SourceReleased", "remove_SourceReleased", "add_InteractionDetected", "remove_InteractionDetected", "GetDetectedSourcesAtTimestamp"]

    /**
     * 
     * @param {TypedEventHandler<SpatialInteractionManager, SpatialInteractionSourceEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceDetected(handler) {
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
    remove_SourceDetected(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialInteractionManager, SpatialInteractionSourceEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceLost(handler) {
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
    remove_SourceLost(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialInteractionManager, SpatialInteractionSourceEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceUpdated(handler) {
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
    remove_SourceUpdated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialInteractionManager, SpatialInteractionSourceEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourcePressed(handler) {
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
    remove_SourcePressed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialInteractionManager, SpatialInteractionSourceEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceReleased(handler) {
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
    remove_SourceReleased(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialInteractionManager, SpatialInteractionDetectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_InteractionDetected(handler) {
        token := EventRegistrationToken()
        result := ComCall(16, this, "ptr", handler, "ptr", token, "int")
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
    remove_InteractionDetected(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PerceptionTimestamp} timeStamp_ 
     * @returns {IVectorView<SpatialInteractionSourceState>} 
     */
    GetDetectedSourcesAtTimestamp(timeStamp_) {
        result := ComCall(18, this, "ptr", timeStamp_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(SpatialInteractionSourceState, value)
    }
}
