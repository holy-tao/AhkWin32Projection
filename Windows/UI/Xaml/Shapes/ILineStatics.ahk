#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Shapes
 * @version WindowsRuntime 1.4
 */
class ILineStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILineStatics
     * @type {Guid}
     */
    static IID => Guid("{267c123d-6ea4-4c50-8b1d-50207aff1e8a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_X1Property", "get_Y1Property", "get_X2Property", "get_Y2Property"]

    /**
     * @type {DependencyProperty} 
     */
    X1Property {
        get => this.get_X1Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    Y1Property {
        get => this.get_Y1Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    X2Property {
        get => this.get_X2Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    Y2Property {
        get => this.get_Y2Property()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_X1Property() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_Y1Property() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_X2Property() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_Y2Property() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
