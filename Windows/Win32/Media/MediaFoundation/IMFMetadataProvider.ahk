#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFMetadata.ahk" { IMFMetadata }
#Import ".\IMFPresentationDescriptor.ahk" { IMFPresentationDescriptor }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Gets metadata from a media source or other object.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfmetadataprovider
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMetadataProvider extends IUnknown {
    /**
     * The interface identifier for IMFMetadataProvider
     * @type {Guid}
     */
    static IID := Guid("{56181d2d-e221-4adb-b1c8-3cee6a53f76f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMetadataProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMFMetadata : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMetadataProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a collection of metadata, either for an entire presentation, or for one stream in the presentation.
     * @param {IMFPresentationDescriptor} pPresentationDescriptor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of the media source's presentation descriptor.
     * @param {Integer} dwStreamIdentifier If this parameter is zero, the method retrieves metadata that applies to the entire presentation. Otherwise, this <i></i> parameter specifies a stream identifier, and the method retrieves metadata for that stream. To get the stream identifier for a stream, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamdescriptor-getstreamidentifier">IMFStreamDescriptor::GetStreamIdentifier</a>.
     * @param {Integer} dwFlags Reserved. Must be zero.
     * @returns {IMFMetadata} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmetadata">IMFMetadata</a> interface. Use this interface to access the metadata. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmetadataprovider-getmfmetadata
     */
    GetMFMetadata(pPresentationDescriptor, dwStreamIdentifier, dwFlags) {
        result := ComCall(3, this, "ptr", pPresentationDescriptor, "uint", dwStreamIdentifier, "uint", dwFlags, "ptr*", &ppMFMetadata := 0, "HRESULT")
        return IMFMetadata(ppMFMetadata)
    }

    Query(iid) {
        if (IMFMetadataProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMFMetadata := CallbackCreate(GetMethod(implObj, "GetMFMetadata"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMFMetadata)
    }
}
