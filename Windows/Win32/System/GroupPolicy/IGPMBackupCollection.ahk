#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMBackupCollection interface contains methods that enable applications to access a collection of GPMBackup objects when using the Group Policy Management Console (GPMC) interfaces.
 * @remarks
 * 
  * For more information, see 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmbackupdir-searchbackups">SearchBackups Method of the IGMPBackupDirInterface</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmbackupcollection
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMBackupCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMBackupCollection
     * @type {Guid}
     */
    static IID => Guid("{c786fc0f-26d8-4bab-a745-39ca7e800cac}")

    /**
     * The class identifier for GPMBackupCollection
     * @type {Guid}
     */
    static CLSID => Guid("{eb8f035b-70db-4a9f-9676-37c25994e9dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum"]

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmbackupcollection-get_count
     */
    get_Count(pVal) {
        result := ComCall(7, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmbackupcollection-get_item
     */
    get_Item(lIndex, pVal) {
        result := ComCall(8, this, "int", lIndex, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} ppIGPMBackup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmbackupcollection-get__newenum
     */
    get__NewEnum(ppIGPMBackup) {
        result := ComCall(9, this, "ptr*", ppIGPMBackup, "HRESULT")
        return result
    }
}
