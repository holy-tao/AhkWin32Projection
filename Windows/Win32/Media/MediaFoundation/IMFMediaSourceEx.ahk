#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk
#Include .\IMFMediaSource.ahk

/**
 * Extends the IMFMediaSource interface to provide additional capabilities for a media source.
 * @remarks
 * 
 * Implementations of this interface can return <b>E_NOTIMPL</b> for any methods that are not required by the media source.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmediasourceex
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSourceEx extends IMFMediaSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaSourceEx
     * @type {Guid}
     */
    static IID => Guid("{3c9b2eb9-86d5-4514-a394-f56664f9f0d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSourceAttributes", "GetStreamAttributes", "SetD3DManager"]

    /**
     * Gets an attribute store for the media source.
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasourceex-getsourceattributes
     */
    GetSourceAttributes() {
        result := ComCall(13, this, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * Gets an attribute store for a stream on the media source.
     * @param {Integer} dwStreamIdentifier The identifier of the stream. To get the identifier, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamdescriptor-getstreamidentifier">IMFStreamDescriptor::GetStreamIdentifier</a> on the stream descriptor.
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasourceex-getstreamattributes
     */
    GetStreamAttributes(dwStreamIdentifier) {
        result := ComCall(14, this, "uint", dwStreamIdentifier, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * Sets a pointer to the Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager on the media source.
     * @param {IUnknown} pManager A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the DXGI Manager. The media source should query this pointer for the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager">IMFDXGIDeviceManager</a> interface.
     * @returns {HRESULT} This method can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media source does not support source-level attributes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasourceex-setd3dmanager
     */
    SetD3DManager(pManager) {
        result := ComCall(15, this, "ptr", pManager, "HRESULT")
        return result
    }
}
