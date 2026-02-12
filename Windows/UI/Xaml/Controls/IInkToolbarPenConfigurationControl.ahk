#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InkToolbarPenButton.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarPenConfigurationControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarPenConfigurationControl
     * @type {Guid}
     */
    static IID => Guid("{601ae5f6-28a5-44cc-89a6-380e91a572dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PenButton"]

    /**
     * @type {InkToolbarPenButton} 
     */
    PenButton {
        get => this.get_PenButton()
    }

    /**
     * 
     * @returns {InkToolbarPenButton} 
     */
    get_PenButton() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkToolbarPenButton(value)
    }
}
