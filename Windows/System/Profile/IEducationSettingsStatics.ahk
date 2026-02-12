#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class IEducationSettingsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEducationSettingsStatics
     * @type {Guid}
     */
    static IID => Guid("{fc53f0ef-4d3e-4e13-9b23-505f4d091e92}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsEducationEnvironment"]

    /**
     * @type {Boolean} 
     */
    IsEducationEnvironment {
        get => this.get_IsEducationEnvironment()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEducationEnvironment() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
