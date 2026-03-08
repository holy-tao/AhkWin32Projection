#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains methods to iterate over and perform other operations on a list of enumerated objects. (IVssEnumObject)
 * @see https://learn.microsoft.com/windows/win32/api/vss/nn-vss-ivssenumobject
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssEnumObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssEnumObject
     * @type {Guid}
     */
    static IID => Guid("{ae1c7110-2f60-11d3-8a39-00c04f72d8e3}")

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
     * Returns the specified number of objects from the specified list of enumerated objects. (IVssEnumObject.Next)
     * @remarks
     * When requesting the return of more than one 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_object_prop">VSS_OBJECT_PROP</a> object, a return value of S_FALSE indicates that the end of the enumeration list has been reached. If more objects were requested than remained in the list, 
     * <b>Next</b> will return all the remaining objects, set the <i>pceltFetched</i> parameter to a nonzero value, and return S_FALSE.
     * 
     * The output <i>rgelt</i> parameter must point to an allocated array containing <i>celt</i>
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_object_prop">VSS_OBJECT_PROP</a> structures, and cannot be NULL.
     * 
     * It is the caller's responsibility to free system resources returned by <b>IVssEnumObject::Next</b> to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_object_prop">VSS_OBJECT_PROP</a> structure pointed to by the <i>rgelt</i> parameter.
     * 
     * The callers must use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> for every string value in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_provider_prop">VSS_PROVIDER_PROP</a> object in the returned 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_object_prop">VSS_OBJECT_PROP</a> structure.
     * 
     * In the case of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a>, this can be done manually, or the utility function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-vssfreesnapshotproperties">VssFreeSnapshotProperties</a> can be used.
     * @param {Integer} celt The number of elements to be read from the list of enumerated objects into the <i>rgelt</i> buffer.
     * @param {Pointer<VSS_OBJECT_PROP>} rgelt The address of a caller-allocated buffer that receives <i>celt</i><a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_object_prop">VSS_OBJECT_PROP</a> structures that contain the returned objects. This parameter is required and cannot be NULL.
     * @param {Pointer<Integer>} pceltFetched The number of elements that were returned in the <i>rgelt</i> buffer.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
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
     * The number of returned items is less than the number requested.
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
     * There is an internal error in the enumerator.
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
     * One of the required pointer parameters is NULL.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vss/nf-vss-ivssenumobject-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips the specified number of objects. (IVssEnumObject.Skip)
     * @param {Integer} celt Number of elements to be skipped in the list of enumerated objects.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
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
     * An attempt was made to access a location beyond the end of the list of items.
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
     * There was an internal error in the enumerator.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vss/nf-vss-ivssenumobject-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the enumerator so that IVssEnumObject:Next starts at the first enumerated object.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
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
     * There was an internal error in the enumerator.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vss/nf-vss-ivssenumobject-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a copy of the specified list of enumerated elements by creating a copy of the IVssEnumObject enumerator object.
     * @remarks
     * The cloned enumerator object will refer to the same list of 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_object_prop">VSS_OBJECT_PROP</a> structures.
     * 
     * The caller must call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method of the 
     *     returned interface pointer to deallocate the system resources held by the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssenumobject">IVssEnumObject</a> enumerator object pointed to by 
     *     the <i>ppEnum</i> parameter.
     * @param {Pointer<IVssEnumObject>} ppenum Doubly indirect pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssenumobject">IVssEnumObject</a> 
     *       enumerator object. Set the value of this parameter to <b>NULL</b> before calling this 
     *       method.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
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
     * There is an internal error in the enumerator.
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
     * The caller is out of memory or other system resources.
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
     * One of the required pointer parameters is NULL.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vss/nf-vss-ivssenumobject-clone
     */
    Clone(ppenum) {
        result := ComCall(6, this, "ptr*", ppenum, "HRESULT")
        return result
    }
}
