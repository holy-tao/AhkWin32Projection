#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUserInputString interface represents the object created when asking the user for a string�for example, when obtaining the name of a tag.
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nn-photoacquire-iuserinputstring
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class IUserInputString extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserInputString
     * @type {Guid}
     */
    static IID => Guid("{00f243a1-205b-45ba-ae26-abbc53aa7a6f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSubmitButtonText", "GetPrompt", "GetStringId", "GetStringType", "GetTooltipText", "GetMaxLength", "GetDefault", "GetMruCount", "GetMruEntryAt", "GetImage"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getsubmitbuttontext
     */
    GetSubmitButtonText() {
        pbstrSubmitButtonText := BSTR()
        result := ComCall(3, this, "ptr", pbstrSubmitButtonText, "HRESULT")
        return pbstrSubmitButtonText
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getprompt
     */
    GetPrompt() {
        pbstrPromptTitle := BSTR()
        result := ComCall(4, this, "ptr", pbstrPromptTitle, "HRESULT")
        return pbstrPromptTitle
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getstringid
     */
    GetStringId() {
        pbstrStringId := BSTR()
        result := ComCall(5, this, "ptr", pbstrStringId, "HRESULT")
        return pbstrStringId
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getstringtype
     */
    GetStringType() {
        result := ComCall(6, this, "int*", &pnStringType := 0, "HRESULT")
        return pnStringType
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-gettooltiptext
     */
    GetTooltipText() {
        pbstrTooltipText := BSTR()
        result := ComCall(7, this, "ptr", pbstrTooltipText, "HRESULT")
        return pbstrTooltipText
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getmaxlength
     */
    GetMaxLength() {
        result := ComCall(8, this, "uint*", &pcchMaxLength := 0, "HRESULT")
        return pcchMaxLength
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getdefault
     */
    GetDefault() {
        pbstrDefault := BSTR()
        result := ComCall(9, this, "ptr", pbstrDefault, "HRESULT")
        return pbstrDefault
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getmrucount
     */
    GetMruCount() {
        result := ComCall(10, this, "uint*", &pnMruCount := 0, "HRESULT")
        return pnMruCount
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getmruentryat
     */
    GetMruEntryAt(nIndex) {
        pbstrMruEntry := BSTR()
        result := ComCall(11, this, "uint", nIndex, "ptr", pbstrMruEntry, "HRESULT")
        return pbstrMruEntry
    }

    /**
     * 
     * @param {Integer} nSize 
     * @param {Pointer<HBITMAP>} phBitmap 
     * @param {Pointer<HICON>} phIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getimage
     */
    GetImage(nSize, phBitmap, phIcon) {
        result := ComCall(12, this, "uint", nSize, "ptr", phBitmap, "ptr", phIcon, "HRESULT")
        return result
    }
}
