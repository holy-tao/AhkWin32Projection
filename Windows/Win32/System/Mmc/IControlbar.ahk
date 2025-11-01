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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "Attach", "Detach"]

    /**
     * 
     * @param {Integer} nType 
     * @param {IExtendControlbar} pExtendControlbar 
     * @param {Pointer<IUnknown>} ppUnknown 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icontrolbar-create
     */
    Create(nType, pExtendControlbar, ppUnknown) {
        result := ComCall(3, this, "int", nType, "ptr", pExtendControlbar, "ptr*", ppUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nType 
     * @param {IUnknown} lpUnknown 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icontrolbar-attach
     */
    Attach(nType, lpUnknown) {
        result := ComCall(4, this, "int", nType, "ptr", lpUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} lpUnknown 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icontrolbar-detach
     */
    Detach(lpUnknown) {
        result := ComCall(5, this, "ptr", lpUnknown, "HRESULT")
        return result
    }
}
