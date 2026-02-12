#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRadioButtonStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRadioButtonStatics
     * @type {Guid}
     */
    static IID => Guid("{6b149293-f50f-4bd8-b0ac-5c162f33a208}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GroupNameProperty"]

    /**
     * @type {DependencyProperty} 
     */
    GroupNameProperty {
        get => this.get_GroupNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_GroupNameProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
