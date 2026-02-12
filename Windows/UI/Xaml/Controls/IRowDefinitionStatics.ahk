#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRowDefinitionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowDefinitionStatics
     * @type {Guid}
     */
    static IID => Guid("{5adf3fe5-2056-4724-94d6-e4812b022ec8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HeightProperty", "get_MaxHeightProperty", "get_MinHeightProperty"]

    /**
     * @type {DependencyProperty} 
     */
    HeightProperty {
        get => this.get_HeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxHeightProperty {
        get => this.get_MaxHeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MinHeightProperty {
        get => this.get_MinHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HeightProperty() {
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
    get_MaxHeightProperty() {
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
    get_MinHeightProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
