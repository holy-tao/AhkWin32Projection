#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumMediaTypes.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumMediaTypes interface enumerates a pin's preferred media types.
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-ienummediatypes
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IEnumMediaTypes extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumMediaTypes
     * @type {Guid}
     */
    static IID => Guid("{89c31040-846b-11ce-97d3-00aa0055595a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * The Next method retrieves a specified number of media types.
     * @remarks
     * The caller passes an array of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> pointers in <i>ppMediaTypes</i>. The method allocates a number <b>AM_MEDIA_TYPE</b> structures equal to <i>cMediaTypes</i> or to the number of media types that remain in the enumeration, whichever is less. The number of structures allocated is returned in <i>pcFetched</i>. Delete each structure by calling the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/deletemediatype">DeleteMediaType</a> function.
     * 
     * If the set of media types changes, the enumerator becomes inconsistent with the owning pin. In that case, the method returns VFW_E_ENUM_OUT_OF_SYNC. Discard any data obtained from previous calls to the enumerator, because it might be invalid. Update the enumerator by calling the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ienummediatypes-reset">IEnumMediaTypes::Reset</a> method. You can then call the <b>Next</b> method safely.
     * @param {Integer} cMediaTypes The number of media types to retrieve.
     * @param {Pointer<Pointer<AM_MEDIA_TYPE>>} ppMediaTypes The address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> pointers. The number of elements in the array is given in the <i>cMediaTypes</i> parameter.
     * @param {Pointer<Integer>} pcFetched Receives the number of media types returned in <i>ppMediaTypes</i>. This parameter can be <b>NULL</b> if <i>cMediaTypes</i> is 1.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * Did not retrieve as many media types as requested.
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
     * Success.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_ENUM_OUT_OF_SYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin's state has changed and is now inconsistent with the enumerator.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ienummediatypes-next
     */
    Next(cMediaTypes, ppMediaTypes, pcFetched) {
        ppMediaTypesMarshal := ppMediaTypes is VarRef ? "ptr*" : "ptr"
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cMediaTypes, ppMediaTypesMarshal, ppMediaTypes, pcFetchedMarshal, pcFetched, "int")
        return result
    }

    /**
     * The Skip method skips over a specified number of media types.
     * @remarks
     * If the set of media types changes, the enumerator is no longer consistent with the pin, and the method returns VFW_E_ENUM_OUT_OF_SYNC. Discard any data obtained from previous calls to the enumerator, because it might be invalid. Update the enumerator by calling the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ienummediatypes-reset">IEnumMediaTypes::Reset</a> method. You can then call the <c>Skip</c> method safely.
     * @param {Integer} cMediaTypes Number of media types to skip.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * Skipped past the end of the sequence.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_ENUM_OUT_OF_SYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin's state has changed and is now inconsistent with the enumerator.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ienummediatypes-skip
     */
    Skip(cMediaTypes) {
        result := ComCall(4, this, "uint", cMediaTypes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Reset method resets the enumeration sequence to the beginning. (IEnumMediaTypes.Reset)
     * @returns {HRESULT} Returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ienummediatypes-reset
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Clone method makes a copy of the enumerator. The returned object starts with the same enumeration state as the original.
     * @remarks
     * If the set of media types changes, the enumerator is no longer consistent with the pin, and the method returns VFW_E_ENUM_OUT_OF_SYNC. Discard any data obtained from previous calls to the enumerator, because it might be invalid. Update the enumerator by calling the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ienummediatypes-reset">Reset</a> method. You can then call the <c>Clone</c> method safely.
     * @returns {IEnumMediaTypes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ienummediatypes">IEnumMediaTypes</a> interface of the new enumerator. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ienummediatypes-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumMediaTypes(ppEnum)
    }
}
