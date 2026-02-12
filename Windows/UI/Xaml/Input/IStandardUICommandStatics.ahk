#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IStandardUICommandStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStandardUICommandStatics
     * @type {Guid}
     */
    static IID => Guid("{7ea87ed9-2978-5533-9b2e-6759ce88569f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KindProperty"]

    /**
     * @type {DependencyProperty} 
     */
    KindProperty {
        get => this.get_KindProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_KindProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
