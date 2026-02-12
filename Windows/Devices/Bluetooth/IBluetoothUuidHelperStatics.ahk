#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothUuidHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothUuidHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{17df0cd8-cf74-4b21-afe6-f57a11bcdea0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromShortId", "TryGetShortId"]

    /**
     * 
     * @param {Integer} shortId 
     * @returns {Guid} 
     */
    FromShortId(shortId) {
        result_ := Guid()
        result := ComCall(6, this, "uint", shortId, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Guid} uuid 
     * @returns {IReference<Integer>} 
     */
    TryGetShortId(uuid) {
        result := ComCall(7, this, "ptr", uuid, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), result_)
    }
}
