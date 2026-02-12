#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Primitives\FlyoutBase.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRichTextBlock6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichTextBlock6
     * @type {Guid}
     */
    static IID => Guid("{ae9010cd-e899-526e-927e-88e0eed693c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectionFlyout", "put_SelectionFlyout", "CopySelectionToClipboard"]

    /**
     * @type {FlyoutBase} 
     */
    SelectionFlyout {
        get => this.get_SelectionFlyout()
        set => this.put_SelectionFlyout(value)
    }

    /**
     * 
     * @returns {FlyoutBase} 
     */
    get_SelectionFlyout() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FlyoutBase(value)
    }

    /**
     * 
     * @param {FlyoutBase} value 
     * @returns {HRESULT} 
     */
    put_SelectionFlyout(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CopySelectionToClipboard() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
