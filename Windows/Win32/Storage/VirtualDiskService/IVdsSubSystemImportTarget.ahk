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
     * 
     * @param {Pointer<PWSTR>} ppwszIscsiName 
     * @returns {HRESULT} 
     */
    GetImportTarget(ppwszIscsiName) {
        result := ComCall(3, this, "ptr", ppwszIscsiName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszIscsiName 
     * @returns {HRESULT} 
     */
    SetImportTarget(pwszIscsiName) {
        pwszIscsiName := pwszIscsiName is String ? StrPtr(pwszIscsiName) : pwszIscsiName

        result := ComCall(4, this, "ptr", pwszIscsiName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
