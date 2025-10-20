#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUserInputString interface represents the object created when asking the user for a string�for example, when obtaining the name of a tag.
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nn-photoacquire-iuserinputstring
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class IUserInputString extends IUnknown{
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
     * 
     * @param {Pointer<BSTR>} pbstrSubmitButtonText 
     * @returns {HRESULT} 
     */
    GetSubmitButtonText(pbstrSubmitButtonText) {
        result := ComCall(3, this, "ptr", pbstrSubmitButtonText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPromptTitle 
     * @returns {HRESULT} 
     */
    GetPrompt(pbstrPromptTitle) {
        result := ComCall(4, this, "ptr", pbstrPromptTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrStringId 
     * @returns {HRESULT} 
     */
    GetStringId(pbstrStringId) {
        result := ComCall(5, this, "ptr", pbstrStringId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnStringType 
     * @returns {HRESULT} 
     */
    GetStringType(pnStringType) {
        result := ComCall(6, this, "int*", pnStringType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTooltipText 
     * @returns {HRESULT} 
     */
    GetTooltipText(pbstrTooltipText) {
        result := ComCall(7, this, "ptr", pbstrTooltipText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcchMaxLength 
     * @returns {HRESULT} 
     */
    GetMaxLength(pcchMaxLength) {
        result := ComCall(8, this, "uint*", pcchMaxLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDefault 
     * @returns {HRESULT} 
     */
    GetDefault(pbstrDefault) {
        result := ComCall(9, this, "ptr", pbstrDefault, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pnMruCount 
     * @returns {HRESULT} 
     */
    GetMruCount(pnMruCount) {
        result := ComCall(10, this, "uint*", pnMruCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<BSTR>} pbstrMruEntry 
     * @returns {HRESULT} 
     */
    GetMruEntryAt(nIndex, pbstrMruEntry) {
        result := ComCall(11, this, "uint", nIndex, "ptr", pbstrMruEntry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nSize 
     * @param {Pointer<HBITMAP>} phBitmap 
     * @param {Pointer<HICON>} phIcon 
     * @returns {HRESULT} 
     */
    GetImage(nSize, phBitmap, phIcon) {
        result := ComCall(12, this, "uint", nSize, "ptr", phBitmap, "ptr", phIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
