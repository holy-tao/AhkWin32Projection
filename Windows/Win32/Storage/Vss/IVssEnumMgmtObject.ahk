#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains methods to iterate over and perform other operations on a list of enumerated objects.
 * @see https://docs.microsoft.com/windows/win32/api//vsmgmt/nn-vsmgmt-ivssenummgmtobject
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssEnumMgmtObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssEnumMgmtObject
     * @type {Guid}
     */
    static IID => Guid("{01954e6b-9254-4e6e-808c-c9e05d007696}")

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
     * Returns the specified number of objects from the specified list of enumerated objects.
     * @param {Integer} celt The number of elements to be read from the list of enumerated objects into the <i>rgelt</i> buffer.
     * @param {Pointer<VSS_MGMT_OBJECT_PROP>} rgelt The address of a caller-allocated buffer that receives <i>celt</i><a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ns-vsmgmt-vss_mgmt_object_prop">VSS_MGMT_OBJECT_PROP</a> structures that contain the 
     *       returned objects. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<Integer>} pceltFetched The number of elements that were returned in the <i>rgelt</i> buffer.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//vsmgmt/nf-vsmgmt-ivssenummgmtobject-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips the specified number of objects.
     * @param {Integer} celt Number of elements to be skipped in the list of enumerated objects.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//vsmgmt/nf-vsmgmt-ivssenummgmtobject-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the enumerator so that IVssEnumMgmtObject starts at the first enumerated object.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//vsmgmt/nf-vsmgmt-ivssenummgmtobject-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a copy of the specified list of enumerated elements by creating a copy of the IVssEnumMgmtObject enumerator object.
     * @param {Pointer<IVssEnumMgmtObject>} ppenum Address of an <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nn-vsmgmt-ivssenummgmtobject">IVssEnumMgmtObject</a> interface 
     *       pointer. Set the value of this parameter to <b>NULL</b> before calling this method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//vsmgmt/nf-vsmgmt-ivssenummgmtobject-clone
     */
    Clone(ppenum) {
        result := ComCall(6, this, "ptr*", ppenum, "HRESULT")
        return result
    }
}
