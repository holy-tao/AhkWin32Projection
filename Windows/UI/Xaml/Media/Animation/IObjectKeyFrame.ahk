#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\KeyTime.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IObjectKeyFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectKeyFrame
     * @type {Guid}
     */
    static IID => Guid("{9852a851-8593-48ee-a6a4-d5d4720f029a}")

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
     * @type {IInspectable} 
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
     * @returns {IInspectable} 
     */
    get_Value() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        result := ComCall(7, this, "ptr", value, "int")
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
