#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class IGipFirmwareUpdateResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGipFirmwareUpdateResult
     * @type {Guid}
     */
    static IID => Guid("{6b794d32-8553-4292-8e03-e16651a2f8bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExtendedErrorCode", "get_FinalComponentId", "get_Status"]

    /**
     * @type {Integer} 
     */
    ExtendedErrorCode {
        get => this.get_ExtendedErrorCode()
    }

    /**
     * @type {Integer} 
     */
    FinalComponentId {
        get => this.get_FinalComponentId()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtendedErrorCode() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FinalComponentId() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
