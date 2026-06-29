#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDataObject.ahk" { IDataObject }
#Import ".\IExtendPropertySheet.ahk" { IExtendPropertySheet }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\HPALETTE.ahk" { HPALETTE }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The IExtendPropertySheet2 interface is introduced in MMC 1.1.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iextendpropertysheet2
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IExtendPropertySheet2 extends IExtendPropertySheet {
    /**
     * The interface identifier for IExtendPropertySheet2
     * @type {Guid}
     */
    static IID := Guid("{b7a87232-4a51-11d1-a7ea-00c04fd909dd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExtendPropertySheet2 interfaces
    */
    struct Vtbl extends IExtendPropertySheet.Vtbl {
        GetWatermarks : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExtendPropertySheet2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IExtendPropertySheet2::GetWatermarks method gets the watermark bitmap and header bitmap for wizard sheets implemented as Wizard 97-style wizards.
     * @remarks
     * MMC calls this method only when:
     * 
     * <ol>
     * <li>The type parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-ipropertysheetprovider-createpropertysheet">IPropertySheetProvider::CreatePropertySheet</a> is set to <b>FALSE</b> (for wizard sheet) and that the <i>dwOptions</i> parameter is set to <b>MMC_PSO_NEWWIZARDTYPE</b> (for Wizard 97 style).</li>
     * <li>The snap-in passes a pointer to its 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponentdata">IComponentData</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponent">IComponent</a> interface as the first parameter in calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-ipropertysheetprovider-addprimarypages">IPropertySheetProvider::AddPrimaryPages</a> method.</li>
     * </ol>
     * If the snap-in's implementation of this method returns a failure value (such as <b>E_NOTIMPL</b>), MMC reverts the wizard sheet requested by the snap-in in the call to <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-ipropertysheetprovider-createpropertysheet">IPropertySheetProvider::CreatePropertySheet</a> to the non-Wizard 97 style. This is to maintain compatibility with MMC 1.1.
     * 
     * To prevent distortion of the image, it is recommended that the watermark and header bitmaps have the following dimensions (in pixels) with <i>bStretch</i> set to <b>FALSE</b>.
     * 
     * <table>
     * <tr>
     * <th>Bitmap</th>
     * <th>Dimensions</th>
     * </tr>
     * <tr>
     * <td><i>lphWatermark</i></td>
     * <td>164w x 628h</td>
     * </tr>
     * <tr>
     * <td><i>lphHeader</i></td>
     * <td>49w x 49h</td>
     * </tr>
     * </table>
     * @param {IDataObject} lpIDataObject A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the object that contains context information about the scope or result item.
     * @param {Pointer<HBITMAP>} lphWatermark A pointer to the handle to a bitmap that serves as the watermark for Wizard 97 pages. If the handle to the bitmap is <b>NULL</b>, no watermark is displayed for the wizard. If this value is not <b>NULL</b>, then the snap-in, for compatibility, should manage the lifetime of the watermark resource. The snap-in is responsible for freeing the watermark resource.
     * @param {Pointer<HBITMAP>} lphHeader A pointer to the handle to a bitmap that serves as the header for Wizard 97 pages. If the handle to the bitmap is <b>NULL</b>, no bitmap will be displayed in the header for wizard pages. If this value is not <b>NULL</b>, then the snap-in, for compatibility, should manage the lifetime of the header resource. The snap-in is responsible for freeing the header resource.
     * @param {Pointer<HPALETTE>} lphPalette A pointer to the handle to a palette that should be used for the bitmaps specified by lphWatermark and lphHeader. The palette is <b>NULL</b> by default. If a palette is not returned, the palette is <b>NULL</b>. If this value is not <b>NULL</b>, then the snap-in, for compatibility, should manage the lifetime of the palette resource. The snap-in is responsible for freeing the palette resource.
     * @param {Pointer<BOOL>} bStretch A value that specifies whether the watermark and header bitmaps should be stretched — instead of tiled — to fit the background or header area of the property sheet. <b>TRUE</b> specifies that the watermark and header bitmaps should be stretched; <b>FALSE</b> specifies that the watermark and header bitmaps should maintain their size and be tiled. This parameter is <b>FALSE</b> by default. If a <i>bStretch</i> value is not returned, <i>bStretch</i> is <b>FALSE</b>.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendpropertysheet2-getwatermarks
     */
    GetWatermarks(lpIDataObject, lphWatermark, lphHeader, lphPalette, bStretch) {
        bStretchMarshal := bStretch is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", lpIDataObject, HBITMAP.Ptr, lphWatermark, HBITMAP.Ptr, lphHeader, HPALETTE.Ptr, lphPalette, bStretchMarshal, bStretch, "HRESULT")
        return result
    }

    Query(iid) {
        if (IExtendPropertySheet2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetWatermarks := CallbackCreate(GetMethod(implObj, "GetWatermarks"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetWatermarks)
    }
}
