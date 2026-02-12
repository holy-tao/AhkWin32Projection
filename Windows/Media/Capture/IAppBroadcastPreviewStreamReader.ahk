#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppBroadcastPreviewStreamVideoFrame.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastPreviewStreamReader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastPreviewStreamReader
     * @type {Guid}
     */
    static IID => Guid("{92228d50-db3f-40a8-8cd4-f4e371ddab37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VideoWidth", "get_VideoHeight", "get_VideoStride", "get_VideoBitmapPixelFormat", "get_VideoBitmapAlphaMode", "TryGetNextVideoFrame", "add_VideoFrameArrived", "remove_VideoFrameArrived"]

    /**
     * @type {Integer} 
     */
    VideoWidth {
        get => this.get_VideoWidth()
    }

    /**
     * @type {Integer} 
     */
    VideoHeight {
        get => this.get_VideoHeight()
    }

    /**
     * @type {Integer} 
     */
    VideoStride {
        get => this.get_VideoStride()
    }

    /**
     * @type {Integer} 
     */
    VideoBitmapPixelFormat {
        get => this.get_VideoBitmapPixelFormat()
    }

    /**
     * @type {Integer} 
     */
    VideoBitmapAlphaMode {
        get => this.get_VideoBitmapAlphaMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoWidth() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoHeight() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoStride() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoBitmapPixelFormat() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoBitmapAlphaMode() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AppBroadcastPreviewStreamVideoFrame} 
     */
    TryGetNextVideoFrame() {
        result := ComCall(11, this, "ptr*", &frame_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastPreviewStreamVideoFrame(frame_)
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastPreviewStreamReader, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_VideoFrameArrived(value) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", value, "ptr", token, "int")
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
    remove_VideoFrameArrived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
