#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\MediaFrameSourceGetPropertyResult.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Devices\VideoDeviceController.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IMediaFrameSourceController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaFrameSourceController
     * @type {Guid}
     */
    static IID => Guid("{6d076635-316d-4b8f-b7b6-eeb04a8c6525}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyAsync", "SetPropertyAsync", "get_VideoDeviceController"]

    /**
     * @type {VideoDeviceController} 
     */
    VideoDeviceController {
        get => this.get_VideoDeviceController()
    }

    /**
     * 
     * @param {HSTRING} propertyId 
     * @returns {IAsyncOperation<MediaFrameSourceGetPropertyResult>} 
     */
    GetPropertyAsync(propertyId) {
        if(propertyId is String) {
            pin := HSTRING.Create(propertyId)
            propertyId := pin.Value
        }
        propertyId := propertyId is Win32Handle ? NumGet(propertyId, "ptr") : propertyId

        result := ComCall(6, this, "ptr", propertyId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MediaFrameSourceGetPropertyResult, value)
    }

    /**
     * 
     * @param {HSTRING} propertyId 
     * @param {IInspectable} propertyValue_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    SetPropertyAsync(propertyId, propertyValue_) {
        if(propertyId is String) {
            pin := HSTRING.Create(propertyId)
            propertyId := pin.Value
        }
        propertyId := propertyId is Win32Handle ? NumGet(propertyId, "ptr") : propertyId

        result := ComCall(7, this, "ptr", propertyId, "ptr", propertyValue_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {VideoDeviceController} 
     */
    get_VideoDeviceController() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoDeviceController(value)
    }
}
