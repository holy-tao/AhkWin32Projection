#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Ole\IEnumVARIANT.ahk
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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IEnumVARIANT} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Returns the number of GPMBackup objects in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmbackupcollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Given an index, returns a GPMBackup object from the collection.
     * @param {Integer} lIndex 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmbackupcollection-get_item
     */
    get_Item(lIndex) {
        pVal := VARIANT()
        result := ComCall(8, this, "int", lIndex, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves an enumerator for the collection.
     * @returns {IEnumVARIANT} Pointer to an <b>IEnumVARIANT</b> interface of an enumerator object for the collection.  <b>IEnumVARIANT</b> provides several methods that you can use to iterate through the collection. For more information about <b>IEnumVARIANT</b>, see the COM documentation in the Platform SDK.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmbackupcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppIGPMBackup := 0, "HRESULT")
        return IEnumVARIANT(ppIGPMBackup)
    }
}
