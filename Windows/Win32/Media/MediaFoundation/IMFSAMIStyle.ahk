#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    GetStyleCount(pdwCount) {
        result := ComCall(3, this, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} pPropVarStyleArray 
     * @returns {HRESULT} 
     */
    GetStyles(pPropVarStyleArray) {
        result := ComCall(4, this, "ptr", pPropVarStyleArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszStyle 
     * @returns {HRESULT} 
     */
    SetSelectedStyle(pwszStyle) {
        pwszStyle := pwszStyle is String ? StrPtr(pwszStyle) : pwszStyle

        result := ComCall(5, this, "ptr", pwszStyle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszStyle 
     * @returns {HRESULT} 
     */
    GetSelectedStyle(ppwszStyle) {
        result := ComCall(6, this, "ptr", ppwszStyle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
