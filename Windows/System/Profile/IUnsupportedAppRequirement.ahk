#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class IUnsupportedAppRequirement extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUnsupportedAppRequirement
     * @type {Guid}
     */
    static IID => Guid("{6182445c-894b-5cbc-8976-a98e0a9b998d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Requirement", "get_Reasons"]

    /**
     * @type {HSTRING} 
     */
    Requirement {
        get => this.get_Requirement()
    }

    /**
     * @type {Integer} 
     */
    Reasons {
        get => this.get_Reasons()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Requirement() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reasons() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
