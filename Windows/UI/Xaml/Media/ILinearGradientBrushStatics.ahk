#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ILinearGradientBrushStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILinearGradientBrushStatics
     * @type {Guid}
     */
    static IID => Guid("{7af6e504-2dc3-40e3-be0b-b314c13cb991}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StartPointProperty", "get_EndPointProperty"]

    /**
     * @type {DependencyProperty} 
     */
    StartPointProperty {
        get => this.get_StartPointProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    EndPointProperty {
        get => this.get_EndPointProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StartPointProperty() {
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
    get_EndPointProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
