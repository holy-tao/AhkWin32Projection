#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\MediaProperties\IMediaEncodingProperties.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Controls device settings on a video camera or microphone.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.imediadevicecontroller
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IMediaDeviceController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaDeviceController
     * @type {Guid}
     */
    static IID => Guid("{f6f8f5ce-209a-48fb-86fc-d44578f317e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAvailableMediaStreamProperties", "GetMediaStreamProperties", "SetMediaStreamPropertiesAsync"]

    /**
     * Gets a list of the supported encoding properties for the device.
     * @param {Integer} mediaStreamType_ The type of media stream for which to get the properties.
     * @returns {IVectorView<IMediaEncodingProperties>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.imediadevicecontroller.getavailablemediastreamproperties
     */
    GetAvailableMediaStreamProperties(mediaStreamType_) {
        result := ComCall(6, this, "int", mediaStreamType_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(IMediaEncodingProperties, value)
    }

    /**
     * Gets the encoding properties for the specified media stream type for the device.
     * @param {Integer} mediaStreamType_ The type of media stream for which to get the properties.
     * @returns {IMediaEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.imediadevicecontroller.getmediastreamproperties
     */
    GetMediaStreamProperties(mediaStreamType_) {
        result := ComCall(7, this, "int", mediaStreamType_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMediaEncodingProperties(value)
    }

    /**
     * Sets the encoding properties asynchronously for the specified media stream type for the device.
     * @param {Integer} mediaStreamType_ The type of media stream for which to set the properties.
     * @param {IMediaEncodingProperties} mediaEncodingProperties The encoding properties to set.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.imediadevicecontroller.setmediastreampropertiesasync
     */
    SetMediaStreamPropertiesAsync(mediaStreamType_, mediaEncodingProperties) {
        result := ComCall(8, this, "int", mediaStreamType_, "ptr", mediaEncodingProperties, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }
}
