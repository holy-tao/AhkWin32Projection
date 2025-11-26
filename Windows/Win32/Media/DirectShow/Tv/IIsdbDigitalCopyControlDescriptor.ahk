#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) digital copy control descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbdigitalcopycontroldescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbDigitalCopyControlDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbDigitalCopyControlDescriptor
     * @type {Guid}
     */
    static IID => Guid("{1a28417e-266a-4bb8-a4bd-d782bcfb8161}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetCopyControl", "GetCountOfRecords", "GetRecordCopyControl"]

    /**
     * Gets the tag that identifies an Integrated Services Digital Broadcasting (ISDB) digital copy control descriptor.
     * @returns {Integer} Receives the tag value. For a digital copy control descriptor, this value is 0xC1.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbdigitalcopycontroldescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) digital copy control descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbdigitalcopycontroldescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets copy control data from an Integrated Services Digital Broadcasting (ISDB) digital copy control descriptor.
     * @param {Pointer<Integer>} pbDigitalRecordingControlData 
     * @param {Pointer<Integer>} pbCopyControlType Receives data that defines output control options for digital copying.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Undefined.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Output by encoding to serial interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Undefined.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Output by not encoding to serial interface.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pbAPSControlData Receives data that defines output control options for analog copying when the value of the <i>pbCopyControlType</i> parameter is 01.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Undefined.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Output with pseudosync pulse.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Output with pseudosync pulse + two-line reversed division burst insertion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Output with pseudosync pulse + four-line reversed division burst insertion.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pbMaximumBitrate Receives the maximum trasmission rate for transport stream packets, in units of 250 kbps.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbdigitalcopycontroldescriptor-getcopycontrol
     */
    GetCopyControl(pbDigitalRecordingControlData, pbCopyControlType, pbAPSControlData, pbMaximumBitrate) {
        pbDigitalRecordingControlDataMarshal := pbDigitalRecordingControlData is VarRef ? "char*" : "ptr"
        pbCopyControlTypeMarshal := pbCopyControlType is VarRef ? "char*" : "ptr"
        pbAPSControlDataMarshal := pbAPSControlData is VarRef ? "char*" : "ptr"
        pbMaximumBitrateMarshal := pbMaximumBitrate is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pbDigitalRecordingControlDataMarshal, pbDigitalRecordingControlData, pbCopyControlTypeMarshal, pbCopyControlType, pbAPSControlDataMarshal, pbAPSControlData, pbMaximumBitrateMarshal, pbMaximumBitrate, "HRESULT")
        return result
    }

    /**
     * Gets the number of records in an Integrated Services Digital Broadcasting (ISDB) digital copy control descriptor.
     * @returns {Integer} Receives the number of records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbdigitalcopycontroldescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets copy control data from a specified component in an Integrated Services Digital Broadcasting (ISDB) digital copy control descriptor.
     * @param {Integer} bRecordIndex Specifies the record number for the component,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbdigitalcopycontroldescriptor-getcountofrecords">IIsdbDigitalCompyControlDescriptor::GetCountOfRecords</a>method to get the number of records in the digital copy control descriptor.
     * @param {Pointer<Integer>} pbComponentTag Receives  the tag identifying the component. This value is the same as the 	component tag in the stream
     * identifier descriptor and the component descriptor.
     * @param {Pointer<Integer>} pbDigitalRecordingControlData 
     * @param {Pointer<Integer>} pbCopyControlType Receives data that defines output control options for digital copying.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Undefined.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Output by encoding to serial interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Undefined.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Output by not encoding to serial interface.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pbAPSControlData Receives data that defines output control options for analog copying when the value of the <i>pbCopyControlType</i> parameter is 01.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Undefined.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Output with pseudosync pulse
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Output with pseudosync pulse + two-line reversed division burst insertion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Output with pseudosync pulse + four-line reversed division burst insertion.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pbMaximumBitrate Receives the maximum trasmission rate for transport stream packets, in units of 250 kbps.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbdigitalcopycontroldescriptor-getrecordcopycontrol
     */
    GetRecordCopyControl(bRecordIndex, pbComponentTag, pbDigitalRecordingControlData, pbCopyControlType, pbAPSControlData, pbMaximumBitrate) {
        pbComponentTagMarshal := pbComponentTag is VarRef ? "char*" : "ptr"
        pbDigitalRecordingControlDataMarshal := pbDigitalRecordingControlData is VarRef ? "char*" : "ptr"
        pbCopyControlTypeMarshal := pbCopyControlType is VarRef ? "char*" : "ptr"
        pbAPSControlDataMarshal := pbAPSControlData is VarRef ? "char*" : "ptr"
        pbMaximumBitrateMarshal := pbMaximumBitrate is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "char", bRecordIndex, pbComponentTagMarshal, pbComponentTag, pbDigitalRecordingControlDataMarshal, pbDigitalRecordingControlData, pbCopyControlTypeMarshal, pbCopyControlType, pbAPSControlDataMarshal, pbAPSControlData, pbMaximumBitrateMarshal, pbMaximumBitrate, "HRESULT")
        return result
    }
}
