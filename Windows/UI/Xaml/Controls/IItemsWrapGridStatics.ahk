#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IItemsWrapGridStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemsWrapGridStatics
     * @type {Guid}
     */
    static IID => Guid("{4ec5427d-24a0-449a-b763-3077ba0f2dd5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GroupPaddingProperty", "get_OrientationProperty", "get_MaximumRowsOrColumnsProperty", "get_ItemWidthProperty", "get_ItemHeightProperty", "get_GroupHeaderPlacementProperty", "get_CacheLengthProperty"]

    /**
     * @type {DependencyProperty} 
     */
    GroupPaddingProperty {
        get => this.get_GroupPaddingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OrientationProperty {
        get => this.get_OrientationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaximumRowsOrColumnsProperty {
        get => this.get_MaximumRowsOrColumnsProperty()
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
    GroupHeaderPlacementProperty {
        get => this.get_GroupHeaderPlacementProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CacheLengthProperty {
        get => this.get_CacheLengthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_GroupPaddingProperty() {
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
    get_OrientationProperty() {
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
    get_MaximumRowsOrColumnsProperty() {
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
    get_ItemWidthProperty() {
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
    get_ItemHeightProperty() {
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
    get_GroupHeaderPlacementProperty() {
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
    get_CacheLengthProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
