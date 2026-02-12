#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IPivot3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPivot3
     * @type {Guid}
     */
    static IID => Guid("{95bcbf96-f0da-4089-8c65-e8b81354c766}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HeaderFocusVisualPlacement", "put_HeaderFocusVisualPlacement", "get_IsHeaderItemsCarouselEnabled", "put_IsHeaderItemsCarouselEnabled"]

    /**
     * @type {Integer} 
     */
    HeaderFocusVisualPlacement {
        get => this.get_HeaderFocusVisualPlacement()
        set => this.put_HeaderFocusVisualPlacement(value)
    }

    /**
     * @type {Boolean} 
     */
    IsHeaderItemsCarouselEnabled {
        get => this.get_IsHeaderItemsCarouselEnabled()
        set => this.put_IsHeaderItemsCarouselEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HeaderFocusVisualPlacement() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HeaderFocusVisualPlacement(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHeaderItemsCarouselEnabled() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_IsHeaderItemsCarouselEnabled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
