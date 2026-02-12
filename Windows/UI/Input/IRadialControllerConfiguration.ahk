#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables interoperability with a WinRT�RadialControllerConfiguration object and provides access to RadialControllerConfiguration members for customizing a RadialController menu.
 * @see https://learn.microsoft.com/windows/win32/api//content/radialcontrollerinterop/nn-radialcontrollerinterop-iradialcontrollerconfigurationinterop
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IRadialControllerConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRadialControllerConfiguration
     * @type {Guid}
     */
    static IID => Guid("{a6b79ecb-6a52-4430-910c-56370a9d6b42}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDefaultMenuItems", "ResetToDefaultMenuItems", "TrySelectDefaultMenuItem"]

    /**
     * 
     * @param {IIterable<Integer>} buttons 
     * @returns {HRESULT} 
     */
    SetDefaultMenuItems(buttons) {
        result := ComCall(6, this, "ptr", buttons, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetToDefaultMenuItems() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {Boolean} 
     */
    TrySelectDefaultMenuItem(type) {
        result := ComCall(8, this, "int", type, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
