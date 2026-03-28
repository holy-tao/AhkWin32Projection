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
     * @type {Pointer} 
     */
    Handle {
        get => this.get_Handle()
    }

    /**
     * @type {Pointer} 
     */
    hPal {
        get => this.get_hPal()
    }

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * @type {HDC} 
     */
    CurDC {
        get => this.get_CurDC()
    }

    /**
     * @type {BOOL} 
     */
    KeepOriginalFormat {
        get => this.get_KeepOriginalFormat()
        set => this.put_KeepOriginalFormat(value)
    }

    /**
     * @type {Integer} 
     */
    Attributes {
        get => this.get_Attributes()
    }

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
     * The Render method initializes the DVD filter graph.
     * @remarks
     * The `Render` method enables the **MSWebDVD** object to fully initialize the underlying DirectShow filter graph on startup. This eliminates the slight delay that otherwise occurs when the user issues the first command to play a disc or show a menu. There is no case in which `Render` needs to be called before calling any other method. For example, if the application calls [**PlayTitle**](playtitle-method.md) before the filter graph has been initialized, the **MSWebDVD** object calls `Render` automatically before attempting to play the disc.
     * @param {HDC} _hDC 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} cx 
     * @param {Integer} _cy 
     * @param {Integer} xSrc 
     * @param {Integer} ySrc 
     * @param {Integer} cxSrc 
     * @param {Integer} cySrc 
     * @param {Pointer<RECT>} pRcWBounds 
     * @returns {HRESULT} <span id="iRender"></span><span id="irender"></span><span id="IRENDER"></span>*iRender*
     * 
     * Specifies an integer value indicating whether the filter graph will be destroyed and rebuilt.
     * 
     * 
     * 
     * | Value | Description                                                                                         |
     * |-------|-----------------------------------------------------------------------------------------------------|
     * | 0     | The filter graph will not be destroyed and rebuilt if it already exists. This is the default value. |
     * | 1     | The filter graph will be destroyed and rebuilt if it already exists.                                |
     * 
     * 
     * 
     *  
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/render-method
     */
    Render(_hDC, x, y, cx, _cy, xSrc, ySrc, cxSrc, cySrc, pRcWBounds) {
        _hDC := _hDC is Win32Handle ? NumGet(_hDC, "ptr") : _hDC

        result := ComCall(8, this, "ptr", _hDC, "int", x, "int", y, "int", cx, "int", _cy, "int", xSrc, "int", ySrc, "int", cxSrc, "int", cySrc, "ptr", pRcWBounds, "HRESULT")
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
