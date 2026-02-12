#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IDateTimeSettingsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDateTimeSettingsStatics
     * @type {Guid}
     */
    static IID => Guid("{5d2150d1-47ee-48ab-a52b-9f1954278d82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSystemDateTime"]

    /**
     * 
     * @param {DateTime} utcDateTime 
     * @returns {HRESULT} 
     */
    SetSystemDateTime(utcDateTime) {
        result := ComCall(6, this, "ptr", utcDateTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
