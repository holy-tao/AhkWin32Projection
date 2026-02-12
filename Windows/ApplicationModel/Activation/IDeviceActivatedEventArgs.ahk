#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information for a device that invokes AutoPlay.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ideviceactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IDeviceActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{cd50b9a9-ce10-44d2-8234-c355a073ef33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceInformationId", "get_Verb"]

    /**
     * Gets the device identifier for the device that invoked AutoPlay.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ideviceactivatedeventargs.deviceinformationid
     * @type {HSTRING} 
     */
    DeviceInformationId {
        get => this.get_DeviceInformationId()
    }

    /**
     * Gets the action associated with the activated device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ideviceactivatedeventargs.verb
     * @type {HSTRING} 
     */
    Verb {
        get => this.get_Verb()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceInformationId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Verb() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
