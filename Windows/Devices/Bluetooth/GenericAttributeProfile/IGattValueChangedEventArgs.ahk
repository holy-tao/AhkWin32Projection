#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattValueChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattValueChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{d21bdb54-06e3-4ed8-a263-acfac8ba7313}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CharacteristicValue", "get_Timestamp"]

    /**
     * @type {IBuffer} 
     */
    CharacteristicValue {
        get => this.get_CharacteristicValue()
    }

    /**
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_CharacteristicValue() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        timestamp_ := DateTime()
        result := ComCall(7, this, "ptr", timestamp_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return timestamp_
    }
}
