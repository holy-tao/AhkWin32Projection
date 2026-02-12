#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InkToolbarStencilButton.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarIsStencilButtonCheckedChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarIsStencilButtonCheckedChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{026edd26-d32b-4e28-a033-d5097662b292}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StencilButton", "get_StencilKind"]

    /**
     * @type {InkToolbarStencilButton} 
     */
    StencilButton {
        get => this.get_StencilButton()
    }

    /**
     * @type {Integer} 
     */
    StencilKind {
        get => this.get_StencilKind()
    }

    /**
     * 
     * @returns {InkToolbarStencilButton} 
     */
    get_StencilButton() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkToolbarStencilButton(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StencilKind() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
