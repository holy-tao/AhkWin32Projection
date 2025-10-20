#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IFEDictionary interface allows clients to access a Microsoft IME user dictionary.
 * @remarks
 * 
  * Create an instance of this interface with the <a href="https://docs.microsoft.com/windows/desktop/api/msime/nf-msime-createifedictionaryinstance">CreateIFEDictionaryInstance</a> function.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msime/nn-msime-ifedictionary
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IFEDictionary extends IUnknown{
    /**
     * The interface identifier for IFEDictionary
     * @type {Guid}
     */
    static IID => Guid("{019f7153-e6db-11d0-83c3-00c04fddb82e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PSTR} pchDictPath 
     * @param {Pointer<IMESHF>} pshf 
     * @returns {HRESULT} 
     */
    Open(pchDictPath, pshf) {
        result := ComCall(3, this, "ptr", pchDictPath, "ptr", pshf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pchDictPath 
     * @param {Pointer<IMESHF>} pshf 
     * @param {Pointer<Int32>} pjfmt 
     * @param {Pointer<UInt32>} pulType 
     * @returns {HRESULT} 
     */
    GetHeader(pchDictPath, pshf, pjfmt, pulType) {
        result := ComCall(5, this, "ptr", pchDictPath, "ptr", pshf, "int*", pjfmt, "uint*", pulType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    DisplayProperty(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<POSTBL>} prgPosTbl 
     * @param {Pointer<Int32>} pcPosTbl 
     * @returns {HRESULT} 
     */
    GetPosTable(prgPosTbl, pcPosTbl) {
        result := ComCall(7, this, "ptr", prgPosTbl, "int*", pcPosTbl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwchFirst 
     * @param {PWSTR} pwchLast 
     * @param {PWSTR} pwchDisplay 
     * @param {Integer} ulPos 
     * @param {Integer} ulSelect 
     * @param {Integer} ulWordSrc 
     * @param {Pointer<Byte>} pchBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<UInt32>} pcWrd 
     * @returns {HRESULT} 
     */
    GetWords(pwchFirst, pwchLast, pwchDisplay, ulPos, ulSelect, ulWordSrc, pchBuffer, cbBuffer, pcWrd) {
        pwchFirst := pwchFirst is String ? StrPtr(pwchFirst) : pwchFirst
        pwchLast := pwchLast is String ? StrPtr(pwchLast) : pwchLast
        pwchDisplay := pwchDisplay is String ? StrPtr(pwchDisplay) : pwchDisplay

        result := ComCall(8, this, "ptr", pwchFirst, "ptr", pwchLast, "ptr", pwchDisplay, "uint", ulPos, "uint", ulSelect, "uint", ulWordSrc, "char*", pchBuffer, "uint", cbBuffer, "uint*", pcWrd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pchBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<UInt32>} pcWrd 
     * @returns {HRESULT} 
     */
    NextWords(pchBuffer, cbBuffer, pcWrd) {
        result := ComCall(9, this, "char*", pchBuffer, "uint", cbBuffer, "uint*", pcWrd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pchDictPath 
     * @param {Pointer<IMESHF>} pshf 
     * @returns {HRESULT} 
     */
    Create(pchDictPath, pshf) {
        result := ComCall(10, this, "ptr", pchDictPath, "ptr", pshf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMESHF>} pshf 
     * @returns {HRESULT} 
     */
    SetHeader(pshf) {
        result := ComCall(11, this, "ptr", pshf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMEWRD>} pwrd 
     * @returns {HRESULT} 
     */
    ExistWord(pwrd) {
        result := ComCall(12, this, "ptr", pwrd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMEDP>} pdp 
     * @returns {HRESULT} 
     */
    ExistDependency(pdp) {
        result := ComCall(13, this, "ptr", pdp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} reg 
     * @param {Pointer<IMEWRD>} pwrd 
     * @returns {HRESULT} 
     */
    RegisterWord(reg, pwrd) {
        result := ComCall(14, this, "int", reg, "ptr", pwrd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} reg 
     * @param {Pointer<IMEDP>} pdp 
     * @returns {HRESULT} 
     */
    RegisterDependency(reg, pdp) {
        result := ComCall(15, this, "int", reg, "ptr", pdp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwchKakariReading 
     * @param {PWSTR} pwchKakariDisplay 
     * @param {Integer} ulKakariPos 
     * @param {PWSTR} pwchUkeReading 
     * @param {PWSTR} pwchUkeDisplay 
     * @param {Integer} ulUkePos 
     * @param {Integer} jrel 
     * @param {Integer} ulWordSrc 
     * @param {Pointer<Byte>} pchBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<UInt32>} pcdp 
     * @returns {HRESULT} 
     */
    GetDependencies(pwchKakariReading, pwchKakariDisplay, ulKakariPos, pwchUkeReading, pwchUkeDisplay, ulUkePos, jrel, ulWordSrc, pchBuffer, cbBuffer, pcdp) {
        pwchKakariReading := pwchKakariReading is String ? StrPtr(pwchKakariReading) : pwchKakariReading
        pwchKakariDisplay := pwchKakariDisplay is String ? StrPtr(pwchKakariDisplay) : pwchKakariDisplay
        pwchUkeReading := pwchUkeReading is String ? StrPtr(pwchUkeReading) : pwchUkeReading
        pwchUkeDisplay := pwchUkeDisplay is String ? StrPtr(pwchUkeDisplay) : pwchUkeDisplay

        result := ComCall(16, this, "ptr", pwchKakariReading, "ptr", pwchKakariDisplay, "uint", ulKakariPos, "ptr", pwchUkeReading, "ptr", pwchUkeDisplay, "uint", ulUkePos, "int", jrel, "uint", ulWordSrc, "char*", pchBuffer, "uint", cbBuffer, "uint*", pcdp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pchBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<UInt32>} pcDp 
     * @returns {HRESULT} 
     */
    NextDependencies(pchBuffer, cbBuffer, pcDp) {
        result := ComCall(17, this, "char*", pchBuffer, "uint", cbBuffer, "uint*", pcDp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pchDic 
     * @param {Pointer<PFNLOG>} pfnLog 
     * @param {Integer} reg 
     * @returns {HRESULT} 
     */
    ConvertFromOldMSIME(pchDic, pfnLog, reg) {
        result := ComCall(18, this, "ptr", pchDic, "ptr", pfnLog, "int", reg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ConvertFromUserToSys() {
        result := ComCall(19, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
