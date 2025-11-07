#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\HDC.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IPicture2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPicture2
     * @type {Guid}
     */
    static IID => Guid("{f5185dd8-2012-4b0b-aad9-f052c6bd482b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Handle", "get_hPal", "get_Type", "get_Width", "get_Height", "Render", "set_hPal", "get_CurDC", "SelectPicture", "get_KeepOriginalFormat", "put_KeepOriginalFormat", "PictureChanged", "SaveAsFile", "get_Attributes"]

    /**
     * 
     * @returns {Pointer} 
     */
    get_Handle() {
        result := ComCall(3, this, "ptr*", &pHandle := 0, "HRESULT")
        return pHandle
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_hPal() {
        result := ComCall(4, this, "ptr*", &phPal := 0, "HRESULT")
        return phPal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(5, this, "short*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        result := ComCall(6, this, "int*", &pWidth := 0, "HRESULT")
        return pWidth
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        result := ComCall(7, this, "int*", &pHeight := 0, "HRESULT")
        return pHeight
    }

    /**
     * 
     * @param {HDC} hDC 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} cx 
     * @param {Integer} cy 
     * @param {Integer} xSrc 
     * @param {Integer} ySrc 
     * @param {Integer} cxSrc 
     * @param {Integer} cySrc 
     * @param {Pointer<RECT>} pRcWBounds 
     * @returns {HRESULT} 
     */
    Render(hDC, x, y, cx, cy, xSrc, ySrc, cxSrc, cySrc, pRcWBounds) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := ComCall(8, this, "ptr", hDC, "int", x, "int", y, "int", cx, "int", cy, "int", xSrc, "int", ySrc, "int", cxSrc, "int", cySrc, "ptr", pRcWBounds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hPal 
     * @returns {HRESULT} 
     */
    set_hPal(hPal) {
        result := ComCall(9, this, "ptr", hPal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HDC} 
     */
    get_CurDC() {
        phDC := HDC()
        result := ComCall(10, this, "ptr", phDC, "HRESULT")
        return phDC
    }

    /**
     * 
     * @param {HDC} hDCIn 
     * @param {Pointer<HDC>} phDCOut 
     * @param {Pointer<Pointer>} phBmpOut 
     * @returns {HRESULT} 
     */
    SelectPicture(hDCIn, phDCOut, phBmpOut) {
        hDCIn := hDCIn is Win32Handle ? NumGet(hDCIn, "ptr") : hDCIn

        phBmpOutMarshal := phBmpOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "ptr", hDCIn, "ptr", phDCOut, phBmpOutMarshal, phBmpOut, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_KeepOriginalFormat() {
        result := ComCall(12, this, "int*", &pKeep := 0, "HRESULT")
        return pKeep
    }

    /**
     * 
     * @param {BOOL} keep 
     * @returns {HRESULT} 
     */
    put_KeepOriginalFormat(keep) {
        result := ComCall(13, this, "int", keep, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PictureChanged() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pStream 
     * @param {BOOL} fSaveMemCopy 
     * @returns {Integer} 
     */
    SaveAsFile(pStream, fSaveMemCopy) {
        result := ComCall(15, this, "ptr", pStream, "int", fSaveMemCopy, "int*", &pCbSize := 0, "HRESULT")
        return pCbSize
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Attributes() {
        result := ComCall(16, this, "uint*", &pDwAttr := 0, "HRESULT")
        return pDwAttr
    }
}
