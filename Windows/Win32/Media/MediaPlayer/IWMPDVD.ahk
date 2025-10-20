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
     * 
     * @param {BSTR} bstrItem 
     * @param {Pointer<VARIANT_BOOL>} pIsAvailable 
     * @returns {HRESULT} 
     */
    get_isAvailable(bstrItem, pIsAvailable) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        result := ComCall(7, this, "ptr", bstrItem, "ptr", pIsAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strDomain 
     * @returns {HRESULT} 
     */
    get_domain(strDomain) {
        result := ComCall(8, this, "ptr", strDomain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    topMenu() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    titleMenu() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    back() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    resume() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
