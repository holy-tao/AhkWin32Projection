#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\GenericAttributeProfile\GattValueChangedEventArgs.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Background
 * @version WindowsRuntime 1.4
 */
class IGattCharacteristicNotificationTriggerDetails2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattCharacteristicNotificationTriggerDetails2
     * @type {Guid}
     */
    static IID => Guid("{727a50dc-949d-454a-b192-983467e3d50f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Error", "get_EventTriggeringMode", "get_ValueChangedEvents"]

    /**
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * @type {Integer} 
     */
    EventTriggeringMode {
        get => this.get_EventTriggeringMode()
    }

    /**
     * @type {IVectorView<GattValueChangedEventArgs>} 
     */
    ValueChangedEvents {
        get => this.get_ValueChangedEvents()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Error() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventTriggeringMode() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<GattValueChangedEventArgs>} 
     */
    get_ValueChangedEvents() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GattValueChangedEventArgs, value)
    }
}
