#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IAppBarStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBarStatics
     * @type {Guid}
     */
    static IID => Guid("{79bb7e8d-dca9-4b5f-a448-37b13238ed76}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsOpenProperty", "get_IsStickyProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IsOpenProperty {
        get => this.get_IsOpenProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsStickyProperty {
        get => this.get_IsStickyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsOpenProperty() {
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
    get_IsStickyProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
