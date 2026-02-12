#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Ole\IEnumVARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMStarterGPOBackupCollection interface contains methods that enable applications to access a collection of GPMStarterGPOBackup objects when using the Group Policy Management Console (GPMC) interfaces.
 * @remarks
 * For more information, see 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmbackupdirex-searchbackups">SearchBackups</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/gpmgmt/nn-gpmgmt-igpmstartergpobackupcollection
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMStarterGPOBackupCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMStarterGPOBackupCollection
     * @type {Guid}
     */
    static IID => Guid("{c998031d-add0-4bb5-8dea-298505d8423b}")

    /**
     * The class identifier for GPMStarterGPOBackupCollection
     * @type {Guid}
     */
    static CLSID => Guid("{e75ea59d-1aeb-4cb5-a78a-281daa582406}")

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
     * Returns the number of GPMStarterGPOBackup objects in the collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/gpmgmt/nf-gpmgmt-igpmstartergpobackupcollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Given an index, returns a GPMStarterGPOBackup object from the collection.
     * @param {Integer} lIndex 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/gpmgmt/nf-gpmgmt-igpmstartergpobackupcollection-get_item
     */
    get_Item(lIndex) {
        pVal := VARIANT()
        result := ComCall(8, this, "int", lIndex, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Retrieves an enumerator for the collection. (IGPMstarterGPOBackupCollection.get__NewEnum)
     * @returns {IEnumVARIANT} Pointer to an IEnumVARIANT interface of an enumerator object for the collection.  IEnumVARIANT provides a number of methods that you can use to iterate through the collection. For more information about IEnumVARIANT, see the COM documentation in the Platform SDK.
     * @see https://learn.microsoft.com/windows/win32/api//content/gpmgmt/nf-gpmgmt-igpmstartergpobackupcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppIGPMTmplBackup := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumVARIANT(ppIGPMTmplBackup)
    }
}
