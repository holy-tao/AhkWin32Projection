#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IFlyoutPresenter2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFlyoutPresenter2
     * @type {Guid}
     */
    static IID => Guid("{4f857e92-36b4-5048-9051-a992b43e8a1d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsDefaultShadowEnabled", "put_IsDefaultShadowEnabled"]

    /**
     * @type {Boolean} 
     */
    IsDefaultShadowEnabled {
        get => this.get_IsDefaultShadowEnabled()
        set => this.put_IsDefaultShadowEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDefaultShadowEnabled() {
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
    put_IsDefaultShadowEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
