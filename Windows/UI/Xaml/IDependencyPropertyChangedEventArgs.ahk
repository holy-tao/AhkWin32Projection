#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DependencyProperty.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IDependencyPropertyChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDependencyPropertyChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{81212c2b-24d0-4957-abc3-224470a93a4e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Property", "get_OldValue", "get_NewValue"]

    /**
     * @type {DependencyProperty} 
     */
    Property {
        get => this.get_Property()
    }

    /**
     * @type {IInspectable} 
     */
    OldValue {
        get => this.get_OldValue()
    }

    /**
     * @type {IInspectable} 
     */
    NewValue {
        get => this.get_NewValue()
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
     * @returns {IInspectable} 
     */
    get_OldValue() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_NewValue() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }
}
