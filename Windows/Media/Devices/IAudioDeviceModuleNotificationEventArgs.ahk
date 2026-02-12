#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AudioDeviceModule.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IAudioDeviceModuleNotificationEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioDeviceModuleNotificationEventArgs
     * @type {Guid}
     */
    static IID => Guid("{e3e3ccaf-224c-48be-956b-9a13134e96e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Module", "get_NotificationData"]

    /**
     * @type {AudioDeviceModule} 
     */
    Module {
        get => this.get_Module()
    }

    /**
     * @type {IBuffer} 
     */
    NotificationData {
        get => this.get_NotificationData()
    }

    /**
     * 
     * @returns {AudioDeviceModule} 
     */
    get_Module() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioDeviceModule(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_NotificationData() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
