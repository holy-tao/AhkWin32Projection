#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IEncoderAPI is no longer available for use. (IEncoderAPI)
 * @remarks
 * In the various interface methods, the following GUIDs, defined in uuids.h, are used to indicate which parameter is being set or retrieved.
 * 
 * <table>
 * <tr>
 * <th>Parameter
 *             </th>
 * <th>Description
 *             </th>
 * </tr>
 * <tr>
 * <td>ENCAPIPARAM_BITRATE</td>
 * <td>Specifies the bit rate, in bits per second. In constant bit rate (CBR) mode, the value gives the constant bitrate. In either variable bit rate mode, it gives the average bit rate. The value is a 32-bit unsigned long.</td>
 * </tr>
 * <tr>
 * <td>ENCAPIPARAM_PEAK_BITRATE</td>
 * <td>Specifies the peak bit rate. This parameter is relevant only when <b>ENCAPIPARAM_BITRATE_MODE</b> has been set to <b>VariableBitRatePeak</b>.</td>
 * </tr>
 * <tr>
 * <td>ENCAPIPARAM_BITRATE_MODE</td>
 * <td>Specifies the bit-rate mode, as a <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-videoencoder_bitrate_mode">VIDEOENCODER_BITRATE_MODE</a> enumeration value (32-bit signed long).</td>
 * </tr>
 * </table>
 *  
 * 
 * The following table describes the expected behavior of an encoder under extremely high or low bitrate conditions in the two variable bitrate modes defined in <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-videoencoder_bitrate_mode">VIDEOENCODER_BITRATE_MODE</a>.
 * 
 * <table>
 * <tr>
 * <th>Condition
 *             </th>
 * <th>Mode
 *             </th>
 * <th>Behavior
 *             </th>
 * </tr>
 * <tr>
 * <td>Scene falls to black or there is zero motion</td>
 * <td><b>VariableBitRateAverage</b></td>
 * <td>Over a short period of time (several seconds) the bit rate will fall below the rate specified for the ENCAPIPARAM_BITRATE parameter. But over a four-minute period of time, the encoder will maintain the average rate, if necessary by adding "dummy" bits to the stream.</td>
 * </tr>
 * <tr>
 * <td>Scene falls to black or there is zero motion.</td>
 * <td><b>VariableBitRatePeak</b></td>
 * <td>The bitrate will fall below the expected rate as specified in the value for the ENCAPIPARAM_BITRATE parameter. The rate will stay at that level until a more complicated scene begins.</td>
 * </tr>
 * <tr>
 * <td>The scene is extremely complex.</td>
 * <td><b>VariableBitRateAverage</b></td>
 * <td>For a few seconds the rate will go up. If the scene stays complex, the rate will come back down and the picture will become blocky in order to maintain the average as specified in the value for the ENCAPIPARAM_BITRATE parameter.</td>
 * </tr>
 * <tr>
 * <td>The scene is extremely complex.</td>
 * <td><b>VariableBitRatePeak</b></td>
 * <td>The rate will go up and stay up, possibly above the expected rate as specified in the value for the ENCAPIPARAM_BITRATE parameter, but never above the peak as specified in the ENCAPIPARAM_PEAK_BITRATE parameter.</td>
 * </tr>
 * </table>
 *  
 * 
 * <h3><a id="OCUR_Devices"></a><a id="ocur_devices"></a><a id="OCUR_DEVICES"></a>OCUR Devices</h3>
 * 
 * This interface supports OpenCable Unidirectional Cable Receiver (OCUR) devices. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/ocur-devices">OCUR Devices</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-iencoderapi
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IEncoderAPI extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEncoderAPI
     * @type {Guid}
     */
    static IID => Guid("{70423839-6acc-4b23-b079-21dbf08156a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSupported", "IsAvailable", "GetParameterRange", "GetParameterValues", "GetDefaultValue", "GetValue", "SetValue"]

    /**
     * The IsSupported method queries whether a given parameter is supported.
     * @remarks
     * The method returns S_OK if the encoder recognizes the GUID. To check whether the parameter can be read or modified, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iencoderapi-isavailable">IEncoderAPI::IsAvailable</a> method.
     *       
     * 
     * Any errors besides those in the table above indicate an inability to process the call.
     * @param {Pointer<Guid>} Api Pointer to a GUID that specifies the parameter.
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
     * The encoder supports the parameter.
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
     * The encoder does not support the parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iencoderapi-issupported
     */
    IsSupported(Api) {
        result := ComCall(3, this, "ptr", Api, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * IEncoderAPI is no longer available for use. (IEncoderAPI.IsAvailable)
     * @remarks
     * Any errors besides those in the table above indicate an inability to process the call.
     * @param {Pointer<Guid>} Api Pointer to a GUID that specifies the parameter.
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
     * The parameter can be read and modified. (Set and get operations are supported for this parameter.)
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
     * The parameter cannot be read or modified.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iencoderapi-isavailable
     */
    IsAvailable(Api) {
        result := ComCall(4, this, "ptr", Api, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetParameterRange method retrieves the valid range of values that the parameter supports, in cases where the parameter supports a stepped range as opposed to a list of specific values.
     * @remarks
     * The valid range for the parameter is [<i>ValueMax</i>...<i>ValueMax</i>], with increments of <i>SteppingDelta</i>. If a parameter supports a stepped range of values, it must use one of the following variant types:
     * 
     * <ul>
     * <li>Unsigned types : <b>VT_UI8</b>, <b>VT_UI4</b>, <b>VT_UI2</b>, <b>VT_UI1</b></li>
     * <li>Signed types : <b>VT_I8</b>, <b>VT_I4</b>, <b>VT_I2</b></li>
     * <li>Float types : <b>VT_R8</b>, <b>VT_R4</b></li>
     * </ul>
     * By definition, the parameter will return a specific type.
     *       
     * 
     * Any stepping value is valid. If the range has no stepping delta (that is, you can increment by any value), the encoder should return an empty value (<b>VT_EMPTY</b>) for <i>SteppingDelta</i>.
     *       
     * 
     * If <i>Api</i> equals <b>ENCAPIPARAM_BITRATE_MODE</b>, the method returns <b>E_NOTIMPL</b>, because the bitrate mode constants are a list of specific values.
     * @param {Pointer<Guid>} Api Pointer to a GUID that specifies the parameter.
     * @param {Pointer<VARIANT>} ValueMin Pointer to a <b>VARIANT</b> type that receives the minimum value of the parameter.
     * @param {Pointer<VARIANT>} ValueMax Pointer to a <b>VARIANT</b> type that receives the maximum value of the parameter.
     * @param {Pointer<VARIANT>} SteppingDelta Pointer to a <b>VARIANT</b> type that receives the stepping delta, which defines the valid increments from <i>ValueMin</i> to <i>ValueMax</i>.
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
     * The property supports a list of possible values, not a linear range.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iencoderapi-getparameterrange
     */
    GetParameterRange(Api, ValueMin, ValueMax, SteppingDelta) {
        result := ComCall(5, this, "ptr", Api, "ptr", ValueMin, "ptr", ValueMax, "ptr", SteppingDelta, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetParameterValues method retrieves the list of values supported by the given parameter.
     * @remarks
     * This method returns an array of <b>VARIANT</b> types representing the individual values supported by the parameter. This array is allocated by the callee through <b>CoTaskMemAlloc</b> and placed into the <i>Values</i> parameter. On exit, <i>ValuesCount</i> contains the number of elements in the array. The caller must free the array by calling <b>CoTaskMemFree</b>.
     * @param {Pointer<Guid>} Api Pointer to a GUID that specifies the parameter.
     * @param {Pointer<Pointer<VARIANT>>} Values Address of a pointer to an array that receives the values.
     * @param {Pointer<Integer>} ValuesCount Indicates the number of entries placed into the array.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iencoderapi-getparametervalues
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
     * The GetDefaultValue method retrieves the default value for a parameter, if one exists.
     * @param {Pointer<Guid>} Api Pointer to a GUID that specifies the parameter.
     * @returns {VARIANT} Receives the value for the parameter specified in <i>Api</i>. If <i>Api</i> was specified as ENCAPIPARAM_BITRATE_MODE, then <i>Value</i> will be one of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-videoencoder_bitrate_mode">VIDEOENCODER_BITRATE_MODE</a> constants.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iencoderapi-getdefaultvalue
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
     * The GetValue method retrieves the current value of a specified parameter.
     * @param {Pointer<Guid>} Api Pointer to a GUID that specifies the parameter.
     * @returns {VARIANT} Receives the value for the parameter specified in <i>Api</i>. If <i>Api</i> was specified as ENCAPIPARAM_BITRATE_MODE, then <i>Value</i> will be one of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-videoencoder_bitrate_mode">VIDEOENCODER_BITRATE_MODE</a> constants.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iencoderapi-getvalue
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
     * The SetValue method sets the current value of a parameter.
     * @param {Pointer<Guid>} Api Pointer to a GUID that specifies the parameter.
     * @param {Pointer<VARIANT>} Value Pointer that specifies the value of <i>Api</i>. If <i>Api</i> was specified as <b>ENCAPIPARAM_BITRATE_MODE</b>, then <i>Value</i> must be one of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-videoencoder_bitrate_mode">VIDEOENCODER_BITRATE_MODE</a> constants.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iencoderapi-setvalue
     */
    SetValue(Api, Value) {
        result := ComCall(9, this, "ptr", Api, "ptr", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
