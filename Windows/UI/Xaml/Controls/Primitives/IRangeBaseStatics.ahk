#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IRangeBaseStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRangeBaseStatics
     * @type {Guid}
     */
    static IID => Guid("{67ef17e1-fe37-474f-9e97-3b5e0b30f2e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinimumProperty", "get_MaximumProperty", "get_SmallChangeProperty", "get_LargeChangeProperty", "get_ValueProperty"]

    /**
     * @type {DependencyProperty} 
     */
    MinimumProperty {
        get => this.get_MinimumProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaximumProperty {
        get => this.get_MaximumProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SmallChangeProperty {
        get => this.get_SmallChangeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LargeChangeProperty {
        get => this.get_LargeChangeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ValueProperty {
        get => this.get_ValueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MinimumProperty() {
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
    get_MaximumProperty() {
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
    get_SmallChangeProperty() {
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
    get_LargeChangeProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ValueProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
