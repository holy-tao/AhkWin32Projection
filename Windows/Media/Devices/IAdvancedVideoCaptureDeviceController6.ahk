#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VideoTemporalDenoisingControl.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IAdvancedVideoCaptureDeviceController6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdvancedVideoCaptureDeviceController6
     * @type {Guid}
     */
    static IID => Guid("{b6563a53-68a1-44b7-9f89-b5fa97ac0cbe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VideoTemporalDenoisingControl"]

    /**
     * @type {VideoTemporalDenoisingControl} 
     */
    VideoTemporalDenoisingControl {
        get => this.get_VideoTemporalDenoisingControl()
    }

    /**
     * 
     * @returns {VideoTemporalDenoisingControl} 
     */
    get_VideoTemporalDenoisingControl() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoTemporalDenoisingControl(value)
    }
}
