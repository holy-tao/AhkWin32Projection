#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITDetectTone.ahk
#Include .\ITCustomTone.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ITLegacyCallMediaControl.ahk

/**
 * The ITLegacyCallMediaControl2 interface is an extension of the ITLegacyCallMediaControl interface. ITLegacyCallMediaControl2 provides additional methods, primarily for tone detection and generation.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itlegacycallmediacontrol2
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITLegacyCallMediaControl2 extends ITLegacyCallMediaControl{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITLegacyCallMediaControl2
     * @type {Guid}
     */
    static IID => Guid("{57ca332d-7bc2-44f1-a60c-936fe8d7ce73}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GenerateDigits2", "GatherDigits", "DetectTones", "DetectTonesByCollection", "GenerateTone", "GenerateCustomTones", "GenerateCustomTonesByCollection", "CreateDetectToneObject", "CreateCustomToneObject", "GetIDAsVariant"]

    /**
     * The GenerateDigits2 method causes digits to be output on the current call. This method extends the ITLegacyCallMediaControl::GenerateDigits method by adding a duration parameter.
     * @param {BSTR} pDigits A pointer to a <b>BSTR</b> representation of the digits to generate.
     * @param {Integer} DigitMode Indicates the digit mode. Valid values are those from the TAPI 2.<i>x</i>
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_constants</a>.
     * @param {Integer} lDuration Both the duration, in milliseconds, of DTMF digits and pulse, and DTMF interdigit spacing.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pDigits</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALCALLSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call must be in the <i>connected</i> state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itlegacycallmediacontrol2-generatedigits2
     */
    GenerateDigits2(pDigits, DigitMode, lDuration) {
        pDigits := pDigits is String ? BSTR.Alloc(pDigits).Value : pDigits

        result := ComCall(12, this, "ptr", pDigits, "int", DigitMode, "int", lDuration, "HRESULT")
        return result
    }

    /**
     * The GatherDigits method initiates the gathering of digits on the specified call. The application specifies the maximum number of digits to collect.
     * @param {Integer} DigitMode The digit mode(s) to monitor. This parameter specifies one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE</a> constants.
     * @param {Integer} lNumDigits The number of digits to collect. 
     * 
     * 
     * 
     * 
     * If this parameter is zero, the method cancels any digit-gathering in progress, without starting a new digit-gathering attempt. For more information, see the following Remarks section.
     * @param {BSTR} pTerminationDigits Pointer to a <b>BSTR</b> representation of the termination digits. If one of the termination digits in the string is detected, that digit is appended to the buffer, digit collection is terminated, and the <b>TE_GATHERDIGITS</b> event is sent to the application.
     * @param {Integer} lFirstDigitTimeout The length of time, in milliseconds, during which the first digit is expected. If the first digit is not received in this timeframe, digit collection is aborted and a <b>TE_GATHERDIGITS</b> event is sent to the application. The buffer contains only the <b>NULL</b> character, indicating that no digits were received and that the first-digit-timeout terminated digit-gathering. The minimum and maximum timeouts you can specify are found in the AC_GATHERDIGITSMINTIMEOUT and AC_GATHERDIGITSMAXTIMEOUT capabilities.
     * @param {Integer} lInterDigitTimeout The maximum time, in milliseconds, between consecutive digits. If the next digit is not received in this timeframe, digit collection is aborted and a <b>TE_GATHERDIGITS</b> event is sent to the application. The buffer contains only the digits collected up to this point followed by a <b>NULL</b> character, indicating that an interdigit-timeout terminated the digit-gathering. The minimum and maximum timeouts that can be specified are found in the AC_GATHERDIGITSMINTIMEOUT and AC_GATHERDIGITSMAXTIMEOUT capabilities.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pTerminationDigits</i> parameter is not a valid pointer.
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
     * There is not enough memory to allocate the gather digits buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALCALLSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call must be in the <i>connected</i> state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itlegacycallmediacontrol2-gatherdigits
     */
    GatherDigits(DigitMode, lNumDigits, pTerminationDigits, lFirstDigitTimeout, lInterDigitTimeout) {
        pTerminationDigits := pTerminationDigits is String ? BSTR.Alloc(pTerminationDigits).Value : pTerminationDigits

        result := ComCall(13, this, "int", DigitMode, "int", lNumDigits, "ptr", pTerminationDigits, "int", lFirstDigitTimeout, "int", lInterDigitTimeout, "HRESULT")
        return result
    }

    /**
     * The DetectTones method enables and disables the detection of inband tones on the call. Each time a specified tone is detected, a message is sent to the application.
     * @param {Pointer<TAPI_DETECTTONE>} pToneList Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ns-tapi3if-tapi_detecttone">TAPI_DETECTTONE</a> array that specifies the tones to detect. Each tone in the array has an application-defined tag field that is used to identify the individual tones in the list when a tone detection event of type <b>TE_TONEEVENT</b> is reported. For more information, see the following Remarks section.
     * @param {Integer} lNumTones The number of entries in the array specified by the <i>pToneList</i> parameter. This parameter is ignored if <i>pToneList</i> is <b>NULL</b>.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pToneList</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALCALLSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call must be in the <i>connected</i> state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itlegacycallmediacontrol2-detecttones
     */
    DetectTones(pToneList, lNumTones) {
        result := ComCall(14, this, "ptr", pToneList, "int", lNumTones, "HRESULT")
        return result
    }

    /**
     * The DetectTonesByCollection method enables and disables the detection of inband tones on the call. Each time a specified tone is detected, a message is sent to the application.
     * @param {ITCollection2} pDetectToneCollection Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection2">ITCollection2</a> interface containing a collection of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itdetecttone">ITDetectTone</a> interface pointers that represent the tones to monitor. Each tone in the list has an application-defined tag field that is used to identify the individual tones when tone detection is reported by a <b>TE_TONEEVENT</b> event. For more information, see the following Remarks section.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pDetectToneCollection</i> parameter is not a valid pointer.
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
     * There is not enough memory to allocate the tones buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALCALLSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call must be in the <i>connected</i> state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itlegacycallmediacontrol2-detecttonesbycollection
     */
    DetectTonesByCollection(pDetectToneCollection) {
        result := ComCall(15, this, "ptr", pDetectToneCollection, "HRESULT")
        return result
    }

    /**
     * The GenerateTone method generates the specified tone.
     * @param {Integer} ToneMode Indicates the tone mode. The values used are those from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-tapi_tonemode">TAPI_TONEMODE</a> enumeration.
     * @param {Integer} lDuration Both the duration, in milliseconds, of DTMF digits and pulse, and DTMF interdigit spacing.
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
     * Method succeeded.
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
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALCALLSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call must be in the <i>connected</i> state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itlegacycallmediacontrol2-generatetone
     */
    GenerateTone(ToneMode, lDuration) {
        result := ComCall(16, this, "int", ToneMode, "int", lDuration, "HRESULT")
        return result
    }

    /**
     * The GenerateCustomTones method generates the specified custom tone.
     * @param {Pointer<TAPI_CUSTOMTONE>} pToneList Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ns-tapi3if-tapi_customtone">TAPI_CUSTOMTONE</a> array that specifies the tones to generate.
     * @param {Integer} lNumTones The number of entries in the array specified by the <i>pToneList</i> parameter.
     * @param {Integer} lDuration The duration, in milliseconds, during which the tone should be sustained.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itlegacycallmediacontrol2-generatecustomtones
     */
    GenerateCustomTones(pToneList, lNumTones, lDuration) {
        result := ComCall(17, this, "ptr", pToneList, "int", lNumTones, "int", lDuration, "HRESULT")
        return result
    }

    /**
     * The GenerateCustomTonesByCollection method generates the specified custom tone.
     * @param {ITCollection2} pCustomToneCollection Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection2">ITCollection2</a> interface containing a collection of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcustomtone">ITCustomTone</a> interface pointers representing the tone's components. If the collection is a multifrequency tone, the various tones are played simultaneously.
     * @param {Integer} lDuration The duration, in milliseconds, during which the tone should be sustained. A value of zero uses a default duration.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pCustomToneCollection</i> parameter is not a valid pointer.
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
     * There is not enough memory to allocate the tones buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALCALLSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call must be in the <i>connected</i> state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itlegacycallmediacontrol2-generatecustomtonesbycollection
     */
    GenerateCustomTonesByCollection(pCustomToneCollection, lDuration) {
        result := ComCall(18, this, "ptr", pCustomToneCollection, "int", lDuration, "HRESULT")
        return result
    }

    /**
     * The CreateDetectToneObject method creates a detect tone object to use with the DetectTonesByCollection method.
     * @returns {ITDetectTone} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itdetecttone">ITDetectTone</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itlegacycallmediacontrol2-createdetecttoneobject
     */
    CreateDetectToneObject() {
        result := ComCall(19, this, "ptr*", &ppDetectTone := 0, "HRESULT")
        return ITDetectTone(ppDetectTone)
    }

    /**
     * The CreateCustomToneObject method creates a custom tone object to use with the GenerateCustomTonesByCollection method.
     * @returns {ITCustomTone} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcustomtone">ITCustomTone</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itlegacycallmediacontrol2-createcustomtoneobject
     */
    CreateCustomToneObject() {
        result := ComCall(20, this, "ptr*", &ppCustomTone := 0, "HRESULT")
        return ITCustomTone(ppCustomTone)
    }

    /**
     * The GetIDAsVariant method gets the identifier for the device associated with the current call.
     * @param {BSTR} bstrDeviceClass <b>BSTR</b> representing the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapi-device-classes">TAPI device class</a>.
     * @returns {VARIANT} Pointer to a variant array of bytes of type VT_ARRAY | VT_UI1 which contains the identifier for the device specified in <i>bstrDeviceClass</i>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itlegacycallmediacontrol2-getidasvariant
     */
    GetIDAsVariant(bstrDeviceClass) {
        bstrDeviceClass := bstrDeviceClass is String ? BSTR.Alloc(bstrDeviceClass).Value : bstrDeviceClass

        pVarDeviceID := VARIANT()
        result := ComCall(21, this, "ptr", bstrDeviceClass, "ptr", pVarDeviceID, "HRESULT")
        return pVarDeviceID
    }
}
