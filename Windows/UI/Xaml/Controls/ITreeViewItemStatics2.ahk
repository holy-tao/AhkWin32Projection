#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITreeViewItemStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITreeViewItemStatics2
     * @type {Guid}
     */
    static IID => Guid("{a8af82f3-d803-5c25-b48d-ae0e73b16d8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HasUnrealizedChildrenProperty", "get_ItemsSourceProperty"]

    /**
     * @type {DependencyProperty} 
     */
    HasUnrealizedChildrenProperty {
        get => this.get_HasUnrealizedChildrenProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ItemsSourceProperty {
        get => this.get_ItemsSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HasUnrealizedChildrenProperty() {
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
    get_ItemsSourceProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
