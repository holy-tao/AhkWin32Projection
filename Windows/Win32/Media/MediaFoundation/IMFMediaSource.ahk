#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFPresentationDescriptor.ahk
#Include .\IMFMediaEventGenerator.ahk

/**
 * Implemented by media source objects.
 * @remarks
 * 
 * In Windows 8, this interface is extended with <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasourceex">IMFMediaSourceEx</a>.
 * 
 * For some device sources, such as cameras or microphones, the **IMFMediaSource** also implements the [IKsControl](/windows-hardware/drivers/ddi/ksproxy/nn-ksproxy-ikscontrol) which can be used by user mode applications to issue KSPROPERTY, KSEVENT and KSMETHOD operations to the underlying device driver.
 * 
 * > [!NOTE] 
 * > This interface is optional and may not be available. If this interface is not available, [QueryInterface](../unknwn/nf-unknwn-iunknown-queryinterface(refiid_void).md) will return E_NOINTERFACE.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmediasource
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSource extends IMFMediaEventGenerator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaSource
     * @type {Guid}
     */
    static IID => Guid("{279a808d-aec7-40c8-9c6b-a6b492c78a66}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCharacteristics", "CreatePresentationDescriptor", "Start", "Stop", "Pause", "Shutdown"]

    /**
     * Retrieves the characteristics of the media source.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfmediasource_characteristics">MFMEDIASOURCE_CHARACTERISTICS</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasource-getcharacteristics
     */
    GetCharacteristics() {
        result := ComCall(7, this, "uint*", &pdwCharacteristics := 0, "HRESULT")
        return pdwCharacteristics
    }

    /**
     * Retrieves a copy of the media source's presentation descriptor. Applications use the presentation descriptor to select streams and to get information about the source content.
     * @returns {IMFPresentationDescriptor} Receives a pointer to the presentation descriptor's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasource-createpresentationdescriptor
     */
    CreatePresentationDescriptor() {
        result := ComCall(8, this, "ptr*", &ppPresentationDescriptor := 0, "HRESULT")
        return IMFPresentationDescriptor(ppPresentationDescriptor)
    }

    /**
     * Starts, seeks, or restarts the media source by specifying where to start playback.
     * @param {IMFPresentationDescriptor} pPresentationDescriptor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of the media source's presentation descriptor. To get the presentation descriptor, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-createpresentationdescriptor">IMFMediaSource::CreatePresentationDescriptor</a>. You can modify the presentation descriptor before calling <b>Start</b>, to select or deselect streams or change the media types.
     * @param {Pointer<Guid>} pguidTimeFormat Pointer to a GUID that specifies the time format. The time format defines the units for the <i>pvarStartPosition</i> parameter. If the value <i></i> is <b>GUID_NULL</b>, the time format is 100-nanosecond units. Some media sources might support additional time format GUIDs. This parameter can be <b>NULL</b>. If the value is <b>NULL</b>, it is equalivent to <b>GUID_NULL</b>.
     * @param {Pointer<PROPVARIANT>} pvarStartPosition Specifies where to start playback. The units of this parameter are indicated by the time format given in <i>pguidTimeFormat</i>. If the time format is <b>GUID_NULL</b>, the variant type must be <b>VT_I8</b> or <b>VT_EMPTY</b>. Use <b>VT_I8</b> to specify a new starting position, in 100-nanosecond units. Use <b>VT_EMPTY</b> to start from the current position. Other time formats might use other <b>PROPVARIANT</b> types.
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
     * <dt><b>MF_E_ASF_OUTOFRANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The start position is past the end of the presentation (ASF media source).
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_HW_MFT_FAILED_START_STREAMING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A hardware device was unable to start streaming. This error code can be returned by a media source that represents a hardware device, such as a camera. For example, if the camera is already being used by another application, the method might return this error code.
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
     * The start request is not valid. For example, the start position is past the end of the presentation.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media source's <a href="/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-shutdown">Shutdown</a> method has been called.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_UNSUPPORTED_TIME_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media source does not support the time format specified in <i>pguidTimeFormat</i>.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasource-start
     */
    Start(pPresentationDescriptor, pguidTimeFormat, pvarStartPosition) {
        result := ComCall(9, this, "ptr", pPresentationDescriptor, "ptr", pguidTimeFormat, "ptr", pvarStartPosition, "HRESULT")
        return result
    }

    /**
     * Stops all active streams in the media source.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media source's <a href="/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-shutdown">Shutdown</a> method has been called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasource-stop
     */
    Stop() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Pauses all active streams in the media source.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALID_STATE_TRANSITION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid state transition. The media source must be in the started state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media source's <a href="/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-shutdown">Shutdown</a> method has been called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasource-pause
     */
    Pause() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Shuts down the media source and releases the resources it is using.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasource-shutdown
     */
    Shutdown() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
