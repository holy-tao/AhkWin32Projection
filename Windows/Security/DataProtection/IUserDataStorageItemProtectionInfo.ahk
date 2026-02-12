#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.DataProtection
 * @version WindowsRuntime 1.4
 */
class IUserDataStorageItemProtectionInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataStorageItemProtectionInfo
     * @type {Guid}
     */
    static IID => Guid("{5b6680f6-e87f-40a1-b19d-a6187a0c662f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Availability"]

    /**
     * @type {Integer} 
     */
    Availability {
        get => this.get_Availability()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Availability() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
