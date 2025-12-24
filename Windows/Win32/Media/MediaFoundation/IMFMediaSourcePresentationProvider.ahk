#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides notifications to the sequencer source.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmediasourcepresentationprovider
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSourcePresentationProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaSourcePresentationProvider
     * @type {Guid}
     */
    static IID => Guid("{0e1d600a-c9f3-442d-8c51-a42d2d49452f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ForceEndOfPresentation"]

    /**
     * Notifies the source when playback has reached the end of a segment. For timelines, this corresponds to reaching a mark-out point.
     * @param {IMFPresentationDescriptor} pPresentationDescriptor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of the presentation descriptor for the segment that has ended.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasourcepresentationprovider-forceendofpresentation
     */
    ForceEndOfPresentation(pPresentationDescriptor) {
        result := ComCall(3, this, "ptr", pPresentationDescriptor, "HRESULT")
        return result
    }
}
