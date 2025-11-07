#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaType.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables the management of stream configurations for a multiplexed media source. A stream configuration defines a set of substreams that can be included the multiplexed output.
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfmuxstreammediatypemanager
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMuxStreamMediaTypeManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMuxStreamMediaTypeManager
     * @type {Guid}
     */
    static IID => Guid("{505a2c72-42f7-4690-aeab-8f513d0ffdb8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamCount", "GetMediaType", "GetStreamConfigurationCount", "AddStreamConfiguration", "RemoveStreamConfiguration", "GetStreamConfiguration"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getstreamcount
     */
    GetStreamCount() {
        result := ComCall(3, this, "uint*", &pdwMuxStreamCount := 0, "HRESULT")
        return pdwMuxStreamCount
    }

    /**
     * 
     * @param {Integer} dwMuxStreamIndex 
     * @returns {IMFMediaType} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getmediatype
     */
    GetMediaType(dwMuxStreamIndex) {
        result := ComCall(4, this, "uint", dwMuxStreamIndex, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFMediaType(ppMediaType)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getstreamconfigurationcount
     */
    GetStreamConfigurationCount() {
        result := ComCall(5, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * 
     * @param {Integer} ullStreamMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-addstreamconfiguration
     */
    AddStreamConfiguration(ullStreamMask) {
        result := ComCall(6, this, "uint", ullStreamMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullStreamMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-removestreamconfiguration
     */
    RemoveStreamConfiguration(ullStreamMask) {
        result := ComCall(7, this, "uint", ullStreamMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getstreamconfiguration
     */
    GetStreamConfiguration(ulIndex) {
        result := ComCall(8, this, "uint", ulIndex, "uint*", &pullStreamMask := 0, "HRESULT")
        return pullStreamMask
    }
}
