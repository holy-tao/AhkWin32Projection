#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ICodecAPI interface sets and retrieves settings on an encoder or decoder filter.
 * @remarks
 * 
  * This interface defines a generic mechanism for setting properties on a codec (encoder or decoder). A <i>codec property</i> is a key/value pair, where the key is a GUID and the value is a <b>VARIANT</b>. The interpretation of the <b>VARIANT</b> data depends on the property GUID. For a list of codec property GUIDs, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/codec-api-properties">Codec API Properties</a>.
  * 
  * <h3><a id="Codec_Profiles"></a><a id="codec_profiles"></a><a id="CODEC_PROFILES"></a>Codec Profiles</h3>
  * Codecs can optionally store profile and capability information in the system registry. This information enables applications to query the device during device enumeration. Default profiles are stored in the following registry key:<pre xml:space="preserve"><b>HKEY_LOCAL_MACHINE</b>
  *    <b>Software</b>
  *       <b>Classes</b>
  *          <b>CLSID</b>
  *             <b><i>Category</i></b>
  *                <b>Profiles</b></pre>Each profile is a registry key whose default string is a text description of the profile. Each value has a GUID name, followed by a string value containing the numeric GUID value. For example:
  * 
  * <div class="code"><span codelanguage="ManagedCPlusPlus"><table>
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
  * <div class="code"><span codelanguage="ManagedCPlusPlus"><table>
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-icodecapi
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
     * 
     * @param {Pointer<Guid>} Api 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icodecapi-issupported
     */
    IsSupported(Api) {
        result := ComCall(3, this, "ptr", Api, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icodecapi-ismodifiable
     */
    IsModifiable(Api) {
        result := ComCall(4, this, "ptr", Api, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @param {Pointer<VARIANT>} ValueMin 
     * @param {Pointer<VARIANT>} ValueMax 
     * @param {Pointer<VARIANT>} SteppingDelta 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icodecapi-getparameterrange
     */
    GetParameterRange(Api, ValueMin, ValueMax, SteppingDelta) {
        result := ComCall(5, this, "ptr", Api, "ptr", ValueMin, "ptr", ValueMax, "ptr", SteppingDelta, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @param {Pointer<Pointer<VARIANT>>} Values 
     * @param {Pointer<Integer>} ValuesCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icodecapi-getparametervalues
     */
    GetParameterValues(Api, Values, ValuesCount) {
        ValuesMarshal := Values is VarRef ? "ptr*" : "ptr"
        ValuesCountMarshal := ValuesCount is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", Api, ValuesMarshal, Values, ValuesCountMarshal, ValuesCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icodecapi-getdefaultvalue
     */
    GetDefaultValue(Api, Value) {
        result := ComCall(7, this, "ptr", Api, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icodecapi-getvalue
     */
    GetValue(Api, Value) {
        result := ComCall(8, this, "ptr", Api, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icodecapi-setvalue
     */
    SetValue(Api, Value) {
        result := ComCall(9, this, "ptr", Api, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @param {Pointer} userData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icodecapi-registerforevent
     */
    RegisterForEvent(Api, userData) {
        result := ComCall(10, this, "ptr", Api, "ptr", userData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icodecapi-unregisterforevent
     */
    UnregisterForEvent(Api) {
        result := ComCall(11, this, "ptr", Api, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icodecapi-setalldefaults
     */
    SetAllDefaults() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @param {Pointer<VARIANT>} Value 
     * @param {Pointer<Pointer<Guid>>} ChangedParam 
     * @param {Pointer<Integer>} ChangedParamCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icodecapi-setvaluewithnotify
     */
    SetValueWithNotify(Api, Value, ChangedParam, ChangedParamCount) {
        ChangedParamMarshal := ChangedParam is VarRef ? "ptr*" : "ptr"
        ChangedParamCountMarshal := ChangedParamCount is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", Api, "ptr", Value, ChangedParamMarshal, ChangedParam, ChangedParamCountMarshal, ChangedParamCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Guid>>} ChangedParam 
     * @param {Pointer<Integer>} ChangedParamCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icodecapi-setalldefaultswithnotify
     */
    SetAllDefaultsWithNotify(ChangedParam, ChangedParamCount) {
        ChangedParamMarshal := ChangedParam is VarRef ? "ptr*" : "ptr"
        ChangedParamCountMarshal := ChangedParamCount is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, ChangedParamMarshal, ChangedParam, ChangedParamCountMarshal, ChangedParamCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} __MIDL__ICodecAPI0000 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icodecapi-getallsettings
     */
    GetAllSettings(__MIDL__ICodecAPI0000) {
        result := ComCall(15, this, "ptr", __MIDL__ICodecAPI0000, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} __MIDL__ICodecAPI0001 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icodecapi-setallsettings
     */
    SetAllSettings(__MIDL__ICodecAPI0001) {
        result := ComCall(16, this, "ptr", __MIDL__ICodecAPI0001, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} __MIDL__ICodecAPI0002 
     * @param {Pointer<Pointer<Guid>>} ChangedParam 
     * @param {Pointer<Integer>} ChangedParamCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icodecapi-setallsettingswithnotify
     */
    SetAllSettingsWithNotify(__MIDL__ICodecAPI0002, ChangedParam, ChangedParamCount) {
        ChangedParamMarshal := ChangedParam is VarRef ? "ptr*" : "ptr"
        ChangedParamCountMarshal := ChangedParamCount is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "ptr", __MIDL__ICodecAPI0002, ChangedParamMarshal, ChangedParam, ChangedParamCountMarshal, ChangedParamCount, "HRESULT")
        return result
    }
}
