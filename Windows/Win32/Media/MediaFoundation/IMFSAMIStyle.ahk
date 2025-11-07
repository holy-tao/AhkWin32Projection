#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sets and retrieves Synchronized Accessible Media Interchange (SAMI) styles on the SAMI Media Source.
 * @remarks
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a>. The service identifier is <b>MF_SAMI_SERVICE</b>. Call <b>GetService</b> either directly on the SAMI media source, or on the Media Session (if you are using the SAMI source with the Media Session).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsamistyle
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSAMIStyle extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSAMIStyle
     * @type {Guid}
     */
    static IID => Guid("{a7e025dd-5303-4a62-89d6-e747e1efac73}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStyleCount", "GetStyles", "SetSelectedStyle", "GetSelectedStyle"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsamistyle-getstylecount
     */
    GetStyleCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsamistyle-getstyles
     */
    GetStyles() {
        pPropVarStyleArray := PROPVARIANT()
        result := ComCall(4, this, "ptr", pPropVarStyleArray, "HRESULT")
        return pPropVarStyleArray
    }

    /**
     * 
     * @param {PWSTR} pwszStyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsamistyle-setselectedstyle
     */
    SetSelectedStyle(pwszStyle) {
        pwszStyle := pwszStyle is String ? StrPtr(pwszStyle) : pwszStyle

        result := ComCall(5, this, "ptr", pwszStyle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsamistyle-getselectedstyle
     */
    GetSelectedStyle() {
        result := ComCall(6, this, "ptr*", &ppwszStyle := 0, "HRESULT")
        return ppwszStyle
    }
}
