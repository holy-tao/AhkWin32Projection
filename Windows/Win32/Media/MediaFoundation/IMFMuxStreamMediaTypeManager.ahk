#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pdwMuxStreamCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getstreamcount
     */
    GetStreamCount(pdwMuxStreamCount) {
        result := ComCall(3, this, "uint*", pdwMuxStreamCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMuxStreamIndex 
     * @param {Pointer<IMFMediaType>} ppMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getmediatype
     */
    GetMediaType(dwMuxStreamIndex, ppMediaType) {
        result := ComCall(4, this, "uint", dwMuxStreamIndex, "ptr*", ppMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getstreamconfigurationcount
     */
    GetStreamConfigurationCount(pdwCount) {
        result := ComCall(5, this, "uint*", pdwCount, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pullStreamMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getstreamconfiguration
     */
    GetStreamConfiguration(ulIndex, pullStreamMask) {
        result := ComCall(8, this, "uint", ulIndex, "uint*", pullStreamMask, "HRESULT")
        return result
    }
}
