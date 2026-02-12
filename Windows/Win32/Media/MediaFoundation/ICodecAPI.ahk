#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ICodecAPI interface sets and retrieves settings on an encoder or decoder filter, and defines a generic mechanism for setting properties on a codec.
 * @remarks
 * This interface defines a generic mechanism for setting properties on a codec (encoder or decoder). A <i>codec property</i> is a key/value pair, where the key is a GUID and the value is a <b>VARIANT</b>. The interpretation of the <b>VARIANT</b> data depends on the property GUID. For a list of codec property GUIDs, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/codec-api-properties">Codec API Properties</a>.
 * 
 * <h3><a id="Codec_Profiles"></a><a id="codec_profiles"></a><a id="CODEC_PROFILES"></a>Codec Profiles</h3>
 * Codecs can optionally store profile and capability information in the system registry. This information enables applications to query the device during device enumeration. Default profiles are stored in the following registry key:<pre><b>HKEY_LOCAL_MACHINE</b>
 *    <b>Software</b>
 *       <b>Classes</b>
 *          <b>CLSID</b>
 *             <b><i>Category</i></b>
 *                <b>Profiles</b></pre>Each profile is a registry key whose default string is a text description of the profile. Each value has a GUID name, followed by a string value containing the numeric GUID value. For example:
 * 
 * <div class="code"><span><table>
 * <tr>
 * <th>C++</th>
 * </tr>
 * <tr>
 * <td>
 * <pre>
 *   HLKM\Software\Classes\CLSID\&lt;category&gt;\Profiles\DVD
 *     default "HQ DVD"
 *     REG_SZ {...} = "0"
 *     REG_SZ {...} = "1234"
 * </pre>
 * </td>
 * </tr>
 * </table></span></div>
 * where {...} is a property GUID that the application can map into its user interface. Microsoft is currently considering the definition of a set of standard profiles.
 * 
 * Default codec capabilities are stored under HLKM\Software\Classes\CLSID\&lt;category&gt;\Instance\&lt;Filter CLSID&gt;\Capabilities. Each value has a GUID name, followed by a string value containing the numeric GUID value. For example:
 * 
 * <div class="code"><span><table>
 * <tr>
 * <th>C++</th>
 * </tr>
 * <tr>
 * <td>
 * <pre>
 * HLKM\Software\Classes\CLSID\&lt;category&gt;\Instance\&lt;My DVD encoder&gt;\Capabilities
 *      default "My DVD encoder"
 *      REG_SZ_MULTI {...}
 * </pre>
 * </td>
 * </tr>
 * </table></span></div>
 * where {...} is a property GUID that the application can map into its user interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/icodecapi/nn-icodecapi-icodecapi
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ICodecAPI extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICodecAPI
     * @type {Guid}
     */
    static IID => Guid("{901db4c7-31ce-41a2-85dc-8fa0bf41b8da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSupported", "IsModifiable", "GetParameterRange", "GetParameterValues", "GetDefaultValue", "GetValue", "SetValue", "RegisterForEvent", "UnregisterForEvent", "SetAllDefaults", "SetValueWithNotify", "SetAllDefaultsWithNotify", "GetAllSettings", "SetAllSettings", "SetAllSettingsWithNotify"]

    /**
     * The IsSupported method queries whether a codec supports a given property. (ICodecAPI::IsSupported)
     * @remarks
     * Any errors besides those in the previous table indicate an inability to process the call.
     * 
     * <div class="alert"><b>Note</b>  If the codec does not support the property, the method can return either <b>S_FALSE</b> or <b>E_NOTIMPL</b>. The value <b>E_NOTIMPL</b> is preferred, but earlier documentation listed only <b>S_FALSE</b>, so some codecs might return that value. Applications should explicitly test for the value <b>S_OK</b>.</div>
     * <div> </div>
     * @param {Pointer<Guid>} Api Pointer to a GUID that specifies the property to query. For a list of standard codec properties, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/codec-api-properties">Codec API Properties</a>.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The codec does not support the property.
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
     * The codec supports the property.
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
     * The codec does not support the property.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/icodecapi/nf-icodecapi-icodecapi-issupported
     */
    IsSupported(Api) {
        result := ComCall(3, this, "ptr", Api, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IsModifiable method queries whether a codec property can be changed, given the codec's current configuration. (ICodecAPI::IsModifiable)
     * @remarks
     * Any errors besides those in the previous table indicate an inability to process the call.
     * @param {Pointer<Guid>} Api Pointer to a GUID that specifies the property. For a list of standard codec properties, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/codec-api-properties">Codec API Properties</a>.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of this property cannot be changed.
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
     * The value of this property can be changed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/icodecapi/nf-icodecapi-icodecapi-ismodifiable
     */
    IsModifiable(Api) {
        result := ComCall(4, this, "ptr", Api, "int")
        return result
    }

    /**
     * The GetParameterRange method gets the range of values for a codec property. (ICodecAPI::GetParameterRange)
     * @remarks
     * The valid range for the property is [<i>ValueMin</i>... <i>ValueMax</i>], with increments of <i>SteppingDelta</i>. If a property supports a linear range of values, the property must use one of the following variant types:
     * 
     * <ul>
     * <li>Unsigned types: <b>VT_UI8</b>, <b>VT_UI4</b>, <b>VT_UI2</b>, <b>VT_UI1</b></li>
     * <li>Signed types: <b>VT_I8</b>, <b>VT_I4</b>, <b>VT_I2</b></li>
     * <li>Floating-point types: <b>VT_R8</b>, <b>VT_R4</b></li>
     * </ul>
     * If the property supports a list of values, instead of a range, the method returns  <b>VFW_E_CODECAPI_ENUMERATED</b>. In that case, call <a href="https://docs.microsoft.com/windows/desktop/api/icodecapi/nf-icodecapi-icodecapi-getparametervalues">ICodecAPI::GetParameterValues</a> to get the list of values.
     * @param {Pointer<Guid>} Api Pointer to a GUID that specifies the property to query. For a list of standard codec properties, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/codec-api-properties">Codec API Properties</a>.
     * @param {Pointer<VARIANT>} ValueMin Pointer to a <b>VARIANT</b>  that receives the minimum value of the property. The caller must free the <b>VARIANT</b> by calling <b>VariantClear</b>.
     * @param {Pointer<VARIANT>} ValueMax Pointer to a <b>VARIANT</b>  that receives the maximum value of the property. The caller must free the <b>VARIANT</b> by calling <b>VariantClear</b>.
     * @param {Pointer<VARIANT>} SteppingDelta Pointer to a <b>VARIANT</b>  that receives the stepping delta, which defines the valid increments from <i>ValueMin</i> to <i>ValueMax</i>. The caller must free the <b>VARIANT</b> by calling <b>VariantClear</b>.
     * 
     * If the <b>VARIANT</b> type is VT_EMPTY, any increment is valid.
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
     * <dt><b>VFW_E_CODECAPI_ENUMERATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property supports a list of possible values, not a linear range.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/icodecapi/nf-icodecapi-icodecapi-getparameterrange
     */
    GetParameterRange(Api, ValueMin, ValueMax, SteppingDelta) {
        result := ComCall(5, this, "ptr", Api, "ptr", ValueMin, "ptr", ValueMax, "ptr", SteppingDelta, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetParameterValues method gets the list of possible values for a codec property. (ICodecAPI::GetParameterValues)
     * @remarks
     * If the property supports a range of values, instead of a list, the method returns  <b>VFW_E_CODECAPI_LINEAR_RANGE</b>. In that case, call <a href="https://docs.microsoft.com/windows/desktop/api/icodecapi/nf-icodecapi-icodecapi-getparameterrange">ICodecAPI::GetParameterRange</a> to get the range of values.
     * @param {Pointer<Guid>} Api Pointer to a GUID that specifies the property to query. For a list of standard codec properties, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/codec-api-properties">Codec API Properties</a>.
     * @param {Pointer<Pointer<VARIANT>>} Values Receives a pointer to an array of <b>VARIANT</b> types. The array contains the list of values that the encoder supports for this property. The caller must free each <b>VARIANT</b> by calling <b>VariantClear</b>. The caller must also free the array by calling  <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} ValuesCount Receives the number of elements in the <i>Values</i> array.
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
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_CODECAPI_LINEAR_RANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property supports a range of values, not a list.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/icodecapi/nf-icodecapi-icodecapi-getparametervalues
     */
    GetParameterValues(Api, Values, ValuesCount) {
        ValuesMarshal := Values is VarRef ? "ptr*" : "ptr"
        ValuesCountMarshal := ValuesCount is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", Api, ValuesMarshal, Values, ValuesCountMarshal, ValuesCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetDefaultValue method gets the default value of a codec property. (ICodecAPI::GetDefaultValue)
     * @param {Pointer<Guid>} Api Pointer to a GUID that specifies the property. For a list of standard codec properties, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/codec-api-properties">Codec API Properties</a>.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> that receives the default value. The caller must free the <b>VARIANT</b> by calling <b>VariantClear</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/icodecapi/nf-icodecapi-icodecapi-getdefaultvalue
     */
    GetDefaultValue(Api) {
        Value := VARIANT()
        result := ComCall(7, this, "ptr", Api, "ptr", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Value
    }

    /**
     * The ICodecAPI::GetValue method gets the current value of a codec property.
     * @param {Pointer<Guid>} Api Pointer to a GUID that specifies the property. For a list of standard codec properties, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/codec-api-properties">Codec API Properties</a>.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> that receives the value of the property. The caller must free the <b>VARIANT</b> by calling <b>VariantClear</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/icodecapi/nf-icodecapi-icodecapi-getvalue
     */
    GetValue(Api) {
        Value := VARIANT()
        result := ComCall(8, this, "ptr", Api, "ptr", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Value
    }

    /**
     * The SetValue method sets the value of a codec property. (ICodecAPI::SetValue)
     * @param {Pointer<Guid>} Api Pointer to a GUID that specifies the property to set.
     *           For a list of standard codec properties, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/codec-api-properties">Codec API Properties</a>.
     * @param {Pointer<VARIANT>} Value Pointer to a <b>VARIANT</b> that contains the new value for the property.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property is read-only.
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
     * Invalid property GUID or value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/icodecapi/nf-icodecapi-icodecapi-setvalue
     */
    SetValue(Api, Value) {
        result := ComCall(9, this, "ptr", Api, "ptr", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The RegisterForEvent method registers the application to receive events from the codec. (ICodecAPI::RegisterForEvent)
     * @remarks
     * The application receives an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-codecapi-event">EC_CODECAPI_EVENT</a> event notification whenever the encoder codec sends the event.  To get the event, uses the <a href="https://docs.microsoft.com/windows/desktop/api/control/nn-control-imediaeventex">IMediaEventEx</a> interface.
     * 
     * The <i>lParam2</i> parameter of the event is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-codecapieventdata">CodecAPIEventData</a> structure. This structure can be followed by additional data, depending on the event GUID. The size of this  data is given by the <b>dataLength</b> member.
     * 
     * <table>
     * <tr>
     * <th>GUID</th>
     * <th>Event Data</th>
     * </tr>
     * <tr>
     * <td>CODECAPI_CHANGELISTS</td>
     * <td>An array of GUIDs. Each GUID specifies a codec property whose current value or valid range has changed. The size of the array is <b>dataLength</b> / <c>sizeof(GUID)</c>.</td>
     * </tr>
     * <tr>
     * <td>A property GUID defined in codecapi.h. </td>
     * <td>None.</td>
     * </tr>
     * <tr>
     * <td>Proprietary event GUID.</td>
     * <td>Implementation dependent.</td>
     * </tr>
     * </table>
     *  
     * 
     * If the codec does not support the specified event, the method returns <b>E_NOTIMPL</b>. The codec might support other events.
     * 
     * To disable notifications for an event, call <a href="https://docs.microsoft.com/windows/desktop/api/icodecapi/nf-icodecapi-icodecapi-unregisterforevent">ICodecAPI::UnregisterForEvent</a>.
     * @param {Pointer<Guid>} Api Pointer to a GUID that specifies the event.
     * There are three categories of events:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CODECAPI_CHANGELISTS"></a><a id="codecapi_changelists"></a><dl>
     * <dt><b>CODECAPI_CHANGELISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The codec notifies the application when the properties of the codec change.  The event data is a list of GUIDs for the properties that changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="One_of_the_property_GUIDs_defined_in_codecapi.h.__See_Codec_API_Properties._"></a><a id="one_of_the_property_guids_defined_in_codecapi.h.__see_codec_api_properties._"></a><a id="ONE_OF_THE_PROPERTY_GUIDS_DEFINED_IN_CODECAPI.H.__SEE_CODEC_API_PROPERTIES._"></a><dl>
     * <dt><b>One of the property GUIDs defined in codecapi.h. (See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/codec-api-properties">Codec API Properties</a>.)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The codec notifies the application when the specified  property changes.  Typically, a codec will support this type of notification for a limited set of properties, if any.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="A_proprietary_event_GUID_defined_by_the_codec."></a><a id="a_proprietary_event_guid_defined_by_the_codec."></a><a id="A_PROPRIETARY_EVENT_GUID_DEFINED_BY_THE_CODEC."></a><dl>
     * <dt><b>A proprietary event GUID defined by the codec.</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Implementation dependent.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} userData_ Pointer to caller-defined data. The application receives this pointer in the <i>lParam1</i> event parameter.
     * @returns {HRESULT} This method can return one of these values.
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
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented. The codec does not support event notification, or does not support the event GUID specified in the <i>Api</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/icodecapi/nf-icodecapi-icodecapi-registerforevent
     */
    RegisterForEvent(Api, userData_) {
        result := ComCall(10, this, "ptr", Api, "ptr", userData_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The UnregisterForEvent method unregisters the application for a specified encoder event. (ICodecAPI::UnregisterForEvent)
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/codec-api-reference">Codec API Reference</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/encoder-api">Encoder API</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/icodecapi/nn-icodecapi-icodecapi">ICodecAPI</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/icodecapi/nf-icodecapi-icodecapi-registerforevent">ICodecAPI::RegisterForEvent</a>
     * @param {Pointer<Guid>} Api Pointer to a GUID that specifies the event.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/icodecapi/nf-icodecapi-icodecapi-unregisterforevent
     */
    UnregisterForEvent(Api) {
        result := ComCall(11, this, "ptr", Api, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetAllDefaults method resets all codec properties to their default values. (ICodecAPI::SetAllDefaults)
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/icodecapi/nf-icodecapi-icodecapi-setalldefaults
     */
    SetAllDefaults() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetValueWithNotify method sets a property on a codec and returns a list of other properties that changed as a result. (ICodecAPI::SetValueWithNotify)
     * @remarks
     * Codecs that implement <a href="https://docs.microsoft.com/windows/desktop/api/icodecapi/nn-icodecapi-icodecapi">ICodecAPI</a> are  not required to support this method.
     * @param {Pointer<Guid>} Api Pointer to a GUID that specifies the property to set.
     *           For a list of standard codec properties, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/codec-api-properties">Codec API Properties</a>.
     * @param {Pointer<VARIANT>} Value Pointer to a <b>VARIANT</b>  that contains the new value for the property.
     * @param {Pointer<Pointer<Guid>>} ChangedParam Receives a pointer to an array of GUIDs. The array contains the GUIDs of any properties that changed as a result of this method call. The caller must free the array by calling <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} ChangedParamCount Receives the number of elements in the <i>ChangedParam</i> array.
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
     * The method succeeded.
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
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/icodecapi/nf-icodecapi-icodecapi-setvaluewithnotify
     */
    SetValueWithNotify(Api, Value, ChangedParam, ChangedParamCount) {
        ChangedParamMarshal := ChangedParam is VarRef ? "ptr*" : "ptr"
        ChangedParamCountMarshal := ChangedParamCount is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", Api, "ptr", Value, ChangedParamMarshal, ChangedParam, ChangedParamCountMarshal, ChangedParamCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetAllDefaultsWithNotify method resets all codec properties to their default values, and returns a list of the properties that changed. (ICodecAPI::SetAllDefaultsWithNotify)
     * @remarks
     * Codecs that implement <a href="https://docs.microsoft.com/windows/desktop/api/icodecapi/nn-icodecapi-icodecapi">ICodecAPI</a> are  not required to support this method.
     * @param {Pointer<Pointer<Guid>>} ChangedParam Receives a pointer to an array of GUIDs. The array contains the GUIDs of any properties that changed as a result of this method call. The caller must free the array by calling <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} ChangedParamCount Receives the number of elements in the <i>ChangedParam</i> array.
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
     * The method succeeded.
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
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/icodecapi/nf-icodecapi-icodecapi-setalldefaultswithnotify
     */
    SetAllDefaultsWithNotify(ChangedParam, ChangedParamCount) {
        ChangedParamMarshal := ChangedParam is VarRef ? "ptr*" : "ptr"
        ChangedParamCountMarshal := ChangedParamCount is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, ChangedParamMarshal, ChangedParam, ChangedParamCountMarshal, ChangedParamCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetAllSettings method gets the codec's current properties and writes them to a stream. (ICodecAPI::GetAllSettings)
     * @remarks
     * Codecs that implement <a href="https://docs.microsoft.com/windows/desktop/api/icodecapi/nn-icodecapi-icodecapi">ICodecAPI</a> are  not required to support this method.
     * 
     * To load the properties from the stream back onto the codec, call <a href="https://docs.microsoft.com/windows/desktop/api/icodecapi/nf-icodecapi-icodecapi-setallsettings">ICodecAPI::SetAllSettings</a> or <a href="https://docs.microsoft.com/windows/desktop/api/icodecapi/nf-icodecapi-icodecapi-setallsettingswithnotify">ICodecAPI::SetAllSettingsWithNotify</a>.
     * 
     * The format of the data that is written to the stream depends on the implementation of the codec. There is no standard serialization format.  An application should not attempt to save the properties from one codec and load them on a different codec.
     * @param {IStream} __MIDL__ICodecAPI0000 Pointer to the *IStream* interface of the stream.
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
     * The method succeeded.
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
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/icodecapi/nf-icodecapi-icodecapi-getallsettings
     */
    GetAllSettings(__MIDL__ICodecAPI0000) {
        result := ComCall(15, this, "ptr", __MIDL__ICodecAPI0000, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetAllSettings method reads codec properties from a stream and sets them on the codec. (ICodecAPI::SetAllSettings)
     * @remarks
     * Codecs that implement <a href="https://docs.microsoft.com/windows/desktop/api/icodecapi/nn-icodecapi-icodecapi">ICodecAPI</a> are  not required to support this method.
     * @param {IStream} __MIDL__ICodecAPI0001 Pointer to the <b>IStream</b> interface of the stream.
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
     * The method succeeded.
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
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/icodecapi/nf-icodecapi-icodecapi-setallsettings
     */
    SetAllSettings(__MIDL__ICodecAPI0001) {
        result := ComCall(16, this, "ptr", __MIDL__ICodecAPI0001, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetAllSettingsWithNotify method reads codec properties from a stream, sets them on the codec, and returns a list of the properties that changed. (ICodecAPI::SetAllSettingsWithNotify)
     * @remarks
     * Codecs that implement <a href="https://docs.microsoft.com/windows/desktop/api/icodecapi/nn-icodecapi-icodecapi">ICodecAPI</a> are  not required to support this method.
     * @param {IStream} __MIDL__ICodecAPI0002 Pointer to the <b>IStream</b> interface of the stream.
     * @param {Pointer<Pointer<Guid>>} ChangedParam Receives a pointer to an array of GUIDs. The array contains the GUIDs of any properties that changed as a result of this method call. The caller must free the array by calling <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} ChangedParamCount Receives the number of elements in the <i>ChangedParam</i> array.
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
     * The method succeeded.
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
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/icodecapi/nf-icodecapi-icodecapi-setallsettingswithnotify
     */
    SetAllSettingsWithNotify(__MIDL__ICodecAPI0002, ChangedParam, ChangedParamCount) {
        ChangedParamMarshal := ChangedParam is VarRef ? "ptr*" : "ptr"
        ChangedParamCountMarshal := ChangedParamCount is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "ptr", __MIDL__ICodecAPI0002, ChangedParamMarshal, ChangedParam, ChangedParamCountMarshal, ChangedParamCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
