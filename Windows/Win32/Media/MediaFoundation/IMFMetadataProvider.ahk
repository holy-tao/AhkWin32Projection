#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMetadata.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets metadata from a media source or other object.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmetadataprovider
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMetadataProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMetadataProvider
     * @type {Guid}
     */
    static IID => Guid("{56181d2d-e221-4adb-b1c8-3cee6a53f76f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMFMetadata"]

    /**
     * Gets a collection of metadata, either for an entire presentation, or for one stream in the presentation.
     * @param {IMFPresentationDescriptor} pPresentationDescriptor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of the media source's presentation descriptor.
     * @param {Integer} dwStreamIdentifier If this parameter is zero, the method retrieves metadata that applies to the entire presentation. Otherwise, this <i></i> parameter specifies a stream identifier, and the method retrieves metadata for that stream. To get the stream identifier for a stream, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamdescriptor-getstreamidentifier">IMFStreamDescriptor::GetStreamIdentifier</a>.
     * @param {Integer} dwFlags Reserved. Must be zero.
     * @returns {IMFMetadata} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmetadata">IMFMetadata</a> interface. Use this interface to access the metadata. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmetadataprovider-getmfmetadata
     */
    GetMFMetadata(pPresentationDescriptor, dwStreamIdentifier, dwFlags) {
        result := ComCall(3, this, "ptr", pPresentationDescriptor, "uint", dwStreamIdentifier, "uint", dwFlags, "ptr*", &ppMFMetadata := 0, "HRESULT")
        return IMFMetadata(ppMFMetadata)
    }
}
