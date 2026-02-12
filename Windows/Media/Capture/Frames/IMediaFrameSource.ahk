#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MediaFrameSourceInfo.ahk
#Include .\MediaFrameSourceController.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\MediaFrameFormat.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Devices\Core\CameraIntrinsics.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IMediaFrameSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaFrameSource
     * @type {Guid}
     */
    static IID => Guid("{d6782953-90db-46a8-8add-2aa884a8d253}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Info", "get_Controller", "get_SupportedFormats", "get_CurrentFormat", "SetFormatAsync", "add_FormatChanged", "remove_FormatChanged", "TryGetCameraIntrinsics"]

    /**
     * @type {MediaFrameSourceInfo} 
     */
    Info {
        get => this.get_Info()
    }

    /**
     * @type {MediaFrameSourceController} 
     */
    Controller {
        get => this.get_Controller()
    }

    /**
     * @type {IVectorView<MediaFrameFormat>} 
     */
    SupportedFormats {
        get => this.get_SupportedFormats()
    }

    /**
     * @type {MediaFrameFormat} 
     */
    CurrentFormat {
        get => this.get_CurrentFormat()
    }

    /**
     * 
     * @returns {MediaFrameSourceInfo} 
     */
    get_Info() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaFrameSourceInfo(value)
    }

    /**
     * 
     * @returns {MediaFrameSourceController} 
     */
    get_Controller() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaFrameSourceController(value)
    }

    /**
     * 
     * @returns {IVectorView<MediaFrameFormat>} 
     */
    get_SupportedFormats() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MediaFrameFormat, value)
    }

    /**
     * 
     * @returns {MediaFrameFormat} 
     */
    get_CurrentFormat() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaFrameFormat(value)
    }

    /**
     * 
     * @param {MediaFrameFormat} format 
     * @returns {IAsyncAction} 
     */
    SetFormatAsync(format) {
        result := ComCall(10, this, "ptr", format, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaFrameSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FormatChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
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
    remove_FormatChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {MediaFrameFormat} format 
     * @returns {CameraIntrinsics} 
     */
    TryGetCameraIntrinsics(format) {
        result := ComCall(13, this, "ptr", format, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CameraIntrinsics(value)
    }
}
