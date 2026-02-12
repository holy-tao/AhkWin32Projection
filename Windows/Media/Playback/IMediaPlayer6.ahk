#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlayer6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlayer6
     * @type {Guid}
     */
    static IID => Guid("{e0caa086-ae65-414c-b010-8bc55f00e692}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_SubtitleFrameChanged", "remove_SubtitleFrameChanged", "RenderSubtitlesToSurface", "RenderSubtitlesToSurfaceWithTargetRectangle"]

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SubtitleFrameChanged(handler) {
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
    remove_SubtitleFrameChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDirect3DSurface} destination 
     * @returns {Boolean} 
     */
    RenderSubtitlesToSurface(destination) {
        result := ComCall(8, this, "ptr", destination, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IDirect3DSurface} destination 
     * @param {RECT} targetRectangle 
     * @returns {Boolean} 
     */
    RenderSubtitlesToSurfaceWithTargetRectangle(destination, targetRectangle) {
        result := ComCall(9, this, "ptr", destination, "ptr", targetRectangle, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
