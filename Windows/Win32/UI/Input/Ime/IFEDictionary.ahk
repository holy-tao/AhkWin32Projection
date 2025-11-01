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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close", "GetHeader", "DisplayProperty", "GetPosTable", "GetWords", "NextWords", "Create", "SetHeader", "ExistWord", "ExistDependency", "RegisterWord", "RegisterDependency", "GetDependencies", "NextDependencies", "ConvertFromOldMSIME", "ConvertFromUserToSys"]

    /**
     * 
     * @param {PSTR} pchDictPath 
     * @param {Pointer<IMESHF>} pshf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifedictionary-open
     */
    Open(pchDictPath, pshf) {
        pchDictPath := pchDictPath is String ? StrPtr(pchDictPath) : pchDictPath

        result := ComCall(3, this, "ptr", pchDictPath, "ptr", pshf, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifedictionary-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pchDictPath 
     * @param {Pointer<IMESHF>} pshf 
     * @param {Pointer<Integer>} pjfmt 
     * @param {Pointer<Integer>} pulType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifedictionary-getheader
     */
    GetHeader(pchDictPath, pshf, pjfmt, pulType) {
        pchDictPath := pchDictPath is String ? StrPtr(pchDictPath) : pchDictPath

        result := ComCall(5, this, "ptr", pchDictPath, "ptr", pshf, "int*", pjfmt, "uint*", pulType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifedictionary-displayproperty
     */
    DisplayProperty(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<POSTBL>>} prgPosTbl 
     * @param {Pointer<Integer>} pcPosTbl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifedictionary-getpostable
     */
    GetPosTable(prgPosTbl, pcPosTbl) {
        result := ComCall(7, this, "ptr*", prgPosTbl, "int*", pcPosTbl, "HRESULT")
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
     * @param {Pointer<Integer>} pchBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Integer>} pcWrd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifedictionary-getwords
     */
    GetWords(pwchFirst, pwchLast, pwchDisplay, ulPos, ulSelect, ulWordSrc, pchBuffer, cbBuffer, pcWrd) {
        pwchFirst := pwchFirst is String ? StrPtr(pwchFirst) : pwchFirst
        pwchLast := pwchLast is String ? StrPtr(pwchLast) : pwchLast
        pwchDisplay := pwchDisplay is String ? StrPtr(pwchDisplay) : pwchDisplay

        result := ComCall(8, this, "ptr", pwchFirst, "ptr", pwchLast, "ptr", pwchDisplay, "uint", ulPos, "uint", ulSelect, "uint", ulWordSrc, "char*", pchBuffer, "uint", cbBuffer, "uint*", pcWrd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pchBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Integer>} pcWrd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifedictionary-nextwords
     */
    NextWords(pchBuffer, cbBuffer, pcWrd) {
        result := ComCall(9, this, "char*", pchBuffer, "uint", cbBuffer, "uint*", pcWrd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pchDictPath 
     * @param {Pointer<IMESHF>} pshf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifedictionary-create
     */
    Create(pchDictPath, pshf) {
        pchDictPath := pchDictPath is String ? StrPtr(pchDictPath) : pchDictPath

        result := ComCall(10, this, "ptr", pchDictPath, "ptr", pshf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMESHF>} pshf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifedictionary-setheader
     */
    SetHeader(pshf) {
        result := ComCall(11, this, "ptr", pshf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMEWRD>} pwrd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifedictionary-existword
     */
    ExistWord(pwrd) {
        result := ComCall(12, this, "ptr", pwrd, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IMEDP>} pdp 
     * @returns {HRESULT} 
     */
    ExistDependency(pdp) {
        result := ComCall(13, this, "ptr", pdp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} reg 
     * @param {Pointer<IMEWRD>} pwrd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifedictionary-registerword
     */
    RegisterWord(reg, pwrd) {
        result := ComCall(14, this, "int", reg, "ptr", pwrd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} reg 
     * @param {Pointer<IMEDP>} pdp 
     * @returns {HRESULT} 
     */
    RegisterDependency(reg, pdp) {
        result := ComCall(15, this, "int", reg, "ptr", pdp, "HRESULT")
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
     * @param {Pointer<Integer>} pchBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Integer>} pcdp 
     * @returns {HRESULT} 
     */
    GetDependencies(pwchKakariReading, pwchKakariDisplay, ulKakariPos, pwchUkeReading, pwchUkeDisplay, ulUkePos, jrel, ulWordSrc, pchBuffer, cbBuffer, pcdp) {
        pwchKakariReading := pwchKakariReading is String ? StrPtr(pwchKakariReading) : pwchKakariReading
        pwchKakariDisplay := pwchKakariDisplay is String ? StrPtr(pwchKakariDisplay) : pwchKakariDisplay
        pwchUkeReading := pwchUkeReading is String ? StrPtr(pwchUkeReading) : pwchUkeReading
        pwchUkeDisplay := pwchUkeDisplay is String ? StrPtr(pwchUkeDisplay) : pwchUkeDisplay

        result := ComCall(16, this, "ptr", pwchKakariReading, "ptr", pwchKakariDisplay, "uint", ulKakariPos, "ptr", pwchUkeReading, "ptr", pwchUkeDisplay, "uint", ulUkePos, "int", jrel, "uint", ulWordSrc, "char*", pchBuffer, "uint", cbBuffer, "uint*", pcdp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pchBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Integer>} pcDp 
     * @returns {HRESULT} 
     */
    NextDependencies(pchBuffer, cbBuffer, pcDp) {
        result := ComCall(17, this, "char*", pchBuffer, "uint", cbBuffer, "uint*", pcDp, "HRESULT")
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
        pchDic := pchDic is String ? StrPtr(pchDic) : pchDic

        result := ComCall(18, this, "ptr", pchDic, "ptr", pfnLog, "int", reg, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ConvertFromUserToSys() {
        result := ComCall(19, this, "HRESULT")
        return result
    }
}
