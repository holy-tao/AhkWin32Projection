#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to uninstall basic and dynamic disks.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsserviceuninstalldisk
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsServiceUninstallDisk extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsServiceUninstallDisk
     * @type {Guid}
     */
    static IID => Guid("{b6b22da8-f903-4be7-b492-c09d875ac9da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDiskIdFromLunInfo", "UninstallDisks"]

    /**
     * 
     * @param {Pointer<VDS_LUN_INFORMATION>} pLunInfo 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceuninstalldisk-getdiskidfromluninfo
     */
    GetDiskIdFromLunInfo(pLunInfo) {
        pDiskId := Guid()
        result := ComCall(3, this, "ptr", pLunInfo, "ptr", pDiskId, "HRESULT")
        return pDiskId
    }

    /**
     * 
     * @param {Pointer<Guid>} pDiskIdArray 
     * @param {Integer} ulCount 
     * @param {BOOLEAN} bForce 
     * @param {Pointer<Integer>} pbReboot 
     * @param {Pointer<HRESULT>} pResults 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceuninstalldisk-uninstalldisks
     */
    UninstallDisks(pDiskIdArray, ulCount, bForce, pbReboot, pResults) {
        pbRebootMarshal := pbReboot is VarRef ? "char*" : "ptr"
        pResultsMarshal := pResults is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pDiskIdArray, "uint", ulCount, "char", bForce, pbRebootMarshal, pbReboot, pResultsMarshal, pResults, "HRESULT")
        return result
    }
}
