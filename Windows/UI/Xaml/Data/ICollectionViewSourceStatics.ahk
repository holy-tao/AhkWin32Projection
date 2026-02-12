#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class ICollectionViewSourceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICollectionViewSourceStatics
     * @type {Guid}
     */
    static IID => Guid("{173a0710-46af-4c0c-818b-21b6ef81bf65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceProperty", "get_ViewProperty", "get_IsSourceGroupedProperty", "get_ItemsPathProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SourceProperty {
        get => this.get_SourceProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ViewProperty {
        get => this.get_ViewProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsSourceGroupedProperty {
        get => this.get_IsSourceGroupedProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ItemsPathProperty {
        get => this.get_ItemsPathProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SourceProperty() {
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
    get_ViewProperty() {
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
    get_IsSourceGroupedProperty() {
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
    get_ItemsPathProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
