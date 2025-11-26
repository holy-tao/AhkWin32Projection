#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPDVD interface provides methods for working with DVDs.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpdvd
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPDVD extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPDVD
     * @type {Guid}
     */
    static IID => Guid("{8da61686-4668-4a5c-ae5d-803193293dbe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_isAvailable", "get_domain", "topMenu", "titleMenu", "back", "resume"]

    /**
     */
    domain {
        get => this.get_domain()
    }

    /**
     * 
     * @param {BSTR} bstrItem 
     * @param {Pointer<VARIANT_BOOL>} pIsAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpdvd-get_isavailable
     */
    get_isAvailable(bstrItem, pIsAvailable) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        pIsAvailableMarshal := pIsAvailable is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, "ptr", bstrItem, pIsAvailableMarshal, pIsAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strDomain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpdvd-get_domain
     */
    get_domain(strDomain) {
        result := ComCall(8, this, "ptr", strDomain, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpdvd-topmenu
     */
    topMenu() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpdvd-titlemenu
     */
    titleMenu() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpdvd-back
     */
    back() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpdvd-resume
     */
    resume() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
