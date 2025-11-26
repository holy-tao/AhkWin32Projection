#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by clients that want to enforce a cross origin policy for HTML5 media downloads.
 * @remarks
 * 
 * The Media Foundation network code uses these client callbacks to implement and enforce cross origin downloads.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfnetcrossoriginsupport
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFNetCrossOriginSupport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFNetCrossOriginSupport
     * @type {Guid}
     */
    static IID => Guid("{bc2b7d44-a72d-49d5-8376-1480dee58b22}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCrossOriginPolicy", "GetSourceOrigin", "IsSameOrigin"]

    /**
     * Returns the client's current cross-origin policy to apply to the download session.
     * @returns {Integer} A value indicating the client's current cross-origin policy to apply to the download session.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetcrossoriginsupport-getcrossoriginpolicy
     */
    GetCrossOriginPolicy() {
        result := ComCall(3, this, "int*", &pPolicy := 0, "HRESULT")
        return pPolicy
    }

    /**
     * Returns the W3C origin of the HTML5 media element.
     * @returns {PWSTR} The W3C origin of the HTML5 media element.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetcrossoriginsupport-getsourceorigin
     */
    GetSourceOrigin() {
        result := ComCall(4, this, "ptr*", &wszSourceOrigin := 0, "HRESULT")
        return wszSourceOrigin
    }

    /**
     * 
     * @param {PWSTR} wszURL 
     * @returns {BOOL} 
     */
    IsSameOrigin(wszURL) {
        wszURL := wszURL is String ? StrPtr(wszURL) : wszURL

        result := ComCall(5, this, "ptr", wszURL, "int*", &pfIsSameOrigin := 0, "HRESULT")
        return pfIsSameOrigin
    }
}
