#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Devices\Enumeration\DeviceInformation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioDeviceOutputNode extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioDeviceOutputNode
     * @type {Guid}
     */
    static IID => Guid("{362edbff-ff1c-4434-9e0f-bd2ef522ac82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Device"]

    /**
     * @type {DeviceInformation} 
     */
    Device {
        get => this.get_Device()
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_Device() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceInformation(value)
    }
}
