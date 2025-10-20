#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IControlbar interface provides a way to create toolbars and other controls.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-icontrolbar
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IControlbar extends IUnknown{
    /**
     * The interface identifier for IControlbar
     * @type {Guid}
     */
    static IID => Guid("{69fb811e-6c1c-11d0-a2cb-00c04fd909dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} nType 
     * @param {Pointer<IExtendControlbar>} pExtendControlbar 
     * @param {Pointer<IUnknown>} ppUnknown 
     * @returns {HRESULT} 
     */
    Create(nType, pExtendControlbar, ppUnknown) {
        result := ComCall(3, this, "int", nType, "ptr", pExtendControlbar, "ptr", ppUnknown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nType 
     * @param {Pointer<IUnknown>} lpUnknown 
     * @returns {HRESULT} 
     */
    Attach(nType, lpUnknown) {
        result := ComCall(4, this, "int", nType, "ptr", lpUnknown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} lpUnknown 
     * @returns {HRESULT} 
     */
    Detach(lpUnknown) {
        result := ComCall(5, this, "ptr", lpUnknown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
