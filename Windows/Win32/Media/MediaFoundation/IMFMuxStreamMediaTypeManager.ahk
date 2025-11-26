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
     * Gets the count of substreams managed by the multiplexed media source.
     * @returns {Integer} The count of substreams managed by the multiplexed media source.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getstreamcount
     */
    GetStreamCount() {
        result := ComCall(3, this, "uint*", &pdwMuxStreamCount := 0, "HRESULT")
        return pdwMuxStreamCount
    }

    /**
     * Gets the IMFMediaType of the substream with the specified index.
     * @param {Integer} dwMuxStreamIndex The index of the substream for which the media type is retrieved.
     * @returns {IMFMediaType} The media type of the substream with the specified index.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getmediatype
     */
    GetMediaType(dwMuxStreamIndex) {
        result := ComCall(4, this, "uint", dwMuxStreamIndex, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFMediaType(ppMediaType)
    }

    /**
     * Gets the count of registered stream configurations, which define set of substreams that can be included the multiplexed output.
     * @returns {Integer} The number of registered stream configurations.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getstreamconfigurationcount
     */
    GetStreamConfigurationCount() {
        result := ComCall(5, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Registers a stream configuration, which defines a set of substreams that can be included the multiplexed output.
     * @param {Integer} ullStreamMask A bitmask value where the bits that are on represent the indices of the substreams that are included in the stream configuration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified configuration is already registered.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied bitmask has bits set that are invalid for the media source.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-addstreamconfiguration
     */
    AddStreamConfiguration(ullStreamMask) {
        result := ComCall(6, this, "uint", ullStreamMask, "HRESULT")
        return result
    }

    /**
     * Unregisters a stream configuration, which defines a set of substreams that can be included the multiplexed output.
     * @param {Integer} ullStreamMask A bitmask value where the bits that are on represent the indices of the substreams that are included in the stream configuration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified configuration is not currently registered.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-removestreamconfiguration
     */
    RemoveStreamConfiguration(ullStreamMask) {
        result := ComCall(7, this, "uint", ullStreamMask, "HRESULT")
        return result
    }

    /**
     * Gets the stream configuration with the specified index, which defines a set of substreams that can be included the multiplexed output.
     * @param {Integer} ulIndex The index of the configuration to retrieve.
     * @returns {Integer} The index of the configuration to retrieve.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getstreamconfiguration
     */
    GetStreamConfiguration(ulIndex) {
        result := ComCall(8, this, "uint", ulIndex, "uint*", &pullStreamMask := 0, "HRESULT")
        return pullStreamMask
    }
}
