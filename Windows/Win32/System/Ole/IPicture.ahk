#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Manages a picture object and its properties. Picture objects provide a language-neutral abstraction for bitmaps, icons, and metafiles.
 * @remarks
 * 
  * Each property in the <b>IPicture</b> interface includes a <b>get_PropertyName</b> method if the property supports read access and a <b>put_PropertyName</b> method if the property supports write access.
  * 
  * <table>
  * <tr>
  * <th>Property</th>
  * <th>Type</th>
  * <th>Access</th>
  * <th>Description</th>
  * </tr>
  * <tr>
  * <td>Handle</td>
  * <td><b>OLE_HANDLE</b> (<b>int</b>)
  * </td>
  * <td>R</td>
  * <td>The Windows GDI handle of the picture
  * </td>
  * </tr>
  * <tr>
  * <td>hPal</td>
  * <td><b>OLE_HANDLE</b> (<b>int</b>)
  * </td>
  * <td>RW</td>
  * <td>The Windows handle of the palette used by the picture.
  * </td>
  * </tr>
  * <tr>
  * <td>Type</td>
  * <td><b>short</b></td>
  * <td>R</td>
  * <td>The type of picture (see <a href="https://docs.microsoft.com/windows/desktop/com/pictype-constants">PICTYPE</a>).
  * </td>
  * </tr>
  * <tr>
  * <td>Width</td>
  * <td><b>OLE_XSIZE_HIMETRIC</b> (<b>long</b>)
  * </td>
  * <td>R</td>
  * <td>The width of the picture.
  * </td>
  * </tr>
  * <tr>
  * <td>Height</td>
  * <td><b>OLE_YSIZE_HIMETRIC</b> (<b>long</b>)
  * </td>
  * <td>R</td>
  * <td>The height of the picture.
  * </td>
  * </tr>
  * <tr>
  * <td>CurDC</td>
  * <td><b>HDC</b></td>
  * <td>R</td>
  * <td>The current device context.</td>
  * </tr>
  * <tr>
  * <td>KeepOriginalFormat</td>
  * <td><b>BOOL</b></td>
  * <td>RW</td>
  * <td>If <b>TRUE</b>, the picture object maintains the entire original state of the picture in memory. If <b>FALSE</b>, any state not applicable to the user's computer is discarded.</td>
  * </tr>
  * <tr>
  * <td>Attributes</td>
  * <td><b>DWORD</b></td>
  * <td>R</td>
  * <td>Miscellaneous bit attributes of the picture.</td>
  * </tr>
  * </table>
  *  
  * 
  * <h3><a id="OLE_Implementation"></a><a id="ole_implementation"></a><a id="OLE_IMPLEMENTATION"></a>OLE Implementation</h3>
  * Picture objects provide a language-neutral abstraction for bitmaps, icons, and metafiles. As with the standard font object, the system provides a standard implementation of the picture object. Its primary interfaces are <b>IPicture</b> and <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ipicturedisp">IPictureDisp</a>. A picture object is created with <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-olecreatepictureindirect">OleCreatePictureIndirect</a> and supports both the <b>IPicture</b> and the <b>IPictureDisp</b> interfaces.
  * 
  * The OLE-provided picture object implements the complete semantics of the <b>IPicture</b> and <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ipicturedisp">IPictureDisp</a> interfaces.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ipicture
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IPicture extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPicture
     * @type {Guid}
     */
    static IID => Guid("{7bf80980-bf32-101a-8bbb-00aa00300cab}")

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
     * @param {Pointer<OLE_HANDLE>} pHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipicture-get_handle
     */
    get_Handle(pHandle) {
        result := ComCall(3, this, "ptr", pHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OLE_HANDLE>} phPal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipicture-get_hpal
     */
    get_hPal(phPal) {
        result := ComCall(4, this, "ptr", phPal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipicture-get_type
     */
    get_Type(pType) {
        result := ComCall(5, this, "short*", pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipicture-get_width
     */
    get_Width(pWidth) {
        result := ComCall(6, this, "int*", pWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipicture-get_height
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipicture-render
     */
    Render(hDC, x, y, cx, cy, xSrc, ySrc, cxSrc, cySrc, pRcWBounds) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := ComCall(8, this, "ptr", hDC, "int", x, "int", y, "int", cx, "int", cy, "int", xSrc, "int", ySrc, "int", cxSrc, "int", cySrc, "ptr", pRcWBounds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {OLE_HANDLE} hPal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipicture-set_hpal
     */
    set_hPal(hPal) {
        hPal := hPal is Win32Handle ? NumGet(hPal, "ptr") : hPal

        result := ComCall(9, this, "ptr", hPal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HDC>} phDC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipicture-get_curdc
     */
    get_CurDC(phDC) {
        result := ComCall(10, this, "ptr", phDC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HDC} hDCIn 
     * @param {Pointer<HDC>} phDCOut 
     * @param {Pointer<OLE_HANDLE>} phBmpOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipicture-selectpicture
     */
    SelectPicture(hDCIn, phDCOut, phBmpOut) {
        hDCIn := hDCIn is Win32Handle ? NumGet(hDCIn, "ptr") : hDCIn

        result := ComCall(11, this, "ptr", hDCIn, "ptr", phDCOut, "ptr", phBmpOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pKeep 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipicture-get_keeporiginalformat
     */
    get_KeepOriginalFormat(pKeep) {
        result := ComCall(12, this, "ptr", pKeep, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} keep 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipicture-put_keeporiginalformat
     */
    put_KeepOriginalFormat(keep) {
        result := ComCall(13, this, "int", keep, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipicture-picturechanged
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipicture-saveasfile
     */
    SaveAsFile(pStream, fSaveMemCopy, pCbSize) {
        result := ComCall(15, this, "ptr", pStream, "int", fSaveMemCopy, "int*", pCbSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDwAttr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipicture-get_attributes
     */
    get_Attributes(pDwAttr) {
        result := ComCall(16, this, "uint*", pDwAttr, "HRESULT")
        return result
    }
}
