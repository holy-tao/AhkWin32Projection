#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\MediaCaptureVideoProfile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCaptureStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCaptureStatics
     * @type {Guid}
     */
    static IID => Guid("{acef81ff-99ed-4645-965e-1925cfc63834}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsVideoProfileSupported", "FindAllVideoProfiles", "FindConcurrentProfiles", "FindKnownVideoProfiles"]

    /**
     * 
     * @param {HSTRING} videoDeviceId 
     * @returns {Boolean} 
     */
    IsVideoProfileSupported(videoDeviceId) {
        if(videoDeviceId is String) {
            pin := HSTRING.Create(videoDeviceId)
            videoDeviceId := pin.Value
        }
        videoDeviceId := videoDeviceId is Win32Handle ? NumGet(videoDeviceId, "ptr") : videoDeviceId

        result := ComCall(6, this, "ptr", videoDeviceId, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} videoDeviceId 
     * @returns {IVectorView<MediaCaptureVideoProfile>} 
     */
    FindAllVideoProfiles(videoDeviceId) {
        if(videoDeviceId is String) {
            pin := HSTRING.Create(videoDeviceId)
            videoDeviceId := pin.Value
        }
        videoDeviceId := videoDeviceId is Win32Handle ? NumGet(videoDeviceId, "ptr") : videoDeviceId

        result := ComCall(7, this, "ptr", videoDeviceId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MediaCaptureVideoProfile, value)
    }

    /**
     * 
     * @param {HSTRING} videoDeviceId 
     * @returns {IVectorView<MediaCaptureVideoProfile>} 
     */
    FindConcurrentProfiles(videoDeviceId) {
        if(videoDeviceId is String) {
            pin := HSTRING.Create(videoDeviceId)
            videoDeviceId := pin.Value
        }
        videoDeviceId := videoDeviceId is Win32Handle ? NumGet(videoDeviceId, "ptr") : videoDeviceId

        result := ComCall(8, this, "ptr", videoDeviceId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MediaCaptureVideoProfile, value)
    }

    /**
     * 
     * @param {HSTRING} videoDeviceId 
     * @param {Integer} name 
     * @returns {IVectorView<MediaCaptureVideoProfile>} 
     */
    FindKnownVideoProfiles(videoDeviceId, name) {
        if(videoDeviceId is String) {
            pin := HSTRING.Create(videoDeviceId)
            videoDeviceId := pin.Value
        }
        videoDeviceId := videoDeviceId is Win32Handle ? NumGet(videoDeviceId, "ptr") : videoDeviceId

        result := ComCall(9, this, "ptr", videoDeviceId, "int", name, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MediaCaptureVideoProfile, value)
    }
}
