#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Pointer>} pHandle 
     * @returns {HRESULT} 
     */
    get_Handle(pHandle) {
        result := ComCall(3, this, "ptr*", pHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} phPal 
     * @returns {HRESULT} 
     */
    get_hPal(phPal) {
        result := ComCall(4, this, "ptr*", phPal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     */
    get_Type(pType) {
        result := ComCall(5, this, "short*", pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pWidth 
     * @returns {HRESULT} 
     */
    get_Width(pWidth) {
        result := ComCall(6, this, "int*", pWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pHeight 
     * @returns {HRESULT} 
     */
    get_Height(pHeight) {
        result := ComCall(7, this, "int*", pHeight, "HRESULT")
        return result
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
     * @param {Pointer<HDC>} phDC 
     * @returns {HRESULT} 
     */
    get_CurDC(phDC) {
        result := ComCall(10, this, "ptr", phDC, "HRESULT")
        return result
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

        result := ComCall(11, this, "ptr", hDCIn, "ptr", phDCOut, "ptr*", phBmpOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pKeep 
     * @returns {HRESULT} 
     */
    get_KeepOriginalFormat(pKeep) {
        result := ComCall(12, this, "ptr", pKeep, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pCbSize 
     * @returns {HRESULT} 
     */
    SaveAsFile(pStream, fSaveMemCopy, pCbSize) {
        result := ComCall(15, this, "ptr", pStream, "int", fSaveMemCopy, "int*", pCbSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDwAttr 
     * @returns {HRESULT} 
     */
    get_Attributes(pDwAttr) {
        result := ComCall(16, this, "uint*", pDwAttr, "HRESULT")
        return result
    }
}
