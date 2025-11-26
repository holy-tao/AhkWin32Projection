#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDiskQuotaUser.ahk
#Include .\IEnumDiskQuotaUsers.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enumerates user quota entries on the volume.
 * @see https://docs.microsoft.com/windows/win32/api//dskquota/nn-dskquota-ienumdiskquotausers
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IEnumDiskQuotaUsers extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumDiskQuotaUsers
     * @type {Guid}
     */
    static IID => Guid("{7988b577-ec89-11cf-9c00-00aa00a14f56}")

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
     * Retrieves the specified number of user quota entries that are next in the enumeration sequence.
     * @param {Integer} cUsers The number of elements being requested.
     * @param {Pointer<Integer>} pcUsersFetched On input, the number of elements in <i>rgUsers</i>, on input. On output, the number of elements actually retrieved. The caller can pass in <b>NULL</b> if <i>cUsers</i> is one and the number of elements retrieved is of no interest.
     * @returns {IDiskQuotaUser} An array of size <i>cUsers</i> or larger.
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-ienumdiskquotausers-next
     */
    Next(cUsers, pcUsersFetched) {
        pcUsersFetchedMarshal := pcUsersFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cUsers, "ptr*", &rgUsers := 0, pcUsersFetchedMarshal, pcUsersFetched, "HRESULT")
        return IDiskQuotaUser(rgUsers)
    }

    /**
     * Skips over the specified number of user quota entries that are next in the enumeration sequence.
     * @param {Integer} cUsers The number of elements to be skipped.
     * @returns {HRESULT} The return value is <b>S_OK</b> if the number of elements skipped is 
     *        <i>cUsers</i>; otherwise, the return value is <b>S_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-ienumdiskquotausers-skip
     */
    Skip(cUsers) {
        result := ComCall(4, this, "uint", cUsers, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning of the set of user quota entries.
     * @returns {HRESULT} The return value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-ienumdiskquotausers-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates another enumerator of user quota entries that contains the same enumeration state as the current one.
     * @returns {IEnumDiskQuotaUsers} A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nn-dskquota-ienumdiskquotausers">IEnumDiskQuotaUsers</a> interface pointer. If the method is unsuccessful, the value of this variable is undefined.
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-ienumdiskquotausers-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDiskQuotaUsers(ppEnum)
    }
}
