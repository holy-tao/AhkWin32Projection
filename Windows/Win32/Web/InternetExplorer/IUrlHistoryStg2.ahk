#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUrlHistoryStg.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IUrlHistoryStg2 extends IUrlHistoryStg{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUrlHistoryStg2
     * @type {Guid}
     */
    static IID => Guid("{afa0dc11-c313-11d0-831a-00c04fd5ae38}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddUrlAndNotify", "ClearHistory"]

    /**
     * 
     * @param {PWSTR} pocsUrl 
     * @param {PWSTR} pocsTitle 
     * @param {Integer} dwFlags 
     * @param {BOOL} fWriteHistory 
     * @param {IOleCommandTarget} poctNotify 
     * @param {IUnknown} punkISFolder 
     * @returns {HRESULT} 
     */
    AddUrlAndNotify(pocsUrl, pocsTitle, dwFlags, fWriteHistory, poctNotify, punkISFolder) {
        pocsUrl := pocsUrl is String ? StrPtr(pocsUrl) : pocsUrl
        pocsTitle := pocsTitle is String ? StrPtr(pocsTitle) : pocsTitle

        result := ComCall(8, this, "ptr", pocsUrl, "ptr", pocsTitle, "uint", dwFlags, "int", fWriteHistory, "ptr", poctNotify, "ptr", punkISFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearHistory() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
