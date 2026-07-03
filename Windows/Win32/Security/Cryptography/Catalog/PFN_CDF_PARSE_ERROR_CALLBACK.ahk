#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Called for Catalog Definition Function errors while parsing a catalog definition file (CDF).
 * @remarks
 * The <i>dwErrorArea</i> parameter can have the following possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_AREA_HEADER</td>
 * <td>The header section of the CDF</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_AREA_MEMBER</td>
 * <td>A member file entry in the CatalogFiles section of the CDF</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_AREA_ATTRIBUTE</td>
 * <td>An attribute entry in the CDF</td>
 * </tr>
 * </table>
 *  
 * 
 * The <i>dwLocalError</i> parameter can have the following possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_UNSUPPORTED</td>
 * <td>The function does not support the attribute.</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_DUPLICATE</td>
 * <td>The file member already exists.</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_TAGNOTFOUND</td>
 * <td>The CatalogHeader or Name tag is missing.</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_MEMBER_FILE_PATH</td>
 * <td>The member file name or path is missing.</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_MEMBER_INDIRECTDATA</td>
 * <td>The function failed to create a hash of the member subject.</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_MEMBER_FILENOTFOUND</td>
 * <td>The function failed to find the member file.</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_BAD_GUID_CONV</td>
 * <td>The function failed to convert the subject string to a GUID.</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_ATTR_TOOFEWVALUES</td>
 * <td>The attribute line is missing one or more elements of its composition including type, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) or name, or value.</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_ATTR_TYPECOMBO</td>
 * <td>The attribute contains an invalid OID, or the combination of type, name or OID, and value is not valid.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mscat/nc-mscat-pfn_cdf_parse_error_callback
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 */
export default struct PFN_CDF_PARSE_ERROR_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CDF_PARSE_ERROR_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwErrorArea A value that indicates in which area of the CDF the error occurred.
     * @param {Integer} dwLocalError A value that indicates the type of error.
     * @param {PWSTR} pwszLine A pointer to a null-terminated string that contains the CDF line in which the error occurred.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(dwErrorArea, dwLocalError, pwszLine) {
        pwszLine := pwszLine is String ? StrPtr(pwszLine) : pwszLine

        DllCall(this.value, UInt32, dwErrorArea, UInt32, dwLocalError, "ptr", pwszLine)
    }

    /**
     * A PFN_CDF_PARSE_ERROR_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CDF_PARSE_ERROR_CALLBACK {
        /**
         * Creates a PFN_CDF_PARSE_ERROR_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, PWSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, PWSTR, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
