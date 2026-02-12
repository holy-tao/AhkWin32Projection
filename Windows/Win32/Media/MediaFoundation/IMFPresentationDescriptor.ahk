#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFPresentationDescriptor.ahk
#Include .\IMFAttributes.ahk

/**
 * Describes the details of a presentation. A presentation is a set of related media streams that share a common presentation time.
 * @remarks
 * Presentation descriptors are used to configure media sources and some media sinks. To get the presentation descriptor from a media source, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-createpresentationdescriptor">IMFMediaSource::CreatePresentationDescriptor</a>. To create a new presentation descriptor, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatepresentationdescriptor">MFCreatePresentationDescriptor</a>.
 * 
 * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfpresentationdescriptor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFPresentationDescriptor extends IMFAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFPresentationDescriptor
     * @type {Guid}
     */
    static IID => Guid("{03cb2711-24d7-4db6-a17f-f3a7a479a536}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamDescriptorCount", "GetStreamDescriptorByIndex", "SelectStream", "DeselectStream", "Clone"]

    /**
     * Retrieves the number of stream descriptors in the presentation. Each stream descriptor contains information about one stream in the media source. To retrieve a stream descriptor, call the IMFPresentationDescriptor::GetStreamDescriptorByIndex method.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {Integer} Receives the number of stream descriptors.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfpresentationdescriptor-getstreamdescriptorcount
     */
    GetStreamDescriptorCount() {
        result := ComCall(33, this, "uint*", &pdwDescriptorCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwDescriptorCount
    }

    /**
     * Retrieves a stream descriptor for a stream in the presentation. The stream descriptor contains information about the stream.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Integer} dwIndex Zero-based index of the stream. To find the number of streams in the presentation, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationdescriptor-getstreamdescriptorcount">IMFPresentationDescriptor::GetStreamDescriptorCount</a> method.
     * @param {Pointer<BOOL>} pfSelected Receives a Boolean value. The value is <b>TRUE</b> if the stream is currently selected, or <b>FALSE</b> if the stream is currently deselected. If a stream is selected, the media source generates data for that stream when <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-start">IMFMediaSource::Start</a> is called. The media source will not generated data for deselected streams. To select a stream, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationdescriptor-selectstream">IMFPresentationDescriptor::SelectStream</a>.To deselect a stream, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationdescriptor-deselectstream">IMFPresentationDescriptor::DeselectStream</a>.
     * @param {Pointer<IMFStreamDescriptor>} ppDescriptor Receives a pointer to the stream descriptor's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfstreamdescriptor">IMFStreamDescriptor</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfpresentationdescriptor-getstreamdescriptorbyindex
     */
    GetStreamDescriptorByIndex(dwIndex, pfSelected, ppDescriptor) {
        pfSelectedMarshal := pfSelected is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, "uint", dwIndex, pfSelectedMarshal, pfSelected, "ptr*", ppDescriptor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Selects a stream in the presentation.
     * @remarks
     * If a stream is selected, the media source will generate data for that stream. The media source will not generated data for deselected streams. To deselect a stream, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationdescriptor-deselectstream">IMFPresentationDescriptor::DeselectStream</a>.
     *       
     * 
     * To query whether a stream is selected, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationdescriptor-getstreamdescriptorbyindex">IMFPresentationDescriptor::GetStreamDescriptorByIndex</a>.
     *       
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Integer} dwDescriptorIndex The stream number to select, indexed from zero. To find the number of streams in the presentation, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationdescriptor-getstreamdescriptorcount">IMFPresentationDescriptor::GetStreamDescriptorCount</a>.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dwDescriptorIndex</i> is out of range.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfpresentationdescriptor-selectstream
     */
    SelectStream(dwDescriptorIndex) {
        result := ComCall(35, this, "uint", dwDescriptorIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deselects a stream in the presentation.
     * @remarks
     * If a stream is deselected, no data is generated for that stream. To select the stream again, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationdescriptor-selectstream">IMFPresentationDescriptor::SelectStream</a>.
     *       
     * 
     * To query whether a stream is selected, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationdescriptor-getstreamdescriptorbyindex">IMFPresentationDescriptor::GetStreamDescriptorByIndex</a>.
     *       
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Integer} dwDescriptorIndex The stream number to deselect, indexed from zero. To find the number of streams in the presentation, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationdescriptor-getstreamdescriptorcount">IMFPresentationDescriptor::GetStreamDescriptorCount</a> method.
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
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dwDescriptorIndex</i> is out of range.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfpresentationdescriptor-deselectstream
     */
    DeselectStream(dwDescriptorIndex) {
        result := ComCall(36, this, "uint", dwDescriptorIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a copy of this presentation descriptor.
     * @remarks
     * This method performs a shallow copy of the presentation descriptor. The stream descriptors are not cloned. Therefore, use caution when modifying the presentation presentation descriptor or its stream descriptors.
     *       
     * 
     * If the original presentation descriptor is from a media source, do not modify the presentation descriptor unless the source is stopped. If you use the presentation descriptor to configure a media sink, do not modify the presentation descriptor after the sink is configured.
     *       
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {IMFPresentationDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of the new presentation descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfpresentationdescriptor-clone
     */
    Clone() {
        result := ComCall(37, this, "ptr*", &ppPresentationDescriptor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFPresentationDescriptor(ppPresentationDescriptor)
    }
}
