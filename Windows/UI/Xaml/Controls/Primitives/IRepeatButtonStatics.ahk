#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IRepeatButtonStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRepeatButtonStatics
     * @type {Guid}
     */
    static IID => Guid("{3914ac4e-f462-4f73-8197-e8846639c682}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DelayProperty", "get_IntervalProperty"]

    /**
     * @type {DependencyProperty} 
     */
    DelayProperty {
        get => this.get_DelayProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IntervalProperty {
        get => this.get_IntervalProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DelayProperty() {
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
    get_IntervalProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
