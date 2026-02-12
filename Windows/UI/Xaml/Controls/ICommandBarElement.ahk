#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the compact view for command bar elements.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.icommandbarelement
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICommandBarElement extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandBarElement
     * @type {Guid}
     */
    static IID => Guid("{67918e1b-f2d5-44d1-8b84-92b87f80a350}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsCompact", "put_IsCompact"]

    /**
     * Gets or sets a value that indicates whether the element is shown with no label and reduced padding.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.icommandbarelement.iscompact
     * @type {Boolean} 
     */
    IsCompact {
        get => this.get_IsCompact()
        set => this.put_IsCompact(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCompact() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCompact(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
