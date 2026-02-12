#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IGuidHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuidHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{59c7966b-ae52-5283-ad7f-a1b9e9678add}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateNewGuid", "get_Empty", "Equals"]

    /**
     * @type {Guid} 
     */
    Empty {
        get => this.get_Empty()
    }

    /**
     * 
     * @returns {Guid} 
     */
    CreateNewGuid() {
        result_ := Guid()
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Empty() {
        value := Guid()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Pointer<Guid>} target 
     * @param {Pointer<Guid>} value 
     * @returns {Boolean} 
     */
    Equals(target, value) {
        result := ComCall(8, this, "ptr", target, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
