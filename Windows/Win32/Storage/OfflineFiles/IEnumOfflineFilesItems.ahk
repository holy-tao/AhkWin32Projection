#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumOfflineFilesItems.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a collection of IOfflineFilesItem interface pointers.
 * @remarks
 * 
  * To obtain an instance of this interface, first obtain an instance of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitemcontainer">IOfflineFilesItemContainer</a> using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on an instance of one of the following interfaces:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilescache">IOfflineFilesCache</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesdirectoryitem">IOfflineFilesDirectoryItem</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitem">IOfflineFilesItem</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesserveritem">IOfflineFilesServerItem</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesshareitem">IOfflineFilesShareItem</a>
  * </li>
  * </ul>
  * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitemcontainer">IOfflineFilesItemContainer</a> interface is only valid for directory, server, and share items. If <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> is called for the <b>IOfflineFilesItemContainer</b> interface on a file item (an instance of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesfileitem">IOfflineFilesFileItem</a> interface), it will fail with <b>E_NOINTERFACE</b>.</div>
  * <div> </div>
  * For a code example that shows how to use the <b>IEnumOfflineFilesItems</b> interface, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesitemcontainer-enumitems">IOfflineFilesItemContainer::EnumItems</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-ienumofflinefilesitems
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IEnumOfflineFilesItems extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumOfflineFilesItems
     * @type {Guid}
     */
    static IID => Guid("{da70e815-c361-4407-bc0b-0d7046e5f2cd}")

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
     * 
     * @param {Integer} celt 
     * @param {Pointer<IOfflineFilesItem>} rgelt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-ienumofflinefilesitems-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-ienumofflinefilesitems-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-ienumofflinefilesitems-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumOfflineFilesItems} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-ienumofflinefilesitems-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumOfflineFilesItems(ppenum)
    }
}
