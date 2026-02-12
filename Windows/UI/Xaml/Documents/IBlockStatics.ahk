#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class IBlockStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBlockStatics
     * @type {Guid}
     */
    static IID => Guid("{f86a8c34-8d18-4c53-aebd-91e610a5e010}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TextAlignmentProperty", "get_LineHeightProperty", "get_LineStackingStrategyProperty", "get_MarginProperty"]

    /**
     * @type {DependencyProperty} 
     */
    TextAlignmentProperty {
        get => this.get_TextAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LineHeightProperty {
        get => this.get_LineHeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LineStackingStrategyProperty {
        get => this.get_LineStackingStrategyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MarginProperty {
        get => this.get_MarginProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TextAlignmentProperty() {
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
    get_LineHeightProperty() {
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
    get_LineStackingStrategyProperty() {
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
    get_MarginProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
