#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Called when the default audio device is changed for either audio render or capture.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.idefaultaudiodevicechangedeventargs
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IDefaultAudioDeviceChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDefaultAudioDeviceChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{110f882f-1c05-4657-a18e-47c9b69f07ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_Role"]

    /**
     * Gets the ID of the newly selected audio device that raised the device change event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.idefaultaudiodevicechangedeventargs.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the role of the newly selected audio device that raised the device change event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.idefaultaudiodevicechangedeventargs.role
     * @type {Integer} 
     */
    Role {
        get => this.get_Role()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Role() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
