#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IWPCBlockedUrls extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWPCBlockedUrls
     * @type {Guid}
     */
    static IID => Guid("{30510413-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetUrl"]

    /**
     * Retrieves the number of tagged elements in a given color profile.
     * @remarks
     * This function will fail if *hProfile* is not a valid ICC profile.
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/icm/nf-icm-getcountcolorprofileelements
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwCount
    }

    /**
     * Retrieves information about cache configuration. (Unicode)
     * @remarks
     * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winineti.h header defines GetUrlCacheConfigInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} dwIdx 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winineti/nf-winineti-geturlcacheconfiginfow
     */
    GetUrl(dwIdx) {
        pbstrUrl := BSTR()
        result := ComCall(4, this, "uint", dwIdx, "ptr", pbstrUrl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrUrl
    }
}
