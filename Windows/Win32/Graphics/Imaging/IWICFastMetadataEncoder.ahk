#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWICMetadataQueryWriter.ahk" { IWICMetadataQueryWriter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods used for in-place metadata editing. A fast metadata encoder enables you to add and remove metadata to an image without having to fully re-encode the image.
 * @remarks
 * A decoder must be created using the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a> value <b>WICDecodeMetadataCacheOnDemand</b> to perform in-place metadata updates. 
 *             Using the <b>WICDecodeMetadataCacheOnLoad</b> option causes the decoder to release the file stream necessary to perform the metadata updates. 
 *          
 * 
 * Not all metadata formats support fast metadata encoding. The native metadata handlers that support metadata are IFD, Exif, XMP, and GPS.
 *          
 * 
 * If a fast metadata encoder fails, the image will need to be fully re-encoded to add the metadata.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicfastmetadataencoder
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICFastMetadataEncoder extends IUnknown {
    /**
     * The interface identifier for IWICFastMetadataEncoder
     * @type {Guid}
     */
    static IID := Guid("{b84e2c09-78c9-4ac4-8bd3-524ae1663a2f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICFastMetadataEncoder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Commit                 : IntPtr
        GetMetadataQueryWriter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICFastMetadataEncoder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Finalizes metadata changes to the image stream.
     * @remarks
     * If the commit fails and returns <b>WINCODEC_ERR_STREAMNOTAVAILABLE</b>, ensure that the image decoder was loaded using the <b>WICDecodeMetadataCacheOnDemand</b> option. A fast metadata encoder is not supported when the decoder is created using the <b>WICDecodeMetadataCacheOnLoad</b> option. 
     * 
     * If the commit fails for any reason, you will need to re-encode the image to ensure the new metadata is added to the image.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicfastmetadataencoder-commit
     */
    Commit() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a metadata query writer for fast metadata encoding.
     * @returns {IWICMetadataQueryWriter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataquerywriter">IWICMetadataQueryWriter</a>**</b>
     * 
     * When this method returns, contains a pointer to the fast metadata encoder's metadata query writer.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicfastmetadataencoder-getmetadataquerywriter
     */
    GetMetadataQueryWriter() {
        result := ComCall(4, this, "ptr*", &ppIMetadataQueryWriter := 0, "HRESULT")
        return IWICMetadataQueryWriter(ppIMetadataQueryWriter)
    }

    Query(iid) {
        if (IWICFastMetadataEncoder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 1)
        this.vtbl.GetMetadataQueryWriter := CallbackCreate(GetMethod(implObj, "GetMetadataQueryWriter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Commit)
        CallbackFree(this.vtbl.GetMetadataQueryWriter)
    }
}
