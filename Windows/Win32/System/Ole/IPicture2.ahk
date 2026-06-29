#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct IPicture2 extends IUnknown {
    /**
     * The interface identifier for IPicture2
     * @type {Guid}
     */
    static IID := Guid("{f5185dd8-2012-4b0b-aad9-f052c6bd482b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPicture2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Handle             : IntPtr
        get_hPal               : IntPtr
        get_Type               : IntPtr
        get_Width              : IntPtr
        get_Height             : IntPtr
        Render                 : IntPtr
        set_hPal               : IntPtr
        get_CurDC              : IntPtr
        SelectPicture          : IntPtr
        get_KeepOriginalFormat : IntPtr
        put_KeepOriginalFormat : IntPtr
        PictureChanged         : IntPtr
        SaveAsFile             : IntPtr
        get_Attributes         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPicture2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(8, this, HDC, _hDC, "int", x, "int", y, "int", cx, "int", _cy, "int", xSrc, "int", ySrc, "int", cxSrc, "int", cySrc, RECT.Ptr, pRcWBounds, "HRESULT")
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
        result := ComCall(10, this, HDC.Ptr, phDC, "HRESULT")
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
        phBmpOutMarshal := phBmpOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, HDC, hDCIn, HDC.Ptr, phDCOut, phBmpOutMarshal, phBmpOut, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_KeepOriginalFormat() {
        result := ComCall(12, this, BOOL.Ptr, &pKeep := 0, "HRESULT")
        return pKeep
    }

    /**
     * 
     * @param {BOOL} keep 
     * @returns {HRESULT} 
     */
    put_KeepOriginalFormat(keep) {
        result := ComCall(13, this, BOOL, keep, "HRESULT")
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
        result := ComCall(15, this, "ptr", pStream, BOOL, fSaveMemCopy, "int*", &pCbSize := 0, "HRESULT")
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

    Query(iid) {
        if (IPicture2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Handle := CallbackCreate(GetMethod(implObj, "get_Handle"), flags, 2)
        this.vtbl.get_hPal := CallbackCreate(GetMethod(implObj, "get_hPal"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_Width := CallbackCreate(GetMethod(implObj, "get_Width"), flags, 2)
        this.vtbl.get_Height := CallbackCreate(GetMethod(implObj, "get_Height"), flags, 2)
        this.vtbl.Render := CallbackCreate(GetMethod(implObj, "Render"), flags, 11)
        this.vtbl.set_hPal := CallbackCreate(GetMethod(implObj, "set_hPal"), flags, 2)
        this.vtbl.get_CurDC := CallbackCreate(GetMethod(implObj, "get_CurDC"), flags, 2)
        this.vtbl.SelectPicture := CallbackCreate(GetMethod(implObj, "SelectPicture"), flags, 4)
        this.vtbl.get_KeepOriginalFormat := CallbackCreate(GetMethod(implObj, "get_KeepOriginalFormat"), flags, 2)
        this.vtbl.put_KeepOriginalFormat := CallbackCreate(GetMethod(implObj, "put_KeepOriginalFormat"), flags, 2)
        this.vtbl.PictureChanged := CallbackCreate(GetMethod(implObj, "PictureChanged"), flags, 1)
        this.vtbl.SaveAsFile := CallbackCreate(GetMethod(implObj, "SaveAsFile"), flags, 4)
        this.vtbl.get_Attributes := CallbackCreate(GetMethod(implObj, "get_Attributes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Handle)
        CallbackFree(this.vtbl.get_hPal)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_Width)
        CallbackFree(this.vtbl.get_Height)
        CallbackFree(this.vtbl.Render)
        CallbackFree(this.vtbl.set_hPal)
        CallbackFree(this.vtbl.get_CurDC)
        CallbackFree(this.vtbl.SelectPicture)
        CallbackFree(this.vtbl.get_KeepOriginalFormat)
        CallbackFree(this.vtbl.put_KeepOriginalFormat)
        CallbackFree(this.vtbl.PictureChanged)
        CallbackFree(this.vtbl.SaveAsFile)
        CallbackFree(this.vtbl.get_Attributes)
    }
}
