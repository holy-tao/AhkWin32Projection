#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsAdvancedDisk3 extends IUnknown{
    /**
     * The interface identifier for IVdsAdvancedDisk3
     * @type {Guid}
     */
    static IID => Guid("{3858c0d5-0f35-4bf5-9714-69874963bc36}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<VDS_ADVANCEDDISK_PROP>} pAdvDiskProp 
     * @returns {HRESULT} 
     */
    GetProperties(pAdvDiskProp) {
        result := ComCall(3, this, "ptr", pAdvDiskProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszId 
     * @returns {HRESULT} 
     */
    GetUniqueId(ppwszId) {
        result := ComCall(4, this, "ptr", ppwszId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
