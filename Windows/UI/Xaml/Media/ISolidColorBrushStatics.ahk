#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ISolidColorBrushStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISolidColorBrushStatics
     * @type {Guid}
     */
    static IID => Guid("{e1a65efa-2b23-41ba-b9ba-7094ec8e4e9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ColorProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ColorProperty {
        get => this.get_ColorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ColorProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
