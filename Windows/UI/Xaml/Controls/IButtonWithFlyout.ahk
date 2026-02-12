#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Primitives\FlyoutBase.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IButtonWithFlyout extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IButtonWithFlyout
     * @type {Guid}
     */
    static IID => Guid("{09108f87-df6c-4180-9b3a-e60845825811}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Flyout", "put_Flyout"]

    /**
     * @type {FlyoutBase} 
     */
    Flyout {
        get => this.get_Flyout()
        set => this.put_Flyout(value)
    }

    /**
     * 
     * @returns {FlyoutBase} 
     */
    get_Flyout() {
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
    put_Flyout(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
