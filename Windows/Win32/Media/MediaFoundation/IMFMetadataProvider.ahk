#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets metadata from a media source or other object.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmetadataprovider
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMetadataProvider extends IUnknown{
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
     * 
     * @param {Pointer<IMFPresentationDescriptor>} pPresentationDescriptor 
     * @param {Integer} dwStreamIdentifier 
     * @param {Integer} dwFlags 
     * @param {Pointer<IMFMetadata>} ppMFMetadata 
     * @returns {HRESULT} 
     */
    GetMFMetadata(pPresentationDescriptor, dwStreamIdentifier, dwFlags, ppMFMetadata) {
        result := ComCall(3, this, "ptr", pPresentationDescriptor, "uint", dwStreamIdentifier, "uint", dwFlags, "ptr", ppMFMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
