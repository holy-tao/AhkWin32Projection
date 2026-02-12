#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SystemSupportDeviceInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile.SystemManufacturers
 * @version WindowsRuntime 1.4
 */
class ISystemSupportInfoStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemSupportInfoStatics2
     * @type {Guid}
     */
    static IID => Guid("{33f349a4-3fa1-4986-aa4b-057420455e6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LocalDeviceInfo"]

    /**
     * @type {SystemSupportDeviceInfo} 
     */
    LocalDeviceInfo {
        get => this.get_LocalDeviceInfo()
    }

    /**
     * 
     * @returns {SystemSupportDeviceInfo} 
     */
    get_LocalDeviceInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemSupportDeviceInfo(value)
    }
}
