#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IAdvancedVideoCaptureDeviceController11 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdvancedVideoCaptureDeviceController11
     * @type {Guid}
     */
    static IID => Guid("{d5b65ae2-3772-580c-a630-e75de9106904}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryAcquireExclusiveControl"]

    /**
     * 
     * @param {HSTRING} deviceId 
     * @param {Integer} mode_ 
     * @returns {Boolean} 
     */
    TryAcquireExclusiveControl(deviceId, mode_) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(6, this, "ptr", deviceId, "int", mode_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
