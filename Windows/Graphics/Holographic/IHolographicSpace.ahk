#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HolographicAdapterId.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\HolographicFrame.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables interoperability with a WinRT HolographicSpace object and provides access to HolographicSpace members for representing a holographic scene.
 * @see https://learn.microsoft.com/windows/win32/api//content/holographicspaceinterop/nn-holographicspaceinterop-iholographicspaceinterop
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicSpace extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicSpace
     * @type {Guid}
     */
    static IID => Guid("{4380dba6-5e78-434f-807c-3433d1efe8b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrimaryAdapterId", "SetDirect3D11Device", "add_CameraAdded", "remove_CameraAdded", "add_CameraRemoved", "remove_CameraRemoved", "CreateNextFrame"]

    /**
     * @type {HolographicAdapterId} 
     */
    PrimaryAdapterId {
        get => this.get_PrimaryAdapterId()
    }

    /**
     * 
     * @returns {HolographicAdapterId} 
     */
    get_PrimaryAdapterId() {
        value := HolographicAdapterId()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IDirect3DDevice} value 
     * @returns {HRESULT} 
     */
    SetDirect3D11Device(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<HolographicSpace, HolographicSpaceCameraAddedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CameraAdded(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_CameraAdded(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(9, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<HolographicSpace, HolographicSpaceCameraRemovedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CameraRemoved(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_CameraRemoved(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(11, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HolographicFrame} 
     */
    CreateNextFrame() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicFrame(value)
    }
}
