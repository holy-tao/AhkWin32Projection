#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\IPropertySetStorage.ahk
#Include .\IShellImageDataAbort.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods and properties that display, manipulate, and describe image data.
 * @remarks
 * 
  * This interface was not included in a public header file prior to Windows Vista.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nn-shimgdata-ishellimagedata
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellImageData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellImageData
     * @type {Guid}
     */
    static IID => Guid("{bfdeec12-8040-4403-a5ea-9e07dafcf530}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Decode", "Draw", "NextFrame", "NextPage", "PrevPage", "IsTransparent", "IsAnimated", "IsVector", "IsMultipage", "IsEditable", "IsPrintable", "IsDecoded", "GetCurrentPage", "GetPageCount", "SelectPage", "GetSize", "GetRawDataFormat", "GetPixelFormat", "GetDelay", "GetProperties", "Rotate", "Scale", "DiscardEdit", "SetEncoderParams", "DisplayName", "GetResolution", "GetEncoderParams", "RegisterAbort", "CloneFrame", "ReplaceFrame"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} cxDesired 
     * @param {Integer} cyDesired 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-decode
     */
    Decode(dwFlags, cxDesired, cyDesired) {
        result := ComCall(3, this, "uint", dwFlags, "uint", cxDesired, "uint", cyDesired, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HDC} hdc 
     * @param {Pointer<RECT>} prcDest 
     * @param {Pointer<RECT>} prcSrc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-draw
     */
    Draw(hdc, prcDest, prcSrc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(4, this, "ptr", hdc, "ptr", prcDest, "ptr", prcSrc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-nextframe
     */
    NextFrame() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-nextpage
     */
    NextPage() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-prevpage
     */
    PrevPage() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-istransparent
     */
    IsTransparent() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-isanimated
     */
    IsAnimated() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-isvector
     */
    IsVector() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-ismultipage
     */
    IsMultipage() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-iseditable
     */
    IsEditable() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-isprintable
     */
    IsPrintable() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-isdecoded
     */
    IsDecoded() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-getcurrentpage
     */
    GetCurrentPage(pnPage) {
        pnPageMarshal := pnPage is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, pnPageMarshal, pnPage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcPages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-getpagecount
     */
    GetPageCount(pcPages) {
        pcPagesMarshal := pcPages is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, pcPagesMarshal, pcPages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-selectpage
     */
    SelectPage(iPage) {
        result := ComCall(17, this, "uint", iPage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} pSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-getsize
     */
    GetSize(pSize) {
        result := ComCall(18, this, "ptr", pSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pDataFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-getrawdataformat
     */
    GetRawDataFormat(pDataFormat) {
        result := ComCall(19, this, "ptr", pDataFormat, "HRESULT")
        return result
    }

    /**
     * The GetPixelFormat function obtains the index of the currently selected pixel format of the specified device context.
     * @param {Pointer<Integer>} pFormat 
     * @returns {HRESULT} If the function succeeds, the return value is the currently selected pixel format index of the specified device context. This is a positive, one-based index value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpixelformat
     */
    GetPixelFormat(pFormat) {
        pFormatMarshal := pFormat is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, pFormatMarshal, pFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-getdelay
     */
    GetDelay(pdwDelay) {
        pdwDelayMarshal := pdwDelay is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, pdwDelayMarshal, pdwDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMode 
     * @returns {IPropertySetStorage} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-getproperties
     */
    GetProperties(dwMode) {
        result := ComCall(22, this, "uint", dwMode, "ptr*", &ppPropSet := 0, "HRESULT")
        return IPropertySetStorage(ppPropSet)
    }

    /**
     * 
     * @param {Integer} dwAngle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-rotate
     */
    Rotate(dwAngle) {
        result := ComCall(23, this, "uint", dwAngle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cx 
     * @param {Integer} cy 
     * @param {Integer} hints 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-scale
     */
    Scale(cx, cy, hints) {
        result := ComCall(24, this, "uint", cx, "uint", cy, "int", hints, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-discardedit
     */
    DiscardEdit() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPropertyBag} pbagEnc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-setencoderparams
     */
    SetEncoderParams(pbagEnc) {
        result := ComCall(26, this, "ptr", pbagEnc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-displayname
     */
    DisplayName(wszName, cch) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(27, this, "ptr", wszName, "uint", cch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puResolutionX 
     * @param {Pointer<Integer>} puResolutionY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-getresolution
     */
    GetResolution(puResolutionX, puResolutionY) {
        puResolutionXMarshal := puResolutionX is VarRef ? "uint*" : "ptr"
        puResolutionYMarshal := puResolutionY is VarRef ? "uint*" : "ptr"

        result := ComCall(28, this, puResolutionXMarshal, puResolutionX, puResolutionYMarshal, puResolutionY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidFmt 
     * @param {Pointer<Pointer<Integer>>} ppEncParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-getencoderparams
     */
    GetEncoderParams(pguidFmt, ppEncParams) {
        ppEncParamsMarshal := ppEncParams is VarRef ? "ptr*" : "ptr"

        result := ComCall(29, this, "ptr", pguidFmt, ppEncParamsMarshal, ppEncParams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellImageDataAbort} pAbort 
     * @returns {IShellImageDataAbort} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-registerabort
     */
    RegisterAbort(pAbort) {
        result := ComCall(30, this, "ptr", pAbort, "ptr*", &ppAbortPrev := 0, "HRESULT")
        return IShellImageDataAbort(ppAbortPrev)
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppImg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-cloneframe
     */
    CloneFrame(ppImg) {
        ppImgMarshal := ppImg is VarRef ? "ptr*" : "ptr"

        result := ComCall(31, this, ppImgMarshal, ppImg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pImg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedata-replaceframe
     */
    ReplaceFrame(pImg) {
        pImgMarshal := pImg is VarRef ? "char*" : "ptr"

        result := ComCall(32, this, pImgMarshal, pImg, "HRESULT")
        return result
    }
}
