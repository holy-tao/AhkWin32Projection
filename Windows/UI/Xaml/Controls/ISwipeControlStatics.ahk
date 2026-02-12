#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISwipeControlStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISwipeControlStatics
     * @type {Guid}
     */
    static IID => Guid("{e57ae83c-2216-4717-9ef6-4662334c6501}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LeftItemsProperty", "get_RightItemsProperty", "get_TopItemsProperty", "get_BottomItemsProperty"]

    /**
     * @type {DependencyProperty} 
     */
    LeftItemsProperty {
        get => this.get_LeftItemsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RightItemsProperty {
        get => this.get_RightItemsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TopItemsProperty {
        get => this.get_TopItemsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BottomItemsProperty {
        get => this.get_BottomItemsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LeftItemsProperty() {
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
    get_RightItemsProperty() {
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
    get_TopItemsProperty() {
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
    get_BottomItemsProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
