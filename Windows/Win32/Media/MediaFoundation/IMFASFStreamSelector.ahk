#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Selects streams in an Advanced Systems Format (ASF) file, based on the mutual exclusion information in the ASF header.
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nn-wmcontainer-imfasfstreamselector
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFASFStreamSelector extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFASFStreamSelector
     * @type {Guid}
     */
    static IID => Guid("{d01bad4a-4fa0-4a60-9349-c27e62da9d41}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamCount", "GetOutputCount", "GetOutputStreamCount", "GetOutputStreamNumbers", "GetOutputFromStream", "GetOutputOverride", "SetOutputOverride", "GetOutputMutexCount", "GetOutputMutex", "SetOutputMutexSelection", "GetBandwidthStepCount", "GetBandwidthStep", "BitrateToStepNumber", "SetStreamSelectorFlags"]

    /**
     * Retrieves the number of streams that are in the Advanced Systems Format (ASF) content.
     * @returns {Integer} Receives the number of streams in the content.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamselector-getstreamcount
     */
    GetStreamCount() {
        result := ComCall(3, this, "uint*", &pcStreams := 0, "HRESULT")
        return pcStreams
    }

    /**
     * Retrieves the number of outputs for the Advanced Systems Format (ASF) content.
     * @returns {Integer} Receives the number of outputs.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputcount
     */
    GetOutputCount() {
        result := ComCall(4, this, "uint*", &pcOutputs := 0, "HRESULT")
        return pcOutputs
    }

    /**
     * Retrieves the number of streams associated with an output.
     * @param {Integer} dwOutputNum The output number for which to retrieve the stream count.
     * @returns {Integer} Receives the number of streams associated with the output.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputstreamcount
     */
    GetOutputStreamCount(dwOutputNum) {
        result := ComCall(5, this, "uint", dwOutputNum, "uint*", &pcStreams := 0, "HRESULT")
        return pcStreams
    }

    /**
     * Retrieves the stream numbers for all of the streams that are associated with an output.
     * @param {Integer} dwOutputNum The output number for which to retrieve stream numbers.
     * @returns {Integer} Address of an array that receives the stream numbers associated with the output. The caller allocates the array. The array size must be at least as large as the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputstreamcount">IMFASFStreamSelector::GetOutputStreamCount</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputstreamnumbers
     */
    GetOutputStreamNumbers(dwOutputNum) {
        result := ComCall(6, this, "uint", dwOutputNum, "ushort*", &rgwStreamNumbers := 0, "HRESULT")
        return rgwStreamNumbers
    }

    /**
     * Retrieves the output number associated with a stream.
     * @param {Integer} wStreamNum The stream number for which to retrieve an output number.
     * @returns {Integer} Receives the output number.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputfromstream
     */
    GetOutputFromStream(wStreamNum) {
        result := ComCall(7, this, "ushort", wStreamNum, "uint*", &pdwOutput := 0, "HRESULT")
        return pdwOutput
    }

    /**
     * Retrieves the manual output override selection that is set for a stream.
     * @param {Integer} dwOutputNum Stream number for which to retrieve the output override selection.
     * @returns {Integer} Receives the output override selection. The value is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/ne-wmcontainer-asf_selection_status">ASF_SELECTION_STATUS</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputoverride
     */
    GetOutputOverride(dwOutputNum) {
        result := ComCall(8, this, "uint", dwOutputNum, "int*", &pSelection := 0, "HRESULT")
        return pSelection
    }

    /**
     * Sets the selection status of an output, overriding other selection criteria.
     * @param {Integer} dwOutputNum Output number for which to set selection.
     * @param {Integer} Selection Member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/ne-wmcontainer-asf_selection_status">ASF_SELECTION_STATUS</a> enumeration specifying the level of selection for the output.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamselector-setoutputoverride
     */
    SetOutputOverride(dwOutputNum, Selection) {
        result := ComCall(9, this, "uint", dwOutputNum, "int", Selection, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of mutual exclusion objects associated with an output.
     * @param {Integer} dwOutputNum Output number for which to retrieve the count of mutually exclusive relationships.
     * @returns {Integer} Receives the number of mutual exclusions.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputmutexcount
     */
    GetOutputMutexCount(dwOutputNum) {
        result := ComCall(10, this, "uint", dwOutputNum, "uint*", &pcMutexes := 0, "HRESULT")
        return pcMutexes
    }

    /**
     * Retrieves a mutual exclusion object for an output.
     * @param {Integer} dwOutputNum Output number for which to retrieve a mutual exclusion object.
     * @param {Integer} dwMutexNum Mutual exclusion number. This is an index of mutually exclusive relationships associated with the output. Set to a number between 0, and 1 less than the number of mutual exclusion objects retrieved by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputmutexcount">IMFASFStreamSelector::GetOutputMutexCount</a>.
     * @returns {IUnknown} Receives a pointer to the mutual exclusion object's <b>IUnknown</b> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputmutex
     */
    GetOutputMutex(dwOutputNum, dwMutexNum) {
        result := ComCall(11, this, "uint", dwOutputNum, "uint", dwMutexNum, "ptr*", &ppMutex := 0, "HRESULT")
        return IUnknown(ppMutex)
    }

    /**
     * Selects a mutual exclusion record to use for a mutual exclusion object associated with an output.
     * @param {Integer} dwOutputNum The output number for which to set a stream.
     * @param {Integer} dwMutexNum Index of the mutual exclusion for which to select.
     * @param {Integer} wSelectedRecord Record of the specified mutual exclusion to select.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamselector-setoutputmutexselection
     */
    SetOutputMutexSelection(dwOutputNum, dwMutexNum, wSelectedRecord) {
        result := ComCall(12, this, "uint", dwOutputNum, "uint", dwMutexNum, "ushort", wSelectedRecord, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of bandwidth steps that exist for the content. This method is used for multiple bit rate (MBR) content.
     * @returns {Integer} Receives the number of bandwidth steps.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamselector-getbandwidthstepcount
     */
    GetBandwidthStepCount() {
        result := ComCall(13, this, "uint*", &pcStepCount := 0, "HRESULT")
        return pcStepCount
    }

    /**
     * Retrieves the stream numbers that apply to a bandwidth step. This method is used for multiple bit rate (MBR) content.
     * @param {Integer} dwStepNum Bandwidth step number for which to retrieve information. Set this value to a number between 0, and 1 less than the number of bandwidth steps returned by <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getbandwidthstepcount">IMFASFStreamSelector::GetBandwidthStepCount</a>.
     * @param {Pointer<Integer>} pdwBitrate Receives the bit rate associated with the bandwidth step.
     * @param {Pointer<Integer>} rgwStreamNumbers Address of an array that receives the stream numbers. The caller allocates the array. The array size must be at least as large as the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getstreamcount">IMFASFStreamSelector::GetStreamCount</a> method.
     * @param {Pointer<Integer>} rgSelections Address of an array that receives the selection status of each stream, as an <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/ne-wmcontainer-asf_selection_status">ASF_SELECTION_STATUS</a> value. The members of this array correspond to the members of the <i>rgwStreamNumbers</i> array by index. The caller allocates the array. The array size must be at least as large as the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getstreamcount">IMFASFStreamSelector::GetStreamCount</a> method.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamselector-getbandwidthstep
     */
    GetBandwidthStep(dwStepNum, pdwBitrate, rgwStreamNumbers, rgSelections) {
        pdwBitrateMarshal := pdwBitrate is VarRef ? "uint*" : "ptr"
        rgwStreamNumbersMarshal := rgwStreamNumbers is VarRef ? "ushort*" : "ptr"
        rgSelectionsMarshal := rgSelections is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, "uint", dwStepNum, pdwBitrateMarshal, pdwBitrate, rgwStreamNumbersMarshal, rgwStreamNumbers, rgSelectionsMarshal, rgSelections, "HRESULT")
        return result
    }

    /**
     * Retrieves the index of a bandwidth step that is appropriate for a specified bit rate. This method is used for multiple bit rate (MBR) content.
     * @param {Integer} dwBitrate The bit rate to find a bandwidth step for.
     * @returns {Integer} Receives the step number. Use this number to retrieve information about the step by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getbandwidthstep">IMFASFStreamSelector::GetBandwidthStep</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamselector-bitratetostepnumber
     */
    BitrateToStepNumber(dwBitrate) {
        result := ComCall(15, this, "uint", dwBitrate, "uint*", &pdwStepNum := 0, "HRESULT")
        return pdwStepNum
    }

    /**
     * Sets options for the stream selector.
     * @param {Integer} dwStreamSelectorFlags Bitwise [MFASF_STREAMSELECTOR_FLAGS](./ne-wmcontainer-mfasf_streamselector_flags.md) enumeration specifying the options to use.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamselector-setstreamselectorflags
     */
    SetStreamSelectorFlags(dwStreamSelectorFlags) {
        result := ComCall(16, this, "uint", dwStreamSelectorFlags, "HRESULT")
        return result
    }
}
