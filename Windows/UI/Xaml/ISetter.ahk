#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DependencyProperty.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ISetter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISetter
     * @type {Guid}
     */
    static IID => Guid("{a73ded29-b4ae-4a81-be85-e690ba0d3b6e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Property", "put_Property", "get_Value", "put_Value"]

    /**
     * @type {DependencyProperty} 
     */
    Property {
        get => this.get_Property()
        set => this.put_Property(value)
    }

    /**
     * @type {IInspectable} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_Property() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyProperty} value 
     * @returns {HRESULT} 
     */
    put_Property(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Value() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
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
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
