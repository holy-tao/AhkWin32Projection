#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ILoopingSelectorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoopingSelectorStatics
     * @type {Guid}
     */
    static IID => Guid("{03e8bafa-8c7d-4fc5-b92a-f049fb933cc5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ShouldLoopProperty", "get_ItemsProperty", "get_SelectedIndexProperty", "get_SelectedItemProperty", "get_ItemWidthProperty", "get_ItemHeightProperty", "get_ItemTemplateProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ShouldLoopProperty {
        get => this.get_ShouldLoopProperty()
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
    SelectedIndexProperty {
        get => this.get_SelectedIndexProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedItemProperty {
        get => this.get_SelectedItemProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ItemWidthProperty {
        get => this.get_ItemWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ItemHeightProperty {
        get => this.get_ItemHeightProperty()
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
    get_ShouldLoopProperty() {
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
    get_SelectedIndexProperty() {
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
    get_SelectedItemProperty() {
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
    get_ItemWidthProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ItemHeightProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
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
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
