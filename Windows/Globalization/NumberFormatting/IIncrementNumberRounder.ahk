#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class IIncrementNumberRounder extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIncrementNumberRounder
     * @type {Guid}
     */
    static IID => Guid("{70a64ff8-66ab-4155-9da1-739e46764543}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RoundingAlgorithm", "put_RoundingAlgorithm", "get_Increment", "put_Increment"]

    /**
     * @type {Integer} 
     */
    RoundingAlgorithm {
        get => this.get_RoundingAlgorithm()
        set => this.put_RoundingAlgorithm(value)
    }

    /**
     * @type {Float} 
     */
    Increment {
        get => this.get_Increment()
        set => this.put_Increment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RoundingAlgorithm() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RoundingAlgorithm(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Increment() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Increment(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
