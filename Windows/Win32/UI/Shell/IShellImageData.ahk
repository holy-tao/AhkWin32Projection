#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} cxDesired 
     * @param {Integer} cyDesired 
     * @returns {HRESULT} 
     */
    Decode(dwFlags, cxDesired, cyDesired) {
        result := ComCall(3, this, "uint", dwFlags, "uint", cxDesired, "uint", cyDesired, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HDC} hdc 
     * @param {Pointer<RECT>} prcDest 
     * @param {Pointer<RECT>} prcSrc 
     * @returns {HRESULT} 
     */
    Draw(hdc, prcDest, prcSrc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(4, this, "ptr", hdc, "ptr", prcDest, "ptr", prcSrc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NextFrame() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NextPage() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PrevPage() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsTransparent() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsAnimated() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsVector() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsMultipage() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsEditable() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsPrintable() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsDecoded() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pnPage 
     * @returns {HRESULT} 
     */
    GetCurrentPage(pnPage) {
        result := ComCall(15, this, "uint*", pnPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcPages 
     * @returns {HRESULT} 
     */
    GetPageCount(pcPages) {
        result := ComCall(16, this, "uint*", pcPages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iPage 
     * @returns {HRESULT} 
     */
    SelectPage(iPage) {
        result := ComCall(17, this, "uint", iPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} pSize 
     * @returns {HRESULT} 
     */
    GetSize(pSize) {
        result := ComCall(18, this, "ptr", pSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pDataFormat 
     * @returns {HRESULT} 
     */
    GetRawDataFormat(pDataFormat) {
        result := ComCall(19, this, "ptr", pDataFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetPixelFormat function obtains the index of the currently selected pixel format of the specified device context.
     * @param {Pointer<UInt32>} pFormat 
     * @returns {HRESULT} If the function succeeds, the return value is the currently selected pixel format index of the specified device context. This is a positive, one-based index value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpixelformat
     */
    GetPixelFormat(pFormat) {
        result := ComCall(20, this, "uint*", pFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwDelay 
     * @returns {HRESULT} 
     */
    GetDelay(pdwDelay) {
        result := ComCall(21, this, "uint*", pdwDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMode 
     * @param {Pointer<IPropertySetStorage>} ppPropSet 
     * @returns {HRESULT} 
     */
    GetProperties(dwMode, ppPropSet) {
        result := ComCall(22, this, "uint", dwMode, "ptr", ppPropSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAngle 
     * @returns {HRESULT} 
     */
    Rotate(dwAngle) {
        result := ComCall(23, this, "uint", dwAngle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cx 
     * @param {Integer} cy 
     * @param {Integer} hints 
     * @returns {HRESULT} 
     */
    Scale(cx, cy, hints) {
        result := ComCall(24, this, "uint", cx, "uint", cy, "int", hints, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DiscardEdit() {
        result := ComCall(25, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyBag>} pbagEnc 
     * @returns {HRESULT} 
     */
    SetEncoderParams(pbagEnc) {
        result := ComCall(26, this, "ptr", pbagEnc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     */
    DisplayName(wszName, cch) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(27, this, "ptr", wszName, "uint", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puResolutionX 
     * @param {Pointer<UInt32>} puResolutionY 
     * @returns {HRESULT} 
     */
    GetResolution(puResolutionX, puResolutionY) {
        result := ComCall(28, this, "uint*", puResolutionX, "uint*", puResolutionY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidFmt 
     * @param {Pointer<Byte>} ppEncParams 
     * @returns {HRESULT} 
     */
    GetEncoderParams(pguidFmt, ppEncParams) {
        result := ComCall(29, this, "ptr", pguidFmt, "char*", ppEncParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellImageDataAbort>} pAbort 
     * @param {Pointer<IShellImageDataAbort>} ppAbortPrev 
     * @returns {HRESULT} 
     */
    RegisterAbort(pAbort, ppAbortPrev) {
        result := ComCall(30, this, "ptr", pAbort, "ptr", ppAbortPrev, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ppImg 
     * @returns {HRESULT} 
     */
    CloneFrame(ppImg) {
        result := ComCall(31, this, "char*", ppImg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pImg 
     * @returns {HRESULT} 
     */
    ReplaceFrame(pImg) {
        result := ComCall(32, this, "char*", pImg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
