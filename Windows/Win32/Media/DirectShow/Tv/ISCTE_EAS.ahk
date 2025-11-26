#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IGenericDescriptor.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The ISCTE_EAS interface enables the client to get data from an ATSC emergency alert message (EAS) table.
 * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nn-atscpsipparser-iscte_eas
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISCTE_EAS extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISCTE_EAS
     * @type {Guid}
     */
    static IID => Guid("{1ff544d6-161d-4fae-9faa-4f9f492ae999}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetVersionNumber", "GetSequencyNumber", "GetProtocolVersion", "GetEASEventID", "GetOriginatorCode", "GetEASEventCodeLen", "GetEASEventCode", "GetRawNatureOfActivationTextLen", "GetRawNatureOfActivationText", "GetNatureOfActivationText", "GetTimeRemaining", "GetStartTime", "GetDuration", "GetAlertPriority", "GetDetailsOOBSourceID", "GetDetailsMajor", "GetDetailsMinor", "GetDetailsAudioOOBSourceID", "GetAlertText", "GetRawAlertTextLen", "GetRawAlertText", "GetLocationCount", "GetLocationCodes", "GetExceptionCount", "GetExceptionService", "GetCountOfTableDescriptors", "GetTableDescriptorByIndex", "GetTableDescriptorByTag"]

    /**
     * The Initialize method initializes the object using captured table section data. This method is called internally by the IAtscPsipParser::GetEAS method, so applications typically should not call it.
     * @param {ISectionList} pSectionList Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-isectionlist">ISectionList</a> interface.
     * @param {IMpeg2Data} pMPEGData Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-impeg2data">IMpeg2Data</a> interface of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/mpeg-2-sections-and-tables-filter">MPEG-2 Sections and Tables</a> filter.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_MALFORMED_TABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The EAS table is not well formed.
     * 
     * </td>
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
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "HRESULT")
        return result
    }

    /**
     * The GetVersionNumber method returns the version number for the EAS table.
     * @returns {Integer} Receives the version_number field.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * The GetSequencyNumbermethod returns the sequence number.
     * @returns {Integer} Receives the sequence_number field.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getsequencynumber
     */
    GetSequencyNumber() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * The GetProtocolVersion method returns the protocol version of the EAS table.
     * @returns {Integer} Receives the protocol_version field.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getprotocolversion
     */
    GetProtocolVersion() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * The GetEASEventID method returns the identifier of this emergency event.
     * @returns {Integer} Receives the EAS_Event_ID field.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-geteaseventid
     */
    GetEASEventID() {
        result := ComCall(7, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * The GetOriginatorCode method returns the EAS originator code.
     * @returns {Integer} Receives the EAS_originator_code field.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getoriginatorcode
     */
    GetOriginatorCode() {
        result := ComCall(8, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * The GetEASEventCodeLen method returns the size of the EAS event code.
     * @returns {Integer} Receives the size of the EAS event code, in bytes. To get the event code, allocate a buffer of this size and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iscte_eas-geteaseventcode">ISCTE_EAS::GetEASEventCode</a>.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-geteaseventcodelen
     */
    GetEASEventCodeLen() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * The GetEASEventCode method returns the EAS event code.
     * @returns {Integer} A pointer to a buffer that receives the EAS_event_code field. The caller must allocate the buffer, which must be large enough to hold the event code. To get the required size of the buffer, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iscte_eas-geteaseventcodelen">ISCTE_EAS::GetEASEventCodeLen</a>. The event code consists of ASCII characters.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-geteaseventcode
     */
    GetEASEventCode() {
        result := ComCall(10, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length of the nature_of_activation_text field.
     * @returns {Integer} Receives the size of the nature_of_activation_text field, in bytes. To get the value of the field, allocate a buffer of this size and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getrawnatureofactivationtext">ISCTE_EAS::GetRawNatureOfActivationText</a>.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getrawnatureofactivationtextlen
     */
    GetRawNatureOfActivationTextLen() {
        result := ComCall(11, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the raw nature_of_activation_text field from the EAS table.
     * @returns {Integer} A pointer to a buffer that receives the nature_of_activation_text field. The caller must allocate the buffer. To get the required size of the buffer, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getrawnatureofactivationtextlen">ISCTE_EAS::GetRawNatureOfActivationTextLen</a>. The text is formatted as a Multiple String Structure as defined by ATSC PSIP Standard A/65.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getrawnatureofactivationtext
     */
    GetRawNatureOfActivationText() {
        result := ComCall(12, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * The GetNatureOfActivationText method gets a textual representation of the alert for a specified ISO 639 language code.
     * @param {BSTR} bstrIS0639code The ISO 639 language code.
     * @returns {BSTR} Receives the text as a <b>BSTR</b>. The caller must free the string by calling <b>SysFreeString</b>.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getnatureofactivationtext
     */
    GetNatureOfActivationText(bstrIS0639code) {
        bstrIS0639code := bstrIS0639code is String ? BSTR.Alloc(bstrIS0639code).Value : bstrIS0639code

        pbstrString := BSTR()
        result := ComCall(13, this, "ptr", bstrIS0639code, "ptr", pbstrString, "HRESULT")
        return pbstrString
    }

    /**
     * The GetTimeRemaining method returns the time that remains in the alert message.
     * @returns {Integer} Receives the alert_message_time_remaining field.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-gettimeremaining
     */
    GetTimeRemaining() {
        result := ComCall(14, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * The GetStartTime method returns the starting time of the alert.
     * @returns {Integer} Receives the event_start_time field.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getstarttime
     */
    GetStartTime() {
        result := ComCall(15, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * The GetDuration method returns the expected duration of the alert.
     * @returns {Integer} Receives the event_duration field. The value of the field is the expected duration in minutes, most significant bit first.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getduration
     */
    GetDuration() {
        result := ComCall(16, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * The GetAlertPriority method returns the alert priority.
     * @returns {Integer} Receives the alert_priority field.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getalertpriority
     */
    GetAlertPriority() {
        result := ComCall(17, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * The GetDetailsOOBSourceID method returns the source identifier of the virtual details channel for the emergency alert.
     * @returns {Integer} Receives the details_OOB_source_ID field.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getdetailsoobsourceid
     */
    GetDetailsOOBSourceID() {
        result := ComCall(18, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * The GetDetailsMajor method returns the major channel number for the details channel.
     * @returns {Integer} Receives the details_major_channel_number field.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getdetailsmajor
     */
    GetDetailsMajor() {
        result := ComCall(19, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * The GetDetailsMinor method returns the minor channel number for the details channel.
     * @returns {Integer} Receives the details_minor_channel_number field.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getdetailsminor
     */
    GetDetailsMinor() {
        result := ComCall(20, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * The GetDetailsAudioOOBSourceID method returns the source identifier of the virtual audio channel for the emergency alert.
     * @returns {Integer} Receives the audio_OOB_source_ID field.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getdetailsaudiooobsourceid
     */
    GetDetailsAudioOOBSourceID() {
        result := ComCall(21, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * The GetAlertText method gets the alert text for a specified ISO 639 language code.
     * @param {BSTR} bstrIS0639code The ISO 639 language code.
     * @returns {BSTR} Receives the alert text as a <b>BSTR</b>. The caller must free the string by calling <b>SysFreeString</b>.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getalerttext
     */
    GetAlertText(bstrIS0639code) {
        bstrIS0639code := bstrIS0639code is String ? BSTR.Alloc(bstrIS0639code).Value : bstrIS0639code

        pbstrString := BSTR()
        result := ComCall(22, this, "ptr", bstrIS0639code, "ptr", pbstrString, "HRESULT")
        return pbstrString
    }

    /**
     * Gets the length of the alert_text field.
     * @returns {Integer} Receives the size of the alert_text field, in bytes. To get the value of the field, allocate a buffer of this size and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getrawalerttext">ISCTE_EAS::GetRawAlertText</a>.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getrawalerttextlen
     */
    GetRawAlertTextLen() {
        result := ComCall(23, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the raw alert_text field from the EAS table.
     * @returns {Integer} A pointer to a buffer that receives the alert_text field. The caller must allocate the buffer. To get the required size of the buffer, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getrawalerttextlen">ISCTE_EAS::GetRawAlertTextLen</a>. The text is formatted as a Multiple String Structure as defined by ATSC PSIP Standard A/65.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getrawalerttext
     */
    GetRawAlertText() {
        result := ComCall(24, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * The GetLocationCount method returns the number of locations in the EAS table.
     * @returns {Integer} Receives the location_code_count field.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getlocationcount
     */
    GetLocationCount() {
        result := ComCall(25, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * The GetLocationCodes method returns location codes from the EAS table.
     * @param {Integer} bIndex The zero-based index of the location codes to retrieve. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getlocationcount">ISCTE_EAS::GetLocationCount</a> to get the number of locations.
     * @param {Pointer<Integer>} pbState Receives the state_code field.
     * @param {Pointer<Integer>} pbCountySubdivision Receives the county_subdivision field.
     * @param {Pointer<Integer>} pwCounty Receives the county_code field.
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
     * <dt><b>MPEG2_E_OUT_OF_BOUNDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Index out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_UNINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iscte_eas-initialize">ISCTE_EAS::Initialize</a> method was not called.
     * 
     * </td>
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
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getlocationcodes
     */
    GetLocationCodes(bIndex, pbState, pbCountySubdivision, pwCounty) {
        pbStateMarshal := pbState is VarRef ? "char*" : "ptr"
        pbCountySubdivisionMarshal := pbCountySubdivision is VarRef ? "char*" : "ptr"
        pwCountyMarshal := pwCounty is VarRef ? "ushort*" : "ptr"

        result := ComCall(26, this, "char", bIndex, pbStateMarshal, pbState, pbCountySubdivisionMarshal, pbCountySubdivision, pwCountyMarshal, pwCounty, "HRESULT")
        return result
    }

    /**
     * The GetExceptionCount method returns the number of exception services.
     * @returns {Integer} Receives the exception_count field.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getexceptioncount
     */
    GetExceptionCount() {
        result := ComCall(27, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * The GetExceptionService method returns information about an exception service.
     * @param {Integer} bIndex Zero-based index of the exception service to retrieve. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getexceptioncount">ISCTE_EAS::GetExceptionCount</a> to get the number of exception services.
     * @param {Pointer<Integer>} pbIBRef Receives the in_band_reference flag.
     * @param {Pointer<Integer>} pwFirst If the in_band_reference flag is <b>TRUE</b>, receives the exception_major_channel_number field. Otherwise, receives the exception_OOB_source_ID field.
     * @param {Pointer<Integer>} pwSecond If the in_band_reference flag is <b>TRUE</b>, receives the exception_minor_channel_number field. Otherwise, the value is undefined and this parameter should be ignored.
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
     * <dt><b>MPEG2_E_OUT_OF_BOUNDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Index out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_UNINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iscte_eas-initialize">ISCTE_EAS::Initialize</a> method was not called.
     * 
     * </td>
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
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getexceptionservice
     */
    GetExceptionService(bIndex, pbIBRef, pwFirst, pwSecond) {
        pbIBRefMarshal := pbIBRef is VarRef ? "char*" : "ptr"
        pwFirstMarshal := pwFirst is VarRef ? "ushort*" : "ptr"
        pwSecondMarshal := pwSecond is VarRef ? "ushort*" : "ptr"

        result := ComCall(28, this, "char", bIndex, pbIBRefMarshal, pbIBRef, pwFirstMarshal, pwFirst, pwSecondMarshal, pwSecond, "HRESULT")
        return result
    }

    /**
     * The GetCountOfTableDescriptors method returns the number of descriptors in the EAS table.
     * @returns {Integer} Receives the number of descriptors.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-getcountoftabledescriptors
     */
    GetCountOfTableDescriptors() {
        result := ComCall(29, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * The GetTableDescriptorByIndex method returns a descriptor for the EAS table.
     * @param {Integer} dwIndex The zero-based index of the descriptor to retrieve. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getcountoftabledescriptors">ISCTE_EAS::GetCountOfTableDescriptors</a> method to get the number of table descriptors.
     * @returns {IGenericDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-gettabledescriptorbyindex
     */
    GetTableDescriptorByIndex(dwIndex) {
        result := ComCall(30, this, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * The GetTableDescriptorByTag method searches the EAS table for a descriptor with the specified descriptor tag.
     * @param {Integer} bTag The descriptor tag to search for.
     * @param {Pointer<Integer>} pdwCookie A pointer to a variable that specifies the start position in the descriptor list. This parameter can be <b>NULL</b>. If the value is <b>NULL</b>, the search starts from the first descriptor in the list. Otherwise, the search starts from the position given in *<i>pdwCookie</i>. When the method returns, the <i>pdwCookie</i> parameter contains the position of the next matching descriptor, if any. You can use this parameter to iterate through the descriptor list, looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iscte_eas-gettabledescriptorbytag
     */
    GetTableDescriptorByTag(bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }
}
