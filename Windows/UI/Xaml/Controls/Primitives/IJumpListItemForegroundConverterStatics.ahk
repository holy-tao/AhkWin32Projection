#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IJumpListItemForegroundConverterStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJumpListItemForegroundConverterStatics
     * @type {Guid}
     */
    static IID => Guid("{474e7352-210c-4673-ac6a-413f0e2c7750}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EnabledProperty", "get_DisabledProperty"]

    /**
     * @type {DependencyProperty} 
     */
    EnabledProperty {
        get => this.get_EnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DisabledProperty {
        get => this.get_DisabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_EnabledProperty() {
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
    get_DisabledProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
