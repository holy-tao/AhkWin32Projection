#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\KeyTime.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IDoubleKeyFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDoubleKeyFrame
     * @type {Guid}
     */
    static IID => Guid("{674456fd-e81e-4f4e-b4ad-0acfed9ecd68}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Value", "put_Value", "get_KeyTime", "put_KeyTime"]

    /**
     * @type {Float} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * @type {KeyTime} 
     */
    KeyTime {
        get => this.get_KeyTime()
        set => this.put_KeyTime(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Value() {
        result := ComCall(6, this, "double*", &value := 0, "int")
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
    put_Value(value) {
        result := ComCall(7, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {KeyTime} 
     */
    get_KeyTime() {
        value := KeyTime()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {KeyTime} value 
     * @returns {HRESULT} 
     */
    put_KeyTime(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
