#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile.SystemManufacturers
 * @version WindowsRuntime 1.4
 */
class ISmbiosInformationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmbiosInformationStatics
     * @type {Guid}
     */
    static IID => Guid("{080cca7c-637c-48c4-b728-f9273812db8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SerialNumber"]

    /**
     * @type {HSTRING} 
     */
    SerialNumber {
        get => this.get_SerialNumber()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SerialNumber() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
