#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDeviceAccessInformation2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceAccessInformation2
     * @type {Guid}
     */
    static IID => Guid("{e2b9dff6-e88f-5d0a-9c1e-d788808df47b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserPromptRequired"]

    /**
     * @type {Boolean} 
     */
    UserPromptRequired {
        get => this.get_UserPromptRequired()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UserPromptRequired() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
