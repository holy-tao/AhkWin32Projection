#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\OemSupportInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile.SystemManufacturers
 * @version WindowsRuntime 1.4
 */
class ISystemSupportInfoStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemSupportInfoStatics
     * @type {Guid}
     */
    static IID => Guid("{ef750974-c422-45d7-a44d-5c1c0043a2b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LocalSystemEdition", "get_OemSupportInfo"]

    /**
     * @type {HSTRING} 
     */
    LocalSystemEdition {
        get => this.get_LocalSystemEdition()
    }

    /**
     * @type {OemSupportInfo} 
     */
    OemSupportInfo {
        get => this.get_OemSupportInfo()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalSystemEdition() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {OemSupportInfo} 
     */
    get_OemSupportInfo() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return OemSupportInfo(value)
    }
}
