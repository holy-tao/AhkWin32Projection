#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapItemsControlStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapItemsControlStatics
     * @type {Guid}
     */
    static IID => Guid("{33a859c7-789b-425c-8a0a-32385896cb4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemsSourceProperty", "get_ItemsProperty", "get_ItemTemplateProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ItemsSourceProperty {
        get => this.get_ItemsSourceProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ItemsProperty {
        get => this.get_ItemsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ItemTemplateProperty {
        get => this.get_ItemTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ItemsSourceProperty() {
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
    get_ItemsProperty() {
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
    get_ItemTemplateProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
