#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattCharacteristicStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattCharacteristicStatics
     * @type {Guid}
     */
    static IID => Guid("{59cb50c3-5934-4f68-a198-eb864fa44e6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConvertShortIdToUuid"]

    /**
     * 
     * @param {Integer} shortId 
     * @returns {Guid} 
     */
    ConvertShortIdToUuid(shortId) {
        characteristicUuid := Guid()
        result := ComCall(6, this, "ushort", shortId, "ptr", characteristicUuid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return characteristicUuid
    }
}
