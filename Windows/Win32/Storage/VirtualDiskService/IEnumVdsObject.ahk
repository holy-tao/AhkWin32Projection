#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumVdsObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumVdsObject (vdshwprv.h) interface enumerates through a set of VDS objects of a given type.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ienumvdsobject
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IEnumVdsObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumVdsObject
     * @type {Guid}
     */
    static IID => Guid("{118610b7-8d94-4030-b5b8-500889788e4e}")

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
     * The IEnumVdsObject::Next method (vdshwprv.h) returns a specified number of objects in the enumeration, beginning from the current point.
     * @remarks
     * To obtain object-specific interface pointers from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointers returned in the <i>ppObjectArray</i> array, use the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> method.
     * @param {Integer} celt The number of objects to return.
     * @param {Pointer<IUnknown>} ppObjectArray The address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointers, which VDS initializes 
     *       on return.
     * @param {Pointer<Integer>} pcFetched The address of a <b>ULONG</b>, which VDS initializes on return to the number of 
     *       objects in <i>ppObjectArray</i>.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
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
     * The method returned the specified number of objects. The number of returned objects reported in 
     *         <i>pcFetched</i> equals <i>celt</i>; returns those objects.
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
     * The specified number of returned objects is greater than the number of objects remaining. All remaining 
     *         objects are returned, and the number of returned objects is reported in <i>pcFetched</i> is 
     *         less than <i>celt</i>; returns those objects.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ienumvdsobject-next
     */
    Next(celt, ppObjectArray, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", ppObjectArray, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * The IEnumVdsObject::Skip method (vdshwprv.h) skips a specified number of objects in the enumeration.
     * @param {Integer} celt The number of objects to skip.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
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
     * The method skipped the specified number of objects. The number of skipped objects equals 
     *         <i>celt</i>.
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
     * The number of objects specified is greater than the number of objects remaining. If the number of objects 
     *         remaining is less than the number specified in <i>celt</i>, the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ienumvdsobject-skip">Skip</a> method skips all remaining 
     *         objects.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ienumvdsobject-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The IEnumVdsObject::Reset method (vdshwprv.h) resets to the beginning of the enumeration.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
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
     * The enumeration has been reset.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ienumvdsobject-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The IEnumVdsObject::Clone method (vdshwprv.h) creates an enumeration with the same state as the current enumeration.
     * @remarks
     * This method enables you to record a point in an enumeration and return to that point later. When the new, 
     *     cloned enumeration is returned, it is at the same point in the enumeration sequence as the original. Henceforth, 
     *     however, the clone and the original enumeration operate independently.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> pointer, which 
     *       VDS initializes on return. Callers must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ienumvdsobject-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }
}
