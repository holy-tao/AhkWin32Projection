#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to query and configure the default VSS import target for the subsystem.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdssubsystemimporttarget
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsSubSystemImportTarget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsSubSystemImportTarget
     * @type {Guid}
     */
    static IID => Guid("{83bfb87f-43fb-4903-baa6-127f01029eec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetImportTarget", "SetImportTarget"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszIscsiName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdssubsystemimporttarget-getimporttarget
     */
    GetImportTarget(ppwszIscsiName) {
        result := ComCall(3, this, "ptr", ppwszIscsiName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszIscsiName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdssubsystemimporttarget-setimporttarget
     */
    SetImportTarget(pwszIscsiName) {
        pwszIscsiName := pwszIscsiName is String ? StrPtr(pwszIscsiName) : pwszIscsiName

        result := ComCall(4, this, "ptr", pwszIscsiName, "HRESULT")
        return result
    }
}
