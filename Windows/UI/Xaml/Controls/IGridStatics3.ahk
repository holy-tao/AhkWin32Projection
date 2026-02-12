#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IGridStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGridStatics3
     * @type {Guid}
     */
    static IID => Guid("{c3fba437-5a0c-407a-9621-79545386d811}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RowSpacingProperty", "get_ColumnSpacingProperty"]

    /**
     * @type {DependencyProperty} 
     */
    RowSpacingProperty {
        get => this.get_RowSpacingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ColumnSpacingProperty {
        get => this.get_ColumnSpacingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_RowSpacingProperty() {
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
    get_ColumnSpacingProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
