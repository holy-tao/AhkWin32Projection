#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IBounceVector3NaturalMotionAnimation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBounceVector3NaturalMotionAnimation
     * @type {Guid}
     */
    static IID => Guid("{47dabc31-10d3-4518-86f1-09caf742d113}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Acceleration", "put_Acceleration", "get_Restitution", "put_Restitution"]

    /**
     * @type {Float} 
     */
    Acceleration {
        get => this.get_Acceleration()
        set => this.put_Acceleration(value)
    }

    /**
     * @type {Float} 
     */
    Restitution {
        get => this.get_Restitution()
        set => this.put_Restitution(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Acceleration() {
        result := ComCall(6, this, "float*", &value := 0, "int")
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
    put_Acceleration(value) {
        result := ComCall(7, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Restitution() {
        result := ComCall(8, this, "float*", &value := 0, "int")
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
    put_Restitution(value) {
        result := ComCall(9, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
