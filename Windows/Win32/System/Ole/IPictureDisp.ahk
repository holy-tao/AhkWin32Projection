#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }

/**
 * Exposes the picture object's properties through Automation. It provides a subset of the functionality available through IPicture methods.
 * @remarks
 * The following table describes the dispIDs for the various picture properties.
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Value</th>
 * </tr>
 * <tr>
 * <td>DISPID_PICT_HANDLE
 * </td>
 * <td>0</td>
 * </tr>
 * <tr>
 * <td>DISPID_PICT_HPAL
 * </td>
 * <td>2</td>
 * </tr>
 * <tr>
 * <td>DISPID_PICT_TYPE
 * </td>
 * <td>3</td>
 * </tr>
 * <tr>
 * <td>DISPID_PICT_WIDTH
 * </td>
 * <td>4</td>
 * </tr>
 * <tr>
 * <td>DISPID_PICT_HEIGHT
 * </td>
 * <td>5</td>
 * </tr>
 * <tr>
 * <td>DISPID_PICT_RENDER
 * </td>
 * <td>6</td>
 * </tr>
 * </table>
 *  
 * 
 * Each property in the <b>IPictureDisp</b> interface includes a <b>get_PropertyName</b> method if the property supports read access and a <b>put_PropertyName</b> method if the property supports write access. Most of the properties support read access only with the exception of the hPal property.
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
 * </table>
 *  
 * 
 * <h3><a id="OLE_Implementation"></a><a id="ole_implementation"></a><a id="OLE_IMPLEMENTATION"></a>OLE Implementation</h3>
 * Picture objects provide a language-neutral abstraction for bitmaps, icons, and metafiles. As with the standard font object, the system provides a standard implementation of the picture object. Its primary interfaces are <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ipicture">IPicture</a> and <b>IPictureDisp</b>. A picture object is created with <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-olecreatepictureindirect">OleCreatePictureIndirect</a> and supports both the <b>IPicture</b> and the <b>IPictureDisp</b> interfaces.
 * 
 * The OLE-provided picture object implements the complete semantics of the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ipicture">IPicture</a> and <b>IPictureDisp</b> interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-ipicturedisp
 * @namespace Windows.Win32.System.Ole
 */
export default struct IPictureDisp extends IDispatch {
    /**
     * The interface identifier for IPictureDisp
     * @type {Guid}
     */
    static IID := Guid("{7bf80981-bf32-101a-8bbb-00aa00300cab}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPictureDisp interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPictureDisp.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IPictureDisp.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
