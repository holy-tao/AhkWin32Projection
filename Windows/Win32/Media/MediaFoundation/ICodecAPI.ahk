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
     * 
     * @param {Pointer<Guid>} Api 
     * @returns {HRESULT} 
     */
    IsSupported(Api) {
        result := ComCall(3, this, "ptr", Api, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @returns {HRESULT} 
     */
    IsModifiable(Api) {
        result := ComCall(4, this, "ptr", Api, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @param {Pointer<VARIANT>} ValueMin 
     * @param {Pointer<VARIANT>} ValueMax 
     * @param {Pointer<VARIANT>} SteppingDelta 
     * @returns {HRESULT} 
     */
    GetParameterRange(Api, ValueMin, ValueMax, SteppingDelta) {
        result := ComCall(5, this, "ptr", Api, "ptr", ValueMin, "ptr", ValueMax, "ptr", SteppingDelta, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @param {Pointer<VARIANT>} Values 
     * @param {Pointer<UInt32>} ValuesCount 
     * @returns {HRESULT} 
     */
    GetParameterValues(Api, Values, ValuesCount) {
        result := ComCall(6, this, "ptr", Api, "ptr", Values, "uint*", ValuesCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     */
    GetDefaultValue(Api, Value) {
        result := ComCall(7, this, "ptr", Api, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     */
    GetValue(Api, Value) {
        result := ComCall(8, this, "ptr", Api, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     */
    SetValue(Api, Value) {
        result := ComCall(9, this, "ptr", Api, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @param {Pointer} userData 
     * @returns {HRESULT} 
     */
    RegisterForEvent(Api, userData) {
        result := ComCall(10, this, "ptr", Api, "ptr", userData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @returns {HRESULT} 
     */
    UnregisterForEvent(Api) {
        result := ComCall(11, this, "ptr", Api, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetAllDefaults() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Api 
     * @param {Pointer<VARIANT>} Value 
     * @param {Pointer<Guid>} ChangedParam 
     * @param {Pointer<UInt32>} ChangedParamCount 
     * @returns {HRESULT} 
     */
    SetValueWithNotify(Api, Value, ChangedParam, ChangedParamCount) {
        result := ComCall(13, this, "ptr", Api, "ptr", Value, "ptr", ChangedParam, "uint*", ChangedParamCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ChangedParam 
     * @param {Pointer<UInt32>} ChangedParamCount 
     * @returns {HRESULT} 
     */
    SetAllDefaultsWithNotify(ChangedParam, ChangedParamCount) {
        result := ComCall(14, this, "ptr", ChangedParam, "uint*", ChangedParamCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} __MIDL__ICodecAPI0000 
     * @returns {HRESULT} 
     */
    GetAllSettings(__MIDL__ICodecAPI0000) {
        result := ComCall(15, this, "ptr", __MIDL__ICodecAPI0000, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} __MIDL__ICodecAPI0001 
     * @returns {HRESULT} 
     */
    SetAllSettings(__MIDL__ICodecAPI0001) {
        result := ComCall(16, this, "ptr", __MIDL__ICodecAPI0001, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} __MIDL__ICodecAPI0002 
     * @param {Pointer<Guid>} ChangedParam 
     * @param {Pointer<UInt32>} ChangedParamCount 
     * @returns {HRESULT} 
     */
    SetAllSettingsWithNotify(__MIDL__ICodecAPI0002, ChangedParam, ChangedParamCount) {
        result := ComCall(17, this, "ptr", __MIDL__ICodecAPI0002, "ptr", ChangedParam, "uint*", ChangedParamCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
