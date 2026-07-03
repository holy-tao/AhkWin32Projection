#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MediaLabelInfo.ahk" { MediaLabelInfo }

/**
 * The ClaimMediaLabel callback function determines whether a specified media label was created by the media's associated application.
 * @remarks
 * When a media label library uses the 
 * <i>ClaimMediaLabel</i> function to identify the media label as one created by its associated application, the media label library must fill in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsmli/ns-ntmsmli-medialabelinfo">MediaLabelInfo</a> structure and return NO_ERROR. If the media label library does not recognize the media label, it returns ERROR_BAD_FORMAT.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsmli/nc-ntmsmli-claimmedialabel
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLAIMMEDIALABEL {
    value : IntPtr

    __value {
        set {
            if (value is CLAIMMEDIALABEL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} pBuffer Pointer to a buffer that contains the media label.
     * @param {Integer} nBufferSize Size of the buffer, in bytes.
     * @param {Pointer<MediaLabelInfo>} pLabelInfo Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsmli/ns-ntmsmli-medialabelinfo">MediaLabelInfo</a> structure. The media label library fills in this structure if the library recognizes the media label.
     * @returns {Integer} This function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media label library filled in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsmli/ns-ntmsmli-medialabelinfo">MediaLabelInfo</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media label library does not recognize the media label.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(pBuffer, nBufferSize, pLabelInfo) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, pBufferMarshal, pBuffer, UInt32, nBufferSize, MediaLabelInfo.Ptr, pLabelInfo, UInt32)
        return result
    }

    /**
     * A CLAIMMEDIALABEL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CLAIMMEDIALABEL {
        /**
         * Creates a CLAIMMEDIALABEL pointer that invokes the given AHK function when called.
         * @param {Func("char*", UInt32, MediaLabelInfo) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["char*", UInt32, MediaLabelInfo.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
