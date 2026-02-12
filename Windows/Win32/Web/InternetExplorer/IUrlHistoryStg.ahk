#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumSTATURL.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IUrlHistoryStg extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddUrl", "DeleteUrl", "QueryUrl", "BindToObject", "EnumUrls"]

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deletes a cache container (which contains cache entries) based on the specified name. (Unicode)
     * @remarks
     * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service nor when impersonating a security context. For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winineti.h header defines DeleteUrlCacheContainer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} pocsUrl 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winineti/nf-winineti-deleteurlcachecontainerw
     */
    DeleteUrl(pocsUrl, dwFlags) {
        pocsUrl := pocsUrl is String ? StrPtr(pocsUrl) : pocsUrl

        result := ComCall(4, this, "ptr", pocsUrl, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pocsUrl 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     */
    BindToObject(pocsUrl, riid) {
        pocsUrl := pocsUrl is String ? StrPtr(pocsUrl) : pocsUrl

        result := ComCall(6, this, "ptr", pocsUrl, "ptr", riid, "ptr*", &ppvOut := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvOut
    }

    /**
     * 
     * @returns {IEnumSTATURL} 
     */
    EnumUrls() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumSTATURL(ppEnum)
    }
}
