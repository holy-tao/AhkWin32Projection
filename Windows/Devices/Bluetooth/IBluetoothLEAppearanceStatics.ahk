#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BluetoothLEAppearance.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEAppearanceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEAppearanceStatics
     * @type {Guid}
     */
    static IID => Guid("{a193c0c7-4504-4f4a-9ba5-cd1054e5e065}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromRawValue", "FromParts"]

    /**
     * 
     * @param {Integer} rawValue 
     * @returns {BluetoothLEAppearance} 
     */
    FromRawValue(rawValue) {
        result := ComCall(6, this, "ushort", rawValue, "ptr*", &appearance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothLEAppearance(appearance)
    }

    /**
     * 
     * @param {Integer} appearanceCategory 
     * @param {Integer} appearanceSubCategory 
     * @returns {BluetoothLEAppearance} 
     */
    FromParts(appearanceCategory, appearanceSubCategory) {
        result := ComCall(7, this, "ushort", appearanceCategory, "ushort", appearanceSubCategory, "ptr*", &appearance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothLEAppearance(appearance)
    }
}
