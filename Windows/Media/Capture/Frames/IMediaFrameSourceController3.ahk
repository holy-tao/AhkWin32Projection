#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Devices\AudioDeviceController.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IMediaFrameSourceController3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaFrameSourceController3
     * @type {Guid}
     */
    static IID => Guid("{1f0cf815-2464-4651-b1e8-4a82dbdb54de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AudioDeviceController"]

    /**
     * @type {AudioDeviceController} 
     */
    AudioDeviceController {
        get => this.get_AudioDeviceController()
    }

    /**
     * 
     * @returns {AudioDeviceController} 
     */
    get_AudioDeviceController() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioDeviceController(value)
    }
}
