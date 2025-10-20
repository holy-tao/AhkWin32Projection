#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMStarterGPOBackupCollection interface contains methods that enable applications to access a collection of GPMStarterGPOBackup objects when using the Group Policy Management Console (GPMC) interfaces.
 * @remarks
 * 
  * For more information, see 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmbackupdirex-searchbackups">SearchBackups</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmstartergpobackupcollection
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMStarterGPOBackupCollection extends IDispatch{
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
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_Count(pVal) {
        result := ComCall(7, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    get_Item(lIndex, pVal) {
        result := ComCall(8, this, "int", lIndex, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} ppIGPMTmplBackup 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppIGPMTmplBackup) {
        result := ComCall(9, this, "ptr", ppIGPMTmplBackup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
