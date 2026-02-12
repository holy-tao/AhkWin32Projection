#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlayer5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlayer5
     * @type {Guid}
     */
    static IID => Guid("{cfe537fd-f86a-4446-bf4d-c8e792b7b4b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_VideoFrameAvailable", "remove_VideoFrameAvailable", "get_IsVideoFrameServerEnabled", "put_IsVideoFrameServerEnabled", "CopyFrameToVideoSurface", "CopyFrameToVideoSurfaceWithTargetRectangle", "CopyFrameToStereoscopicVideoSurfaces"]

    /**
     * @type {Boolean} 
     */
    IsVideoFrameServerEnabled {
        get => this.get_IsVideoFrameServerEnabled()
        set => this.put_IsVideoFrameServerEnabled(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_VideoFrameAvailable(value) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", value, "ptr", token, "int")
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
    remove_VideoFrameAvailable(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVideoFrameServerEnabled() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsVideoFrameServerEnabled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDirect3DSurface} destination 
     * @returns {HRESULT} 
     */
    CopyFrameToVideoSurface(destination) {
        result := ComCall(10, this, "ptr", destination, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDirect3DSurface} destination 
     * @param {RECT} targetRectangle 
     * @returns {HRESULT} 
     */
    CopyFrameToVideoSurfaceWithTargetRectangle(destination, targetRectangle) {
        result := ComCall(11, this, "ptr", destination, "ptr", targetRectangle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDirect3DSurface} destinationLeftEye 
     * @param {IDirect3DSurface} destinationRightEye 
     * @returns {HRESULT} 
     */
    CopyFrameToStereoscopicVideoSurfaces(destinationLeftEye, destinationRightEye) {
        result := ComCall(12, this, "ptr", destinationLeftEye, "ptr", destinationRightEye, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
