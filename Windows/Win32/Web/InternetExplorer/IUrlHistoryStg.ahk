#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IUrlHistoryStg extends IUnknown{
    /**
     * The interface identifier for IUrlHistoryStg
     * @type {Guid}
     */
    static IID => Guid("{3c374a41-bae4-11cf-bf7d-00aa006946ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pocsUrl 
     * @param {PWSTR} pocsTitle 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    AddUrl(pocsUrl, pocsTitle, dwFlags) {
        pocsUrl := pocsUrl is String ? StrPtr(pocsUrl) : pocsUrl
        pocsTitle := pocsTitle is String ? StrPtr(pocsTitle) : pocsTitle

        result := ComCall(3, this, "ptr", pocsUrl, "ptr", pocsTitle, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pocsUrl 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    DeleteUrl(pocsUrl, dwFlags) {
        pocsUrl := pocsUrl is String ? StrPtr(pocsUrl) : pocsUrl

        result := ComCall(4, this, "ptr", pocsUrl, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pocsUrl 
     * @param {Integer} dwFlags 
     * @param {Pointer<STATURL>} lpSTATURL 
     * @returns {HRESULT} 
     */
    QueryUrl(pocsUrl, dwFlags, lpSTATURL) {
        pocsUrl := pocsUrl is String ? StrPtr(pocsUrl) : pocsUrl

        result := ComCall(5, this, "ptr", pocsUrl, "uint", dwFlags, "ptr", lpSTATURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pocsUrl 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvOut 
     * @returns {HRESULT} 
     */
    BindToObject(pocsUrl, riid, ppvOut) {
        pocsUrl := pocsUrl is String ? StrPtr(pocsUrl) : pocsUrl

        result := ComCall(6, this, "ptr", pocsUrl, "ptr", riid, "ptr", ppvOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSTATURL>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumUrls(ppEnum) {
        result := ComCall(7, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
