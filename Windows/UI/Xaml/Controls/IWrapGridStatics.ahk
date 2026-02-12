#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IWrapGridStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWrapGridStatics
     * @type {Guid}
     */
    static IID => Guid("{d04a6b97-13cb-479c-a285-e4e56846c4cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemWidthProperty", "get_ItemHeightProperty", "get_OrientationProperty", "get_HorizontalChildrenAlignmentProperty", "get_VerticalChildrenAlignmentProperty", "get_MaximumRowsOrColumnsProperty"]

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
    OrientationProperty {
        get => this.get_OrientationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HorizontalChildrenAlignmentProperty {
        get => this.get_HorizontalChildrenAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalChildrenAlignmentProperty {
        get => this.get_VerticalChildrenAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaximumRowsOrColumnsProperty {
        get => this.get_MaximumRowsOrColumnsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ItemWidthProperty() {
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
    get_ItemHeightProperty() {
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
    get_OrientationProperty() {
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
    get_HorizontalChildrenAlignmentProperty() {
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
    get_VerticalChildrenAlignmentProperty() {
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
    get_MaximumRowsOrColumnsProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
