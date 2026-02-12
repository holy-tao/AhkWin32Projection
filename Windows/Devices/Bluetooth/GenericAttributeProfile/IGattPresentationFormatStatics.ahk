#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattPresentationFormatStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattPresentationFormatStatics
     * @type {Guid}
     */
    static IID => Guid("{196d0020-faad-45dc-ae5b-2ac3184e84db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BluetoothSigAssignedNumbers"]

    /**
     * @type {Integer} 
     */
    BluetoothSigAssignedNumbers {
        get => this.get_BluetoothSigAssignedNumbers()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BluetoothSigAssignedNumbers() {
        result := ComCall(6, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
