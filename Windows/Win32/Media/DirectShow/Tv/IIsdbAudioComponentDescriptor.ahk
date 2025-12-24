#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) audio component descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbaudiocomponentdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbAudioComponentDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbAudioComponentDescriptor
     * @type {Guid}
     */
    static IID => Guid("{679d2002-2425-4be4-a4c7-d6632a574f4d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetStreamContent", "GetComponentType", "GetComponentTag", "GetStreamType", "GetSimulcastGroupTag", "GetESMultiLingualFlag", "GetMainComponentFlag", "GetQualityIndicator", "GetSamplingRate", "GetLanguageCode", "GetLanguageCode2", "GetTextW"]

    /**
     * Gets the tag that identifies an Integrated Services Digital Broadcasting (ISDB) audio component descriptor.
     * @returns {Integer} Receives the tag value. For ISDB audio component descriptors, this value is 0xC4.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) audio component descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the stream_content field from an Integrated Services Digital Broadcasting (ISDB) audio component descriptor. This field contains a code that identifies the descriptor as an ISDB audio component descriptor.
     * @returns {Integer} Receives the stream_content field value. For audio streams, this value is 0x02.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getstreamcontent
     */
    GetStreamContent() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the component_type field from an Integrated Services Digital Broadcasting (ISDB) audio component descriptor. This field identifies the audio component type.
     * @returns {Integer} Receives the component_type field value. See Table 6-43 in Section 6.2.26,  <i>SERVICE INFORMATION FOR DIGITAL
     * BROADCASTING SYSTEM
     * ARIB STANDARD,
     * ARIB STD-B10, Version 4.6</i> for a list of valid component type codes.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getcomponenttype
     */
    GetComponentType() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the component_tag field from an Integrated Services Digital Broadcasting (ISDB) audio component descriptor.
     * @returns {Integer} Receives the component tag.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getcomponenttag
     */
    GetComponentTag() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a code that indicates the stream type from an Integrated Services Digital Broadcasting (ISDB) audio component descriptor.
     * @returns {Integer} Receives the stream type code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getstreamtype
     */
    GetStreamType() {
        result := ComCall(8, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the simulcast_group_tag field from an Integrated Services Digital Broadcasting (ISDB) audio component descriptor. For simulcast components, this field contains the tag that identifies all simulcast components.
     * @returns {Integer} Receives the simulcast group tag. For non-simulcast component, receives 0xFF.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getsimulcastgrouptag
     */
    GetSimulcastGroupTag() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a flag from an Integrated Services Digital Broadcasting (ISDB) audio component descriptor that indicates whether the stream uses ES multilingual mode.
     * @returns {BOOL} Receives 1 if the stream uses ES multilingual mode.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getesmultilingualflag
     */
    GetESMultiLingualFlag() {
        result := ComCall(10, this, "int*", &pfVal := 0, "HRESULT")
        return pfVal
    }

    /**
     * Gets a flag from an Integrated Services Digital Broadcasting (ISDB) audio component descriptor that indicates whether the audio component is the main audio.
     * @returns {BOOL} Receives 1 if the audio component is the main audio or 0 if it is not. In ES simulcast mode, receives 1 if the first audio component is the main audio or 0 if it is not.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getmaincomponentflag
     */
    GetMainComponentFlag() {
        result := ComCall(11, this, "int*", &pfVal := 0, "HRESULT")
        return pfVal
    }

    /**
     * Gets the value of the quality_indicator field from an Integrated Services Digital Broadcasting (ISDB) audio component descriptor. This two-bit field indicates the tone quality mode.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getqualityindicator
     */
    GetQualityIndicator() {
        result := ComCall(12, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the sampling_rate field from a an Integrated Services Digital Broadcasting (ISDB) audio component descriptor. This three-bit field contains a code that indicates the sampling frequency.
     * @returns {Integer} Receives one of the following codes:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved for future use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 16 kHz.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 22.05 kHz.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>011</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 24 kHz.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>101</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 32 kHz.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>110</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 44.1 kHz.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>111</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 48 kHz.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getsamplingrate
     */
    GetSamplingRate() {
        result := ComCall(13, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the three-character ISO 639 language code from an Integrated Services Digital Broadcasting (ISDB) audio component descriptor. If the stream uses ES multilingual mode, this method returns the first language code.
     * @returns {Integer} Pointer to the buffer that receives the language code.  For a list of language codes, refer to <a href="http://www.sil.org/ISO639-3/codes.asp">ISO 639 Code Tables</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getlanguagecode
     */
    GetLanguageCode() {
        result := ComCall(14, this, "char*", &pszCode := 0, "HRESULT")
        return pszCode
    }

    /**
     * In ES multilingual mode, gets the second three-character ISO 639 language code from an ISDB audio component descriptor.
     * @returns {Integer} Pointer to the buffer that receives the language code.  For a list of language codes, refer to <a href="http://www.sil.org/ISO639-3/codes.asp">ISO 639 Code Tables</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getlanguagecode2
     */
    GetLanguageCode2() {
        result := ComCall(15, this, "char*", &pszCode := 0, "HRESULT")
        return pszCode
    }

    /**
     * Gets the component stream description from an Integrated Services Digital Broadcasting (ISDB) audio component descriptor, in Unicode text format,.
     * @param {Integer} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the component stream description. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-gettextw
     */
    GetTextW(convMode) {
        pbstrText := BSTR()
        result := ComCall(16, this, "int", convMode, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }
}
