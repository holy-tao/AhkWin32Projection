#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellItem.ahk" { IShellItem }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that allows conversion to JPEG or bitmap (BMP) image formats from any image type supported by Windows.
 * @see https://learn.microsoft.com/windows/win32/api/imagetranscode/nn-imagetranscode-itranscodeimage
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ITranscodeImage extends IUnknown {
    /**
     * The interface identifier for ITranscodeImage
     * @type {Guid}
     */
    static IID := Guid("{bae86ddd-dc11-421c-b7ab-cc55d1d65c44}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITranscodeImage interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        TranscodeImage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITranscodeImage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Converts an image to JPEG or bitmap (BMP) image format.
     * @remarks
     * The aspect ratio of the original image is preserved. 
     * 		The new image is resized so that it will fit into a box of width <i>uiMaxWidth</i> and height <i>uiMaxHeight</i>.
     * 		
     * 
     * The image size will not be changed if the original image already fits in this bounding box.
     * 
     * If both uiMaxWidth and uiMaxHeight are zero, the returned image will be the same size as the original.
     * @param {IShellItem} pShellItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * The Shell Item for the image to convert.
     * @param {Integer} uiMaxWidth Type: <b>UINT</b>
     * 
     * The requested height in pixels. Should be less than or equal to the actual height of the original image. See Remarks.
     * @param {Integer} uiMaxHeight Type: <b>UINT</b>
     * 
     * The requested width in pixels. Should be less than or equal to the actual width of the original image. See Remarks.
     * @param {Integer} flags Type: <b>TI_FLAGS</b>
     * 
     * One of the following flags.
     * @param {IStream} pvImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * A stream to receive the converted image. The stream must be created by the calling code prior to calling <b>TranscodeImage</b>.
     * @param {Pointer<Integer>} puiWidth Type: <b>UINT*</b>
     * 
     * The actual width of the converted image.
     * @param {Pointer<Integer>} puiHeight Type: <b>UINT*</b>
     * 
     * The actual height of the converted image.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/imagetranscode/nf-imagetranscode-itranscodeimage-transcodeimage
     */
    TranscodeImage(pShellItem, uiMaxWidth, uiMaxHeight, flags, pvImage, puiWidth, puiHeight) {
        puiWidthMarshal := puiWidth is VarRef ? "uint*" : "ptr"
        puiHeightMarshal := puiHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pShellItem, "uint", uiMaxWidth, "uint", uiMaxHeight, "uint", flags, "ptr", pvImage, puiWidthMarshal, puiWidth, puiHeightMarshal, puiHeight, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITranscodeImage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TranscodeImage := CallbackCreate(GetMethod(implObj, "TranscodeImage"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TranscodeImage)
    }
}
