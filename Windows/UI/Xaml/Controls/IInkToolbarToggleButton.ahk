#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarToggleButton extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarToggleButton
     * @type {Guid}
     */
    static IID => Guid("{b4a278fa-f5f0-4b1f-beb0-0b8a29905a4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ToggleKind"]

    /**
     * @type {Integer} 
     */
    ToggleKind {
        get => this.get_ToggleKind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
