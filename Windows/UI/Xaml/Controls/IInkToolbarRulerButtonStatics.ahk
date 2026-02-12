#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarRulerButtonStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarRulerButtonStatics
     * @type {Guid}
     */
    static IID => Guid("{bae75f65-be30-4bee-964b-ff9e498fee37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RulerProperty"]

    /**
     * @type {DependencyProperty} 
     */
    RulerProperty {
        get => this.get_RulerProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_RulerProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
