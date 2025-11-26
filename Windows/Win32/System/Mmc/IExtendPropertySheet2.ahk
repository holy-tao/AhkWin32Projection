#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IExtendPropertySheet.ahk

/**
 * The IExtendPropertySheet2 interface is introduced in MMC 1.1.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iextendpropertysheet2
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IExtendPropertySheet2 extends IExtendPropertySheet{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExtendPropertySheet2
     * @type {Guid}
     */
    static IID => Guid("{b7a87232-4a51-11d1-a7ea-00c04fd909dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWatermarks"]

    /**
     * The IExtendPropertySheet2::GetWatermarks method gets the watermark bitmap and header bitmap for wizard sheets implemented as Wizard 97-style wizards.
     * @param {IDataObject} lpIDataObject A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the object that contains context information about the scope or result item.
     * @param {Pointer<HBITMAP>} lphWatermark A pointer to the handle to a bitmap that serves as the watermark for Wizard 97 pages. If the handle to the bitmap is <b>NULL</b>, no watermark is displayed for the wizard. If this value is not <b>NULL</b>, then the snap-in, for compatibility, should manage the lifetime of the watermark resource. The snap-in is responsible for freeing the watermark resource.
     * @param {Pointer<HBITMAP>} lphHeader A pointer to the handle to a bitmap that serves as the header for Wizard 97 pages. If the handle to the bitmap is <b>NULL</b>, no bitmap will be displayed in the header for wizard pages. If this value is not <b>NULL</b>, then the snap-in, for compatibility, should manage the lifetime of the header resource. The snap-in is responsible for freeing the header resource.
     * @param {Pointer<HPALETTE>} lphPalette A pointer to the handle to a palette that should be used for the bitmaps specified by lphWatermark and lphHeader. The palette is <b>NULL</b> by default. If a palette is not returned, the palette is <b>NULL</b>. If this value is not <b>NULL</b>, then the snap-in, for compatibility, should manage the lifetime of the palette resource. The snap-in is responsible for freeing the palette resource.
     * @param {Pointer<BOOL>} bStretch A value that specifies whether the watermark and header bitmaps should be stretched — instead of tiled — to fit the background or header area of the property sheet. <b>TRUE</b> specifies that the watermark and header bitmaps should be stretched; <b>FALSE</b> specifies that the watermark and header bitmaps should maintain their size and be tiled. This parameter is <b>FALSE</b> by default. If a <i>bStretch</i> value is not returned, <i>bStretch</i> is <b>FALSE</b>.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iextendpropertysheet2-getwatermarks
     */
    GetWatermarks(lpIDataObject, lphWatermark, lphHeader, lphPalette, bStretch) {
        bStretchMarshal := bStretch is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", lpIDataObject, "ptr", lphWatermark, "ptr", lphHeader, "ptr", lphPalette, bStretchMarshal, bStretch, "HRESULT")
        return result
    }
}
