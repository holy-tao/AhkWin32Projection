#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\OLE_HANDLE.ahk
#Include ..\..\Graphics\Gdi\HDC.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Manages a picture object and its properties. Picture objects provide a language-neutral abstraction for bitmaps, icons, and metafiles.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nn-ocidl-ipicture
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
     * @type {OLE_HANDLE} 
     */
    Handle {
        get => this.get_Handle()
    }

    /**
     * @type {OLE_HANDLE} 
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
     * Retrieves the handle to the picture managed within this picture object to a specified location.
     * @remarks
     * <h3><a id="Notes_to_Callers_"></a><a id="notes_to_callers_"></a><a id="NOTES_TO_CALLERS_"></a>Notes to Callers
     * </h3>
     * The picture object may retain ownership of the picture. However, the caller can be assured that the picture will remain valid until either the caller specifically destroys the picture or the picture object is itself destroyed. The <i>fOwn</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-olecreatepictureindirect">OleCreatePictureIndirect</a> determines ownership when the picture object is created. <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-oleloadpicture">OleLoadPicture</a> forces <i>fOwn</i> to <b>TRUE</b>.
     * @returns {OLE_HANDLE} A pointer to a variable that receives the handle. The caller is responsible for this handle upon successful return. The variable is set to <b>NULL</b> on failure.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipicture-get_handle
     */
    get_Handle() {
        pHandle := OLE_HANDLE()
        result := ComCall(3, this, "ptr", pHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pHandle
    }

    /**
     * Retrieves a copy of the palette currently used by the picture object.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * If the picture object has ownership of the picture, it also has ownership of the palette and will destroy it when the object is itself destroyed. Otherwise the caller owns the palette. The <i>fOwn</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-olecreatepictureindirect">OleCreatePictureIndirect</a> determines ownership. <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-oleloadpicture">OleLoadPicture</a> sets <i>fOwn</i> to <b>TRUE</b> to indicate that the picture object owns the palette.
     * @returns {OLE_HANDLE} A pointer to a variable that receives the palette handle. The variable is set to <b>NULL</b> on failure.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipicture-get_hpal
     */
    get_hPal() {
        phPal := OLE_HANDLE()
        result := ComCall(4, this, "ptr", phPal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPal
    }

    /**
     * Retrieves the current type of the picture contained in the picture object.
     * @returns {Integer} Pointer to a variable that receives the picture type. The Type property can have any one of the values contained in the <a href="https://docs.microsoft.com/windows/desktop/com/pictype-constants">PICTYPE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipicture-get_type
     */
    get_Type() {
        result := ComCall(5, this, "short*", &pType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pType
    }

    /**
     * Retrieves the current width of the picture in the picture object.
     * @returns {Integer} A pointer to a variable that receives the width.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipicture-get_width
     */
    get_Width() {
        result := ComCall(6, this, "int*", &pWidth := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pWidth
    }

    /**
     * Retrieves the current height of the picture in the picture object.
     * @returns {Integer} A pointer to a variable that receives the height.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipicture-get_height
     */
    get_Height() {
        result := ComCall(7, this, "int*", &pHeight := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pHeight
    }

    /**
     * Renders (draws) a specified portion of the picture defined by the offset (xSrc,ySrc) of the source picture and the dimensions to copy (cxSrc,xySrc).
     * @param {HDC} hDC_ A handle of the device context on which to render the image.
     * @param {Integer} x The horizontal coordinate in <i>hdc</i> at which to place the rendered image.
     * @param {Integer} y The vertical coordinate in <i>hdc</i> at which to place the rendered image.
     * @param {Integer} cx The horizontal dimension (width) of the destination rectangle.
     * @param {Integer} cy_ The vertical dimension (height) of the destination rectangle
     * @param {Integer} xSrc The horizontal offset in the source picture from which to start copying.
     * @param {Integer} ySrc The vertical offset in the source picture from which to start copying.
     * @param {Integer} cxSrc The horizontal extent to copy from the source picture.
     * @param {Integer} cySrc The vertical extent to copy from the source picture.
     * @param {Pointer<RECT>} pRcWBounds A pointer to a rectangle containing the position of the destination within a metafile device context if <i>hdc</i> is a metafile DC. Cannot be <b>NULL</b> in such cases.
     * @returns {HRESULT} This method supports the standard return values E_FAIL, E_INVALIDARG, and E_OUTOFMEMORY, as well as the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The picture was rendered successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address in <i>prcWBounds</i> is not valid when <i>hdc</i> contains a metafile device context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CTL_E_INVALIDPROPERTYVALUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter <i>cx</i>, <i>cy</i>, <i>cxSrc</i>, or <i>cySrc</i> has a value of zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipicture-render
     */
    Render(hDC_, x, y, cx, cy_, xSrc, ySrc, cxSrc, cySrc, pRcWBounds) {
        hDC_ := hDC_ is Win32Handle ? NumGet(hDC_, "ptr") : hDC_

        result := ComCall(8, this, "ptr", hDC_, "int", x, "int", y, "int", cx, "int", cy_, "int", xSrc, "int", ySrc, "int", cxSrc, "int", cySrc, "ptr", pRcWBounds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Assigns a GDI palette to the picture contained in the picture object.
     * @remarks
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Ownership of the palette passed to this method depends on how the picture object was created, as specified by the <i>fOwn</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-olecreatepictureindirect">OleCreatePictureIndirect</a>. <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-oleloadpicture">OleLoadPicture</a> forces <i>fOwn</i> to <b>TRUE</b>; if the object owns the picture, then it takes over ownership of this palette.
     * @param {OLE_HANDLE} hPal A handle to the GDI palette assigned to the picture.
     * @returns {HRESULT} This method supports the standard return values E_FAIL, E_INVALIDARG, E_OUTOFMEMORY, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipicture-set_hpal
     */
    set_hPal(hPal) {
        hPal := hPal is Win32Handle ? NumGet(hPal, "ptr") : hPal

        result := ComCall(9, this, "ptr", hPal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the handle of the current device context. This property is valid only for bitmap pictures.
     * @remarks
     * The CurDC property and the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipicture-selectpicture">IPicture::SelectPicture</a> method exist to circumvent restrictions in Windows; specifically, that an object can only be selected into exactly one device context at a time. In some cases, a picture object may be permanently selected into a particular device context (for example, a control may use a certain picture for a background). To use this picture property elsewhere, it must be temporarily deselected from its old device context, selected into the new device context for the operation, then reselected back into the old device context. The <b>IPicture::get_CurDC</b> method returns the device context handle into which the picture is currently selected. The <b>IPicture::SelectPicture</b> method selects the picture into a new device context, returning the old device context and the picture's GDI handle. The caller should select the picture back into the old device context when the caller is done with it, as is normal for Windows code.
     * 
     * <h3><a id="Notes_to_Callers_"></a><a id="notes_to_callers_"></a><a id="NOTES_TO_CALLERS_"></a>Notes to Callers
     * </h3>
     * The caller always owns any device contexts passed between it and the picture object. Because the picture object maintains a copy of the HDC, the caller should use a memory device context (created with the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createcompatibledc">CreateCompatibleDC</a> function) and not a screen device context (from <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdc">GetDC</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdca">CreateDC</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-beginpaint">BeginPaint</a>), because the screen device contexts are a limited system resource.
     * @returns {HDC} A pointer a variable that receives the device context.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipicture-get_curdc
     */
    get_CurDC() {
        phDC := HDC()
        result := ComCall(10, this, "ptr", phDC, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phDC
    }

    /**
     * Selects a bitmap picture into a given device context, and returns the device context in which the picture was previously selected as well as the picture's GDI handle. This method works in conjunction with IPicture::get_CurDC.
     * @param {HDC} hDCIn A handle for the device context in which to select the picture.
     * @param {Pointer<HDC>} phDCOut A pointer to a variable that receives the previous device context. This parameter can be <b>NULL</b> if the caller does not need this information. Ownership of the device context is always the responsibility of the caller.
     * @param {Pointer<OLE_HANDLE>} phBmpOut A pointer to a variable that receives the GDI handle of the picture. This parameter can be <b>NULL</b> if the caller does not need the handle. Ownership of this handle is determined by the <i>fOwn</i> parameter passed to <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-olecreatepictureindirect">OleCreatePictureIndirect</a>. Pictures loaded from a stream always own their resources.
     * @returns {HRESULT} This method supports the standard return values E_FAIL, E_INVALIDARG, E_OUTOFMEMORY, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipicture-selectpicture
     */
    SelectPicture(hDCIn, phDCOut, phBmpOut) {
        hDCIn := hDCIn is Win32Handle ? NumGet(hDCIn, "ptr") : hDCIn

        result := ComCall(11, this, "ptr", hDCIn, "ptr", phDCOut, "ptr", phBmpOut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the current value of the picture's KeepOriginalFormat property.
     * @returns {BOOL} A pointer to a variable that receives the value of the property.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipicture-get_keeporiginalformat
     */
    get_KeepOriginalFormat() {
        result := ComCall(12, this, "int*", &pKeep := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pKeep
    }

    /**
     * Sets the value of the picture's KeepOriginalFormat property.
     * @param {BOOL} keep Specifies the new value to assign to the property.
     * @returns {HRESULT} This method returns S_OK on success and E_FAIL otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipicture-put_keeporiginalformat
     */
    put_KeepOriginalFormat(keep) {
        result := ComCall(13, this, "int", keep, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the picture object that its picture resource has changed. This method only calls IPropertyNotifySink::OnChanged with DISPID_PICT_HANDLE for any connected sinks.
     * @returns {HRESULT} This method S_OK if it succeeds and E_FAIL if the picture object is uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipicture-picturechanged
     */
    PictureChanged() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Saves the picture's data into a stream in the same format that it would save itself into a file. Bitmaps use the BMP file format, metafiles the WMF format, and icons the ICO format.
     * @param {IStream} pStream A pointer to the stream into which the picture writes its data.
     * @param {BOOL} fSaveMemCopy A flag indicating whether to save a copy of the picture in memory.
     * @returns {Integer} Pointer to a variable that receives the number of bytes written into the stream. This value can be <b>NULL</b>, indicating that the caller does not require this information.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipicture-saveasfile
     */
    SaveAsFile(pStream, fSaveMemCopy) {
        result := ComCall(15, this, "ptr", pStream, "int", fSaveMemCopy, "int*", &pCbSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCbSize
    }

    /**
     * Retrieves the current set of the picture's bit attributes.
     * @returns {Integer} A pointer to a variable that receives the value of the Attributes property.
     * 
     * The Attributes property can contain any combination of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-pictureattributes">PICTUREATTRIBUTES</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipicture-get_attributes
     */
    get_Attributes() {
        result := ComCall(16, this, "uint*", &pDwAttr := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDwAttr
    }
}
