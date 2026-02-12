#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ISpringVector2NaturalMotionAnimation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpringVector2NaturalMotionAnimation
     * @type {Guid}
     */
    static IID => Guid("{23f494b5-ee73-4f0f-a423-402b946df4b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DampingRatio", "put_DampingRatio", "get_Period", "put_Period"]

    /**
     * @type {Float} 
     */
    DampingRatio {
        get => this.get_DampingRatio()
        set => this.put_DampingRatio(value)
    }

    /**
     * @type {TimeSpan} 
     */
    Period {
        get => this.get_Period()
        set => this.put_Period(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DampingRatio() {
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
    put_DampingRatio(value) {
        result := ComCall(7, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Period() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Period(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
