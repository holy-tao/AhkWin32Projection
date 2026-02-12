#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CameraOcclusionInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IAdvancedVideoCaptureDeviceController10 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdvancedVideoCaptureDeviceController10
     * @type {Guid}
     */
    static IID => Guid("{c621b82d-d6f0-5c1b-a388-a6e938407146}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CameraOcclusionInfo"]

    /**
     * @type {CameraOcclusionInfo} 
     */
    CameraOcclusionInfo {
        get => this.get_CameraOcclusionInfo()
    }

    /**
     * 
     * @returns {CameraOcclusionInfo} 
     */
    get_CameraOcclusionInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CameraOcclusionInfo(value)
    }
}
