#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.Variant
 * @version v4.0.30319
 */
class Variant {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Calculates the wire size of the VARIANT object, and gets its handle and data.
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<VARIANT>} param2 
     * @returns {Integer} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-variant_usersize
     */
    static VARIANT_UserSize(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLEAUT32.dll\VARIANT_UserSize", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals a VARIANT object into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<VARIANT>} param2 
     * @returns {Pointer<Integer>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
     * 
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pVariant</i> parameter is not valid.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_NULL_REF_POINTER
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pVariant</i> parameter is null.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-variant_usermarshal
     */
    static VARIANT_UserMarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLEAUT32.dll\VARIANT_UserMarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * Unmarshals a VARIANT object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<VARIANT>} param2 
     * @returns {Pointer<Integer>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pVariant</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_BAD_STUB_DATA
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stub data for the buffer size is incorrect.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
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
     * Insufficient memory for this function to perform.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-variant_userunmarshal
     */
    static VARIANT_UserUnmarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLEAUT32.dll\VARIANT_UserUnmarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * Frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<VARIANT>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-variant_userfree
     */
    static VARIANT_UserFree(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLEAUT32.dll\VARIANT_UserFree", param0Marshal, param0, "ptr", param1)
    }

    /**
     * Calculates the wire size of the VARIANT object, and gets its handle and data.
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<VARIANT>} param2 
     * @returns {Integer} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-variant_usersize64
     * @since windows5.1.2600
     */
    static VARIANT_UserSize64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLEAUT32.dll\VARIANT_UserSize64", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals a VARIANT object into the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<VARIANT>} param2 
     * @returns {Pointer<Integer>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
     * 
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pVariant</i> parameter is not valid.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_NULL_REF_POINTER
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pVariant</i> parameter is null.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-variant_usermarshal64
     * @since windows5.1.2600
     */
    static VARIANT_UserMarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLEAUT32.dll\VARIANT_UserMarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * Unmarshals a VARIANT object from the RPC buffer.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<VARIANT>} param2 
     * @returns {Pointer<Integer>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pVariant</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_BAD_STUB_DATA
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stub data for the buffer size is incorrect.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
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
     * Insufficient memory for this function to perform.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-variant_userunmarshal64
     * @since windows5.1.2600
     */
    static VARIANT_UserUnmarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLEAUT32.dll\VARIANT_UserUnmarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * Frees resources on the server side when called by RPC stub files.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<VARIANT>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-variant_userfree64
     * @since windows5.1.2600
     */
    static VARIANT_UserFree64(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLEAUT32.dll\VARIANT_UserFree64", param0Marshal, param0, "ptr", param1)
    }

    /**
     * Converts the MS-DOS representation of time to the date and time representation stored in a variant.
     * @param {Integer} wDosDate The MS-DOS date to convert. The valid range of MS-DOS dates is January 1, 1980, to December 31, 2099, inclusive.
     * @param {Integer} wDosTime The MS-DOS time to convert.
     * @param {Pointer<Float>} pvtime The converted time.
     * @returns {Integer} The function returns TRUE on success and FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-dosdatetimetovarianttime
     */
    static DosDateTimeToVariantTime(wDosDate, wDosTime, pvtime) {
        pvtimeMarshal := pvtime is VarRef ? "double*" : "ptr"

        result := DllCall("OLEAUT32.dll\DosDateTimeToVariantTime", "ushort", wDosDate, "ushort", wDosTime, pvtimeMarshal, pvtime, "int")
        return result
    }

    /**
     * Converts the variant representation of a date and time to MS-DOS date and time values.
     * @param {Float} vtime The variant time to convert.
     * @param {Pointer<Integer>} pwDosDate Receives the converted MS-DOS date.
     * @param {Pointer<Integer>} pwDosTime Receives the converted MS-DOS time
     * @returns {Integer} The function returns TRUE on success and FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varianttimetodosdatetime
     */
    static VariantTimeToDosDateTime(vtime, pwDosDate, pwDosTime) {
        pwDosDateMarshal := pwDosDate is VarRef ? "ushort*" : "ptr"
        pwDosTimeMarshal := pwDosTime is VarRef ? "ushort*" : "ptr"

        result := DllCall("OLEAUT32.dll\VariantTimeToDosDateTime", "double", vtime, pwDosDateMarshal, pwDosDate, pwDosTimeMarshal, pwDosTime, "int")
        return result
    }

    /**
     * Converts a system time to a variant representation.
     * @param {Pointer<SYSTEMTIME>} lpSystemTime The system time.
     * @param {Pointer<Float>} pvtime The variant time.
     * @returns {Integer} The function returns TRUE on success and FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-systemtimetovarianttime
     */
    static SystemTimeToVariantTime(lpSystemTime, pvtime) {
        pvtimeMarshal := pvtime is VarRef ? "double*" : "ptr"

        result := DllCall("OLEAUT32.dll\SystemTimeToVariantTime", "ptr", lpSystemTime, pvtimeMarshal, pvtime, "int")
        return result
    }

    /**
     * Converts the variant representation of time to system time values.
     * @param {Float} vtime The variant time to convert.
     * @param {Pointer<SYSTEMTIME>} lpSystemTime Receives the system time.
     * @returns {Integer} The function returns TRUE on success and FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varianttimetosystemtime
     */
    static VariantTimeToSystemTime(vtime, lpSystemTime) {
        result := DllCall("OLEAUT32.dll\VariantTimeToSystemTime", "double", vtime, "ptr", lpSystemTime, "int")
        return result
    }

    /**
     * Initializes a variant.
     * @remarks
     * 
     * The <b>VariantInit</b> function initializes the VARIANTARG by setting the <b>vt</b> field to VT_EMPTY. Unlike <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a>, this function does not interpret the current contents of the VARIANTARG. Use <b>VariantInit</b> to initialize new local variables of type VARIANTARG (or VARIANT).
     * 
     * 
     * 
     * @param {Pointer<VARIANT>} pvarg The variant to initialize.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-variantinit
     */
    static VariantInit(pvarg) {
        DllCall("OLEAUT32.dll\VariantInit", "ptr", pvarg)
    }

    /**
     * Clears a variant.
     * @param {Pointer<VARIANT>} pvarg The variant to clear.
     * @returns {HRESULT} This function can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_ARRAYISLOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The variant contains an array that is locked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The variant type is not a valid type of variant.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-variantclear
     */
    static VariantClear(pvarg) {
        result := DllCall("OLEAUT32.dll\VariantClear", "ptr", pvarg, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Frees the destination variant and makes a copy of the source variant.
     * @param {Pointer<VARIANT>} pvargDest The destination variant.
     * @param {Pointer<VARIANT>} pvargSrc The source variant.
     * @returns {HRESULT} This function can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_ARRAYISLOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The variant contains an array that is locked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The variant type is not a valid type of variant.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-variantcopy
     */
    static VariantCopy(pvargDest, pvargSrc) {
        result := DllCall("OLEAUT32.dll\VariantCopy", "ptr", pvargDest, "ptr", pvargSrc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Frees the destination variant and makes a copy of the source variant, performing the necessary indirection if the source is specified to be VT_BYREF.
     * @param {Pointer<VARIANT>} pvarDest The destination variant.
     * @param {Pointer<VARIANT>} pvargSrc The source variant.
     * @returns {HRESULT} This function can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_ARRAYISLOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The variant contains an array that is locked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The variant type is not a valid type of variant.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-variantcopyind
     */
    static VariantCopyInd(pvarDest, pvargSrc) {
        result := DllCall("OLEAUT32.dll\VariantCopyInd", "ptr", pvarDest, "ptr", pvargSrc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Converts a variant from one type to another.
     * @param {Pointer<VARIANT>} pvargDest The destination variant. If this is the same as <i>pvarSrc</i>, the variant will be converted in place.
     * @param {Pointer<VARIANT>} pvarSrc The variant to convert.
     * @param {Integer} wFlags Flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIANT_NOVALUEPROP"></a><a id="variant_novalueprop"></a><dl>
     * <dt><b>VARIANT_NOVALUEPROP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prevents the function from attempting to coerce an object to a fundamental type by getting the Value property. Applications should set this flag only if necessary, because it makes their behavior inconsistent with other applications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIANT_ALPHABOOL"></a><a id="variant_alphabool"></a><dl>
     * <dt><b>VARIANT_ALPHABOOL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Converts a VT_BOOL value to a string containing either "True" or "False". 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIANT_NOUSEROVERRIDE"></a><a id="variant_nouseroverride"></a><dl>
     * <dt><b>VARIANT_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For conversions to or from VT_BSTR, passes LOCALE_NOUSEROVERRIDE to the core coercion routines. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIANT_LOCALBOOL"></a><a id="variant_localbool"></a><dl>
     * <dt><b>VARIANT_LOCALBOOL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For conversions from VT_BOOL to VT_BSTR and back, uses the language specified by the locale in use on the local computer. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} vt The type to convert to. If the return code is S_OK, the <b>vt</b> field of the *<i>pvargDest</i> is guaranteed to be equal to this value.
     * @returns {HRESULT} This function can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The variant type is not a valid type of variant.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by <i>pvarSrc</i> does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-variantchangetype
     */
    static VariantChangeType(pvargDest, pvarSrc, wFlags, vt) {
        result := DllCall("OLEAUT32.dll\VariantChangeType", "ptr", pvargDest, "ptr", pvarSrc, "ushort", wFlags, "ushort", vt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Converts a variant from one type to another, using an LCID.
     * @param {Pointer<VARIANT>} pvargDest The destination variant. If this is the same as <i>pvarSrc</i>, the variant will be converted in place.
     * @param {Pointer<VARIANT>} pvarSrc The variant to convert.
     * @param {Integer} lcid The locale identifier. The LCID is useful when the type of the source or destination VARIANTARG is VT_BSTR, VT_DISPATCH, or VT_DATE.
     * @param {Integer} wFlags Flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIANT_NOVALUEPROP"></a><a id="variant_novalueprop"></a><dl>
     * <dt><b>VARIANT_NOVALUEPROP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prevents the function from attempting to coerce an object to a fundamental type by getting the Value property. Applications should set this flag only if necessary, because it makes their behavior inconsistent with other applications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIANT_ALPHABOOL"></a><a id="variant_alphabool"></a><dl>
     * <dt><b>VARIANT_ALPHABOOL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Converts a VT_BOOL value to a string containing either "True" or "False". 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIANT_NOUSEROVERRIDE"></a><a id="variant_nouseroverride"></a><dl>
     * <dt><b>VARIANT_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For conversions to or from VT_BSTR, passes LOCALE_NOUSEROVERRIDE to the core coercion routines. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIANT_LOCALBOOL"></a><a id="variant_localbool"></a><dl>
     * <dt><b>VARIANT_LOCALBOOL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For conversions from VT_BOOL to VT_BSTR and back, uses the language specified by the locale in use on the local computer. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} vt The type to convert to. If the return code is S_OK, the <b>vt</b> field of the *<i>pvargDest</i> is guaranteed to be equal to this value.
     * @returns {HRESULT} This function can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The variant type is not a valid type of variant.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by <i>pvarSrc</i> does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-variantchangetypeex
     */
    static VariantChangeTypeEx(pvargDest, pvarSrc, lcid, wFlags, vt) {
        result := DllCall("OLEAUT32.dll\VariantChangeTypeEx", "ptr", pvargDest, "ptr", pvarSrc, "uint", lcid, "ushort", wFlags, "ushort", vt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a VARIANT structure based on a string resource imbedded in an executable file.
     * @param {HINSTANCE} hinst Type: <b>HINSTANCE</b>
     * 
     * Handle to an instance of the module whose executable file contains the string resource.
     * @param {Integer} id Type: <b>UINT</b>
     * 
     * Integer identifier of the string to be loaded.
     * @param {Pointer<VARIANT>} pvar Type: <b>VARIANT*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initvariantfromresource
     * @since windows5.1.2600
     */
    static InitVariantFromResource(hinst, id, pvar) {
        hinst := hinst is Win32Handle ? NumGet(hinst, "ptr") : hinst

        result := DllCall("PROPSYS.dll\InitVariantFromResource", "ptr", hinst, "uint", id, "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a VARIANT structure with the contents of a buffer.
     * @param {Pointer} pv Type: <b>const VOID*</b>
     * 
     * Pointer to the source buffer.
     * @param {Integer} cb Type: <b>UINT</b>
     * 
     * The length of the buffer, in bytes.
     * @param {Pointer<VARIANT>} pvar Type: <b>VARIANT*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initvariantfrombuffer
     * @since windows5.1.2600
     */
    static InitVariantFromBuffer(pv, cb, pvar) {
        result := DllCall("PROPSYS.dll\InitVariantFromBuffer", "ptr", pv, "uint", cb, "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a VARIANT structure based on a GUID. The structure is initialized as a VT_BSTR type.
     * @param {Pointer<Guid>} guid Type: <b>REFGUID</b>
     * 
     * Reference to the source <b>GUID</b>.
     * @param {Pointer<VARIANT>} pvar Type: <b>VARIANT*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initvariantfromguidasstring
     * @since windows5.1.2600
     */
    static InitVariantFromGUIDAsString(guid, pvar) {
        result := DllCall("PROPSYS.dll\InitVariantFromGUIDAsString", "ptr", guid, "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a VARIANT structure with the contents of a FILETIME structure.
     * @param {Pointer<FILETIME>} pft Type: <b>const FILETIME*</b>
     * 
     * Pointer to date and time information stored in a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @param {Pointer<VARIANT>} pvar Type: <b>VARIANT*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initvariantfromfiletime
     * @since windows5.1.2600
     */
    static InitVariantFromFileTime(pft, pvar) {
        result := DllCall("PROPSYS.dll\InitVariantFromFileTime", "ptr", pft, "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a VARIANT structure with an array of FILETIME structures.
     * @param {Pointer<FILETIME>} prgft Type: <b>const FILETIME*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structures.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * The number of elements in the array pointed to by <i>prgft</i>.
     * @param {Pointer<VARIANT>} pvar Type: <b>VARIANT*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initvariantfromfiletimearray
     * @since windows5.1.2600
     */
    static InitVariantFromFileTimeArray(prgft, cElems, pvar) {
        result := DllCall("PROPSYS.dll\InitVariantFromFileTimeArray", "ptr", prgft, "uint", cElems, "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a VARIANT structure with a value stored in another VARIANT structure.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * Index of one of the source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure elements.
     * @param {Pointer<VARIANT>} pvar Type: <b>VARIANT*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initvariantfromvariantarrayelem
     * @since windows5.1.2600
     */
    static InitVariantFromVariantArrayElem(varIn, iElem, pvar) {
        result := DllCall("PROPSYS.dll\InitVariantFromVariantArrayElem", "ptr", varIn, "uint", iElem, "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a VARIANT structure from an array of Boolean values.
     * @param {Pointer<BOOL>} prgf Type: <b>const BOOL*</b>
     * 
     * Pointer to source array of Boolean values.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * The number of elements in the array.
     * @param {Pointer<VARIANT>} pvar Type: <b>VARIANT*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initvariantfrombooleanarray
     * @since windows5.1.2600
     */
    static InitVariantFromBooleanArray(prgf, cElems, pvar) {
        prgfMarshal := prgf is VarRef ? "int*" : "ptr"

        result := DllCall("PROPSYS.dll\InitVariantFromBooleanArray", prgfMarshal, prgf, "uint", cElems, "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a VARIANT structure with an array of 16-bit integer values.
     * @param {Pointer<Integer>} prgn Type: <b>const SHORT*</b>
     * 
     * Pointer to the source array of <b>SHORT</b> values.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * The number of elements in the array pointed to by <i>prgn</i>.
     * @param {Pointer<VARIANT>} pvar Type: <b>VARIANT*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initvariantfromint16array
     * @since windows5.1.2600
     */
    static InitVariantFromInt16Array(prgn, cElems, pvar) {
        prgnMarshal := prgn is VarRef ? "short*" : "ptr"

        result := DllCall("PROPSYS.dll\InitVariantFromInt16Array", prgnMarshal, prgn, "uint", cElems, "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a VARIANT structure with an array of unsigned 16-bit integer values.
     * @param {Pointer<Integer>} prgn Type: <b>const USHORT*</b>
     * 
     * Pointer to the source array of <b>USHORT</b> values.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * The number of elements in the array pointed to by <i>prgn</i>.
     * @param {Pointer<VARIANT>} pvar Type: <b>VARIANT*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initvariantfromuint16array
     * @since windows5.1.2600
     */
    static InitVariantFromUInt16Array(prgn, cElems, pvar) {
        prgnMarshal := prgn is VarRef ? "ushort*" : "ptr"

        result := DllCall("PROPSYS.dll\InitVariantFromUInt16Array", prgnMarshal, prgn, "uint", cElems, "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a VARIANT structure with an array of 32-bit integer values.
     * @param {Pointer<Integer>} prgn Type: <b>const LONG*</b>
     * 
     * Pointer to the source array of <b>LONG</b> values.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * The number of elements in the array pointed to by <i>prgn</i>.
     * @param {Pointer<VARIANT>} pvar Type: <b>VARIANT*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initvariantfromint32array
     * @since windows5.1.2600
     */
    static InitVariantFromInt32Array(prgn, cElems, pvar) {
        prgnMarshal := prgn is VarRef ? "int*" : "ptr"

        result := DllCall("PROPSYS.dll\InitVariantFromInt32Array", prgnMarshal, prgn, "uint", cElems, "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a VARIANT structure with an array of unsigned 32-bit integer values.
     * @param {Pointer<Integer>} prgn Type: <b>const ULONG*</b>
     * 
     * Pointer to the source array of <b>ULONG</b> values.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * The number of elements in the array pointed to by <i>prgn</i>.
     * @param {Pointer<VARIANT>} pvar Type: <b>VARIANT*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initvariantfromuint32array
     * @since windows5.1.2600
     */
    static InitVariantFromUInt32Array(prgn, cElems, pvar) {
        prgnMarshal := prgn is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\InitVariantFromUInt32Array", prgnMarshal, prgn, "uint", cElems, "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a VARIANT structure with an array of 64-bit integer values.
     * @param {Pointer<Integer>} prgn Type: <b>const LONGLONG*</b>
     * 
     * Pointer to the source array of <b>LONGLONG</b> values.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * The number of elements in the array pointed to by <i>prgn</i>.
     * 
     * The number of array elements.
     * @param {Pointer<VARIANT>} pvar Type: <b>VARIANT*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initvariantfromint64array
     * @since windows5.1.2600
     */
    static InitVariantFromInt64Array(prgn, cElems, pvar) {
        prgnMarshal := prgn is VarRef ? "int64*" : "ptr"

        result := DllCall("PROPSYS.dll\InitVariantFromInt64Array", prgnMarshal, prgn, "uint", cElems, "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a VARIANT structure with an array of unsigned 64-bit integer values.
     * @param {Pointer<Integer>} prgn Type: <b>const ULONGLONG*</b>
     * 
     * Pointer to the source array of <b>ULONGLONG</b> values.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * The number of elements in the array pointed to by <i>prgn</i>.
     * @param {Pointer<VARIANT>} pvar Type: <b>VARIANT*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initvariantfromuint64array
     * @since windows5.1.2600
     */
    static InitVariantFromUInt64Array(prgn, cElems, pvar) {
        prgnMarshal := prgn is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\InitVariantFromUInt64Array", prgnMarshal, prgn, "uint", cElems, "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a VARIANT structure with an array of values of type DOUBLE.
     * @param {Pointer<Float>} prgn Type: <b>const DOUBLE*</b>
     * 
     * Pointer to the source array of DOUBLE values.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * The number of elements in the array pointed to by <i>prgn</i>.
     * @param {Pointer<VARIANT>} pvar Type: <b>VARIANT*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initvariantfromdoublearray
     * @since windows5.1.2600
     */
    static InitVariantFromDoubleArray(prgn, cElems, pvar) {
        prgnMarshal := prgn is VarRef ? "double*" : "ptr"

        result := DllCall("PROPSYS.dll\InitVariantFromDoubleArray", prgnMarshal, prgn, "uint", cElems, "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a VARIANT structure with an array of strings.
     * @param {Pointer<PWSTR>} prgsz Type: <b>PCWSTR*</b>
     * 
     * Pointer to an array of strings.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * The number of elements in the array pointed to by <i>prgsz</i>.
     * @param {Pointer<VARIANT>} pvar Type: <b>VARIANT*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initvariantfromstringarray
     * @since windows5.1.2600
     */
    static InitVariantFromStringArray(prgsz, cElems, pvar) {
        prgszMarshal := prgsz is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\InitVariantFromStringArray", prgszMarshal, prgsz, "uint", cElems, "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts a BOOL value from a VARIANT structure. If no value exists, then the specified default value is returned.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @param {BOOL} fDefault Type: <b>BOOL</b>
     * 
     * The default value for use where no extractable value exists.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns the extracted <b>BOOL</b> value; otherwise, the default value specified in <i>fDefault</i>.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttobooleanwithdefault
     * @since windows5.1.2600
     */
    static VariantToBooleanWithDefault(varIn, fDefault) {
        result := DllCall("PROPSYS.dll\VariantToBooleanWithDefault", "ptr", varIn, "int", fDefault, "int")
        return result
    }

    /**
     * Extracts an Int16 property value of a variant structure. If no value exists, then the specified default value is returned.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Integer} iDefault Type: <b>SHORT</b>
     * 
     * Specifies default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>SHORT</b>
     * 
     * Returns the extracted <b>Int16</b> value, or default.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttoint16withdefault
     * @since windows5.1.2600
     */
    static VariantToInt16WithDefault(varIn, iDefault) {
        result := DllCall("PROPSYS.dll\VariantToInt16WithDefault", "ptr", varIn, "short", iDefault, "short")
        return result
    }

    /**
     * Extracts an unsigned Int16 property value of a variant structure. If no value exists, then the specified default value is returned.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Integer} uiDefault Type: <b>USHORT</b>
     * 
     * Specifies default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>USHORT</b>
     * 
     * Returns extracted unsigned <b>Int16</b> value, or default.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttouint16withdefault
     * @since windows5.1.2600
     */
    static VariantToUInt16WithDefault(varIn, uiDefault) {
        result := DllCall("PROPSYS.dll\VariantToUInt16WithDefault", "ptr", varIn, "ushort", uiDefault, "ushort")
        return result
    }

    /**
     * Extracts an Int32 property value of a variant structure. If no value exists, then the specified default value is returned.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Integer} lDefault Type: <b>LONG</b>
     * 
     * Specifies default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>LONG</b>
     * 
     * Returns the extracted Int32 value, or default.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttoint32withdefault
     * @since windows5.1.2600
     */
    static VariantToInt32WithDefault(varIn, lDefault) {
        result := DllCall("PROPSYS.dll\VariantToInt32WithDefault", "ptr", varIn, "int", lDefault, "int")
        return result
    }

    /**
     * Extracts an unsigned Int32 property value of a variant structure. If no value currently exists, then the specified default value is returned.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Integer} ulDefault Type: <b>ULONG</b>
     * 
     * Specifies default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>ULONG</b>
     * 
     * Returns extracted unsigned <b>Int32</b> value, or default.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttouint32withdefault
     * @since windows5.1.2600
     */
    static VariantToUInt32WithDefault(varIn, ulDefault) {
        result := DllCall("PROPSYS.dll\VariantToUInt32WithDefault", "ptr", varIn, "uint", ulDefault, "uint")
        return result
    }

    /**
     * Extracts an Int64 property value of a variant structure. If no value exists, then the specified default value is returned.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Integer} llDefault Type: <b>LONGLONG</b>
     * 
     * Specifies default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>LONGLONG</b>
     * 
     * Returns extracted <b>Int64</b> value, or default.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttoint64withdefault
     * @since windows5.1.2600
     */
    static VariantToInt64WithDefault(varIn, llDefault) {
        result := DllCall("PROPSYS.dll\VariantToInt64WithDefault", "ptr", varIn, "int64", llDefault, "int64")
        return result
    }

    /**
     * Extracts an unsigned Int64 property value of a variant structure. If no value currently exists, then the specified default value is returned.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Integer} ullDefault Type: <b>ULONGLONG</b>
     * 
     * Specifies default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>ULONGLONG</b>
     * 
     * Returns the extracted unsigned <b>Int64</b> value, or a default.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttouint64withdefault
     * @since windows5.1.2600
     */
    static VariantToUInt64WithDefault(varIn, ullDefault) {
        result := DllCall("PROPSYS.dll\VariantToUInt64WithDefault", "ptr", varIn, "uint", ullDefault, "uint")
        return result
    }

    /**
     * Extracts a DOUBLE value from a VARIANT structure. If no value exists, then the specified default value is returned.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @param {Float} dblDefault Type: <b>DOUBLE</b>
     * 
     * The default value for use where no extractable value exists.
     * @returns {Float} Type: <b>DOUBLE</b>
     * 
     * Returns the extracted <b>double</b> value; otherwise, the default value specified in <i>dblDefault</i>.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttodoublewithdefault
     * @since windows5.1.2600
     */
    static VariantToDoubleWithDefault(varIn, dblDefault) {
        result := DllCall("PROPSYS.dll\VariantToDoubleWithDefault", "ptr", varIn, "double", dblDefault, "double")
        return result
    }

    /**
     * Extracts the string property value of a variant structure. If no value exists, then the specified default value is returned.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {PWSTR} pszDefault Type: <b>LPCWSTR</b>
     * 
     * Pointer to the default Unicode string property value, for use where no value currently exists.
     * @returns {PWSTR} Type: <b>PCWSTR</b>
     * 
     * Returns the extracted string value, or default.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttostringwithdefault
     * @since windows5.1.2600
     */
    static VariantToStringWithDefault(varIn, pszDefault) {
        pszDefault := pszDefault is String ? StrPtr(pszDefault) : pszDefault

        result := DllCall("PROPSYS.dll\VariantToStringWithDefault", "ptr", varIn, "ptr", pszDefault, "ptr")
        return result
    }

    /**
     * Extracts the value of a Boolean property from a VARIANT structure. If no value can be extracted, then a default value is assigned.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * When this function returns, contains the extracted value if one exists; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttoboolean
     * @since windows5.1.2600
     */
    static VariantToBoolean(varIn) {
        result := DllCall("PROPSYS.dll\VariantToBoolean", "ptr", varIn, "int*", &pfRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfRet
    }

    /**
     * Extracts the Int16 property value of a variant structure. If no value can be extracted, then a default value is assigned by this function.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @returns {Integer} Type: <b>SHORT*</b>
     * 
     * Pointer to the extracted property value if one exists; otherwise, 0.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttoint16
     * @since windows5.1.2600
     */
    static VariantToInt16(varIn) {
        result := DllCall("PROPSYS.dll\VariantToInt16", "ptr", varIn, "short*", &piRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return piRet
    }

    /**
     * Extracts an unsigned Int16 property value of a variant structure. If no value can be extracted, then a default value is assigned by this function.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @returns {Integer} Type: <b>USHORT*</b>
     * 
     * Pointer to the extracted property value if one exists; otherwise, 0.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttouint16
     * @since windows5.1.2600
     */
    static VariantToUInt16(varIn) {
        result := DllCall("PROPSYS.dll\VariantToUInt16", "ptr", varIn, "ushort*", &puiRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puiRet
    }

    /**
     * Extracts an Int32 property value of a variant structure. If no value can be extracted, then a default value is assigned.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @returns {Integer} Type: <b>LONG*</b>
     * 
     * Pointer to the extracted property value if one exists; otherwise, 0.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttoint32
     * @since windows5.1.2600
     */
    static VariantToInt32(varIn) {
        result := DllCall("PROPSYS.dll\VariantToInt32", "ptr", varIn, "int*", &plRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plRet
    }

    /**
     * Extracts unsigned Int32 property value of a variant structure. If no value can be extracted, then a default value is assigned.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * Pointer to the extracted property value if one exists; otherwise, 0.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttouint32
     * @since windows5.1.2600
     */
    static VariantToUInt32(varIn) {
        result := DllCall("PROPSYS.dll\VariantToUInt32", "ptr", varIn, "uint*", &pulRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulRet
    }

    /**
     * Extracts an Int64 property value of a variant structure. If no value can be extracted, then a default value is assigned.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @returns {Integer} Type: <b>LONGLONG*</b>
     * 
     * Pointer to the extracted property value if one exists; otherwise, 0.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttoint64
     * @since windows5.1.2600
     */
    static VariantToInt64(varIn) {
        result := DllCall("PROPSYS.dll\VariantToInt64", "ptr", varIn, "int64*", &pllRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pllRet
    }

    /**
     * Extracts unsigned Int64 property value of a variant structure. If no value can be extracted, then a default value is assigned.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @returns {Integer} Type: <b>ULONGLONG*</b>
     * 
     * Pointer to the extracted property value if one exists; otherwise, 0.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttouint64
     * @since windows5.1.2600
     */
    static VariantToUInt64(varIn) {
        result := DllCall("PROPSYS.dll\VariantToUInt64", "ptr", varIn, "uint*", &pullRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pullRet
    }

    /**
     * Extracts a DOUBLE value from a VARIANT structure. If no value can be extracted, then a default value is assigned.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {Float} Type: <b>DOUBLE*</b>
     * 
     * When this function returns, contains the extracted value if one exists; otherwise, 0.0.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttodouble
     * @since windows5.1.2600
     */
    static VariantToDouble(varIn) {
        result := DllCall("PROPSYS.dll\VariantToDouble", "ptr", varIn, "double*", &pdblRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdblRet
    }

    /**
     * Extracts the contents of a buffer stored in a VARIANT structure of type VT_ARRRAY | VT_UI1.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @param {Pointer} pv Type: <b>VOID*</b>
     * 
     * Pointer to a buffer of length <i>cb</i> bytes. When this function returns, contains the first <i>cb</i> bytes of the extracted buffer value.
     * @param {Integer} cb Type: <b>UINT</b>
     * 
     * The size of the <i>pv</i> buffer, in bytes. The buffer should be the same size as the data to be extracted, or smaller.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values:
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
     * Data successfully extracted.
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
     * The <a href="/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> was not of type VT_ARRRAY | VT_UI1.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> buffer value had fewer than <i>cb</i> bytes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttobuffer
     * @since windows5.1.2600
     */
    static VariantToBuffer(varIn, pv, cb) {
        result := DllCall("PROPSYS.dll\VariantToBuffer", "ptr", varIn, "ptr", pv, "uint", cb, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts a GUID property value of a variant structure.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Pointer<Guid>} pguid Type: <b>GUID*</b>
     * 
     * Pointer to the extracted property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttoguid
     * @since windows5.1.2600
     */
    static VariantToGUID(varIn, pguid) {
        result := DllCall("PROPSYS.dll\VariantToGUID", "ptr", varIn, "ptr", pguid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts the variant value of a variant structure to a string. If no value can be extracted, then a default value is assigned.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {PWSTR} pszBuf Type: <b>PWSTR</b>
     * 
     * Pointer to the extracted property value if one exists; otherwise, empty.
     * @param {Integer} cchBuf Type: <b>UINT</b>
     * 
     * Specifies string length, in characters.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttostring
     * @since windows5.1.2600
     */
    static VariantToString(varIn, pszBuf, cchBuf) {
        pszBuf := pszBuf is String ? StrPtr(pszBuf) : pszBuf

        result := DllCall("PROPSYS.dll\VariantToString", "ptr", varIn, "ptr", pszBuf, "uint", cchBuf, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts the variant value of a variant structure to a newly-allocated string. If no value can be extracted, then a default value is assigned.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @returns {PWSTR} Type: <b>PWSTR</b>
     * 
     * Pointer to the extracted property value if one exists; otherwise, empty.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttostringalloc
     * @since windows5.1.2600
     */
    static VariantToStringAlloc(varIn) {
        result := DllCall("PROPSYS.dll\VariantToStringAlloc", "ptr", varIn, "ptr*", &ppszBuf := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszBuf
    }

    /**
     * Extracts a date and time value in Microsoft MS-DOS format from a VARIANT structure.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @param {Pointer<Integer>} pwDate Type: <b>WORD*</b>
     * 
     * When this function returns, contains the extracted <b>WORD</b> that represents a MS-DOS date.
     * @param {Pointer<Integer>} pwTime Type: <b>WORD*</b>
     * 
     * When this function returns, contains the extracted contains the extracted <b>WORD</b> that represents a MS-DOS time.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttodosdatetime
     * @since windows5.1.2600
     */
    static VariantToDosDateTime(varIn, pwDate, pwTime) {
        pwDateMarshal := pwDate is VarRef ? "ushort*" : "ptr"
        pwTimeMarshal := pwTime is VarRef ? "ushort*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToDosDateTime", "ptr", varIn, pwDateMarshal, pwDate, pwTimeMarshal, pwTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts a FILETIME structure from a variant structure.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Integer} stfOut Type: <b>PSTIME_FLAGS</b>
     * 
     * Specifies one of the following time flags:
     * @param {Pointer<FILETIME>} pftOut Type: <b>FILETIME*</b>
     * 
     * Pointer to the extracted <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttofiletime
     * @since windows5.1.2600
     */
    static VariantToFileTime(varIn, stfOut, pftOut) {
        result := DllCall("PROPSYS.dll\VariantToFileTime", "ptr", varIn, "int", stfOut, "ptr", pftOut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the element count of a variant structure.
     * @param {Pointer<VARIANT>} varIn Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @returns {Integer} Type: <b>ULONG</b>
     * 
     * Returns the element count for values of type VT_ARRAY; otherwise, returns 1.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-variantgetelementcount
     * @since windows5.1.2600
     */
    static VariantGetElementCount(varIn) {
        result := DllCall("PROPSYS.dll\VariantGetElementCount", "ptr", varIn, "uint")
        return result
    }

    /**
     * Extracts an array of Boolean values from a VARIANT structure.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @param {Pointer<BOOL>} prgf Type: <b>BOOL*</b>
     * 
     * Pointer to a buffer that contains <i>crgn</i> Boolean values. When this function returns, the buffer has been initialized with *<i>pcElem</i> <b>BOOL</b> elements extracted from the source  <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * The number of elements in the buffer pointed to by <i>prgf</i>.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains a pointer to the count of <b>BOOL</b> elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The source <a href="/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> contained more than <i>crgn</i> values.
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
     * The <a href="/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttobooleanarray
     * @since windows5.1.2600
     */
    static VariantToBooleanArray(var, prgf, crgn, pcElem) {
        prgfMarshal := prgf is VarRef ? "int*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToBooleanArray", "ptr", var, prgfMarshal, prgf, "uint", crgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a vector structure into an Int16 array.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Pointer<Integer>} prgn Type: <b>SHORT*</b>
     * 
     * Pointer to the <b>Int16</b> data extracted from source variant structure.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Specifies <b>Int16</b> array size.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * Pointer to the count of <b>Int16</b> elements extracted from source variant structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttoint16array
     * @since windows5.1.2600
     */
    static VariantToInt16Array(var, prgn, crgn, pcElem) {
        prgnMarshal := prgn is VarRef ? "short*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToInt16Array", "ptr", var, prgnMarshal, prgn, "uint", crgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a vector structure into an unsigned Int16 array.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Pointer<Integer>} prgn Type: <b>USHORT*</b>
     * 
     * Pointer to the unsigned <b>Int16</b> data extracted from source variant structure.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Specifies unsigned <b>Int16</b> array size.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * Pointer to the count of unsigned <b>Int16</b> elements extracted from source variant structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttouint16array
     * @since windows5.1.2600
     */
    static VariantToUInt16Array(var, prgn, crgn, pcElem) {
        prgnMarshal := prgn is VarRef ? "ushort*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToUInt16Array", "ptr", var, prgnMarshal, prgn, "uint", crgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a vector structure into an Int32 array.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Pointer<Integer>} prgn Type: <b>LONG*</b>
     * 
     * Pointer to the <b>Int32</b> data extracted from source variant structure.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Specifies <b>Int32</b> array size.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * Pointer to the count of <b>Int32</b> elements extracted from source variant structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttoint32array
     * @since windows5.1.2600
     */
    static VariantToInt32Array(var, prgn, crgn, pcElem) {
        prgnMarshal := prgn is VarRef ? "int*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToInt32Array", "ptr", var, prgnMarshal, prgn, "uint", crgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a vector structure into an unsigned Int32 array.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Pointer<Integer>} prgn Type: <b>ULONG*</b>
     * 
     * Pointer to the unsigned <b>Int32</b> data extracted from source variant structure.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Specifies unsigned <b>Int32</b> array size.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * Pointer to the count of unsigned <b>Int32</b> elements extracted from source variant structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttouint32array
     * @since windows5.1.2600
     */
    static VariantToUInt32Array(var, prgn, crgn, pcElem) {
        prgnMarshal := prgn is VarRef ? "uint*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToUInt32Array", "ptr", var, prgnMarshal, prgn, "uint", crgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a vector structure into an Int64 array.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Pointer<Integer>} prgn Type: <b>LONGLONG*</b>
     * 
     * Pointer to the Int64 data extracted from source variant structure.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Specifies Int64 array size.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * Pointer to the count of Int64 elements extracted from source variant structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttoint64array
     * @since windows5.1.2600
     */
    static VariantToInt64Array(var, prgn, crgn, pcElem) {
        prgnMarshal := prgn is VarRef ? "int64*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToInt64Array", "ptr", var, prgnMarshal, prgn, "uint", crgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a vector structure into an unsigned Int64 array.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Pointer<Integer>} prgn Type: <b>ULONGLONG*</b>
     * 
     * Pointer to the unsigned <b>Int64</b> data extracted from source variant structure.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Specifies unsigned <b>Int64</b> array size.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * Pointer to the count of unsigned <b>Int64</b> elements extracted from source variant structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttouint64array
     * @since windows5.1.2600
     */
    static VariantToUInt64Array(var, prgn, crgn, pcElem) {
        prgnMarshal := prgn is VarRef ? "uint*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToUInt64Array", "ptr", var, prgnMarshal, prgn, "uint", crgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts an array of DOUBLE values from a VARIANT structure.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @param {Pointer<Float>} prgn Type: <b>DOUBLE*</b>
     * 
     * Pointer to a buffer that contains <i>crgn</i> <b>DOUBLE</b> values. When this function returns, the buffer has been initialized with *<i>pcElem</i> <b>DOUBLE</b> elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * The number of elements in the buffer pointed to by <i>prgn</i>.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of <b>DOUBLE</b> elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The source <a href="/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> contained more than <i>crgn</i> values.
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
     * The <a href="/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttodoublearray
     * @since windows5.1.2600
     */
    static VariantToDoubleArray(var, prgn, crgn, pcElem) {
        prgnMarshal := prgn is VarRef ? "double*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToDoubleArray", "ptr", var, prgnMarshal, prgn, "uint", crgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a vector structure into a String array.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Pointer<PWSTR>} prgsz Type: <b>PWSTR*</b>
     * 
     * Pointer to the string data extracted from source variant structure.
     * @param {Integer} crgsz Type: <b>ULONG</b>
     * 
     * Specifies string array size.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * Pointer to the count of string elements extracted from source variant structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttostringarray
     * @since windows5.1.2600
     */
    static VariantToStringArray(var, prgsz, crgsz, pcElem) {
        prgszMarshal := prgsz is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToStringArray", "ptr", var, prgszMarshal, prgsz, "uint", crgsz, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Allocates an array of BOOL values then extracts data from a VARIANT structure into that array.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @param {Pointer<Pointer<BOOL>>} pprgf Type: <b>BOOL**</b>
     * 
     * When this function returns, contains a pointer to an array of <b>BOOL</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains a pointer to the count of elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttobooleanarrayalloc
     * @since windows5.1.2600
     */
    static VariantToBooleanArrayAlloc(var, pprgf, pcElem) {
        pprgfMarshal := pprgf is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToBooleanArrayAlloc", "ptr", var, pprgfMarshal, pprgf, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a vector structure into a newly-allocated Int16 array.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Pointer<Pointer<Integer>>} pprgn Type: <b>SHORT**</b>
     * 
     * Pointer to the address of the <b>Int16</b> data extracted from source variant structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * Pointer to the count of <b>Int16</b> elements extracted from source variant structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttoint16arrayalloc
     * @since windows5.1.2600
     */
    static VariantToInt16ArrayAlloc(var, pprgn, pcElem) {
        pprgnMarshal := pprgn is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToInt16ArrayAlloc", "ptr", var, pprgnMarshal, pprgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a vector structure into a newly-allocated unsigned Int16 array.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Pointer<Pointer<Integer>>} pprgn Type: <b>USHORT**</b>
     * 
     * Pointer to the address of the unsigned <b>Int16</b> data extracted from the source variant structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * Pointer to the count of unsigned <b>Int16</b> elements extracted from the source variant structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttouint16arrayalloc
     * @since windows5.1.2600
     */
    static VariantToUInt16ArrayAlloc(var, pprgn, pcElem) {
        pprgnMarshal := pprgn is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToUInt16ArrayAlloc", "ptr", var, pprgnMarshal, pprgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a vector structure into a newly-allocated Int32 array.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Pointer<Pointer<Integer>>} pprgn Type: <b>LONG**</b>
     * 
     * Pointer to the address of the <b>Int32</b> data extracted from source variant structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * Pointer to the count of <b>Int32</b> elements extracted from source variant structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttoint32arrayalloc
     * @since windows5.1.2600
     */
    static VariantToInt32ArrayAlloc(var, pprgn, pcElem) {
        pprgnMarshal := pprgn is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToInt32ArrayAlloc", "ptr", var, pprgnMarshal, pprgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a vector structure into a newly-allocated unsigned Int32 array.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Pointer<Pointer<Integer>>} pprgn Type: <b>ULONG**</b>
     * 
     * The address of a pointer to the unsigned <b>Int32</b> data extracted from source variant structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * Pointer to the count of unsigned <b>Int32</b> elements extracted from source variant structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttouint32arrayalloc
     * @since windows5.1.2600
     */
    static VariantToUInt32ArrayAlloc(var, pprgn, pcElem) {
        pprgnMarshal := pprgn is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToUInt32ArrayAlloc", "ptr", var, pprgnMarshal, pprgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a vector structure into a newly-allocated Int64 array.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Pointer<Pointer<Integer>>} pprgn Type: <b>LONGLONG**</b>
     * 
     * Pointer to the address of the <b>Int64</b> data extracted from source variant structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * Pointer to the count of <b>Int64</b> elements extracted from source variant structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttoint64arrayalloc
     * @since windows5.1.2600
     */
    static VariantToInt64ArrayAlloc(var, pprgn, pcElem) {
        pprgnMarshal := pprgn is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToInt64ArrayAlloc", "ptr", var, pprgnMarshal, pprgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a vector structure into a newly-allocated unsigned Int64 array.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Pointer<Pointer<Integer>>} pprgn Type: <b>ULONGLONG**</b>
     * 
     * The address of a pointer to the unsigned <b>Int64</b> data extracted from source variant structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * Pointer to the count of unsigned <b>Int64</b> elements extracted from source variant structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttouint64arrayalloc
     * @since windows5.1.2600
     */
    static VariantToUInt64ArrayAlloc(var, pprgn, pcElem) {
        pprgnMarshal := pprgn is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToUInt64ArrayAlloc", "ptr", var, pprgnMarshal, pprgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Allocates an array of DOUBLE values then extracts data from a VARIANT structure into that array.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @param {Pointer<Pointer<Float>>} pprgn Type: <b>DOUBLE**</b>
     * 
     * When this function returns, contains a pointer to an array of <b>DOUBLE</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains a pointer to the count of elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttodoublearrayalloc
     * @since windows5.1.2600
     */
    static VariantToDoubleArrayAlloc(var, pprgn, pcElem) {
        pprgnMarshal := pprgn is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToDoubleArrayAlloc", "ptr", var, pprgnMarshal, pprgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a vector structure into a newly-allocated String array.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Pointer<Pointer<PWSTR>>} pprgsz Type: <b>PWSTR**</b>
     * 
     * The address of a pointer to the string data extracted from source variant structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * Pointer to the count of string elements extracted from source variant structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttostringarrayalloc
     * @since windows5.1.2600
     */
    static VariantToStringArrayAlloc(var, pprgsz, pcElem) {
        pprgszMarshal := pprgsz is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\VariantToStringArrayAlloc", "ptr", var, pprgszMarshal, pprgsz, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts a single Boolean element from a variant structure.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * Specifies vector or array index; otherwise, value must be 0.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Pointer to the extracted element value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-variantgetbooleanelem
     * @since windows5.1.2600
     */
    static VariantGetBooleanElem(var, iElem) {
        result := DllCall("PROPSYS.dll\VariantGetBooleanElem", "ptr", var, "uint", iElem, "int*", &pfVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfVal
    }

    /**
     * Extracts a single Int16 element from a variant structure.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * Specifies vector or array index; otherwise, value must be 0.
     * @returns {Integer} Type: <b>SHORT*</b>
     * 
     * Pointer to the extracted element value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-variantgetint16elem
     * @since windows5.1.2600
     */
    static VariantGetInt16Elem(var, iElem) {
        result := DllCall("PROPSYS.dll\VariantGetInt16Elem", "ptr", var, "uint", iElem, "short*", &pnVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnVal
    }

    /**
     * Extracts a single unsigned Int16 element from a variant structure.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * Specifies a vector or array index; otherwise, value must be 0.
     * @returns {Integer} Type: <b>USHORT*</b>
     * 
     * Pointer to the extracted element value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-variantgetuint16elem
     * @since windows5.1.2600
     */
    static VariantGetUInt16Elem(var, iElem) {
        result := DllCall("PROPSYS.dll\VariantGetUInt16Elem", "ptr", var, "uint", iElem, "ushort*", &pnVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnVal
    }

    /**
     * Extracts a single Int32 element from a variant structure.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * Specifies vector or array index; otherwise, value must be 0.
     * @returns {Integer} Type: <b>LONG*</b>
     * 
     * Pointer to the extracted element value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-variantgetint32elem
     * @since windows5.1.2600
     */
    static VariantGetInt32Elem(var, iElem) {
        result := DllCall("PROPSYS.dll\VariantGetInt32Elem", "ptr", var, "uint", iElem, "int*", &pnVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnVal
    }

    /**
     * Extracts a single unsigned Int32 element from a variant structure.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * Specifies vector or array index; otherwise, value must be 0.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * Pointer to the extracted element value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-variantgetuint32elem
     * @since windows5.1.2600
     */
    static VariantGetUInt32Elem(var, iElem) {
        result := DllCall("PROPSYS.dll\VariantGetUInt32Elem", "ptr", var, "uint", iElem, "uint*", &pnVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnVal
    }

    /**
     * Extracts a single Int64 element from a variant structure.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * Specifies vector or array index; otherwise, value must be 0.
     * @returns {Integer} Type: <b>LONGLONG*</b>
     * 
     * Pointer to the extracted element value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-variantgetint64elem
     * @since windows5.1.2600
     */
    static VariantGetInt64Elem(var, iElem) {
        result := DllCall("PROPSYS.dll\VariantGetInt64Elem", "ptr", var, "uint", iElem, "int64*", &pnVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnVal
    }

    /**
     * Extracts a single unsigned Int64 element from a variant structure.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * Specifies vector or array index; otherwise, value must be 0.
     * @returns {Integer} Type: <b>ULONGLONG*</b>
     * 
     * Pointer to the extracted element value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-variantgetuint64elem
     * @since windows5.1.2600
     */
    static VariantGetUInt64Elem(var, iElem) {
        result := DllCall("PROPSYS.dll\VariantGetUInt64Elem", "ptr", var, "uint", iElem, "uint*", &pnVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnVal
    }

    /**
     * Extracts one double element from a variant structure.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * Specifies vector or array index; otherwise, value must be 0.
     * @returns {Float} Type: <b>DOUBLE*</b>
     * 
     * Pointer to the extracted element value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-variantgetdoubleelem
     * @since windows5.1.2600
     */
    static VariantGetDoubleElem(var, iElem) {
        result := DllCall("PROPSYS.dll\VariantGetDoubleElem", "ptr", var, "uint", iElem, "double*", &pnVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnVal
    }

    /**
     * Extracts a single wide string element from a variant structure.
     * @param {Pointer<VARIANT>} var Type: <b>REFVARIANT</b>
     * 
     * Reference to a source variant structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * Specifies a vector or array index; otherwise, value must be 0.
     * @returns {PWSTR} Type: <b>PWSTR*</b>
     * 
     * The address of a pointer to the extracted element value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-variantgetstringelem
     * @since windows5.1.2600
     */
    static VariantGetStringElem(var, iElem) {
        result := DllCall("PROPSYS.dll\VariantGetStringElem", "ptr", var, "uint", iElem, "ptr*", &ppszVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszVal
    }

    /**
     * Frees the memory and references used by an array of VARIANT structures stored in an array.
     * @param {Pointer<VARIANT>} pvars Type: <b>VARIANT*</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structures to free.
     * @param {Integer} cvars Type: <b>UINT</b>
     * 
     * The number of elements in the array specified by <i>pvars</i>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-clearvariantarray
     * @since windows5.1.2600
     */
    static ClearVariantArray(pvars, cvars) {
        DllCall("PROPSYS.dll\ClearVariantArray", "ptr", pvars, "uint", cvars)
    }

    /**
     * Compares two variant structures, based on default comparison rules.
     * @param {Pointer<VARIANT>} var1 Type: <b>REFVARIANT</b>
     * 
     * Reference to a first variant structure.
     * @param {Pointer<VARIANT>} var2 Type: <b>REFVARIANT</b>
     * 
     * Reference to a second variant structure.
     * @returns {Integer} Type: <b>INT</b>
     * 
     * <ul>
     * <li>Returns 1 if <i>var1</i> is greater than <i>var2</i></li>
     * <li>Returns 0 if <i>var1</i> equals <i>var2</i></li>
     * <li>Returns -1 if <i>var1</i> is less than <i>var2</i></li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-variantcompare
     * @since windows5.1.2600
     */
    static VariantCompare(var1, var2) {
        result := DllCall("PROPSYS.dll\VariantCompare", "ptr", var1, "ptr", var2, "int")
        return result
    }

;@endregion Methods
}
