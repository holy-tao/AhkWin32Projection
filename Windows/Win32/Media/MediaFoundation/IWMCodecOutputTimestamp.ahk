#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets the time stamp of the next video frame to be decoded.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmcodecoutputtimestamp
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMCodecOutputTimestamp extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMCodecOutputTimestamp
     * @type {Guid}
     */
    static IID => Guid("{b72adf95-7adc-4a72-bc05-577d8ea6bf68}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNextOutputTime"]

    /**
     * Queries the decoder for the time stamp of the upcoming output sample. Use this method if you need to know the time of the sample before calling IMediaObject::ProcessOutput or IMFTransform::ProcessOutput to get the sample.
     * @param {Pointer<Integer>} prtTime Address of a variable that receives the presentation time of the next sample.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmcodecoutputtimestamp-getnextoutputtime
     */
    GetNextOutputTime(prtTime) {
        prtTimeMarshal := prtTime is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, prtTimeMarshal, prtTime, "HRESULT")
        return result
    }
}
