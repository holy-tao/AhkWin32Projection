#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_ADVANCEDDISK_PROP.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsAdvancedDisk3 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetUniqueId"]

    /**
     * 
     * @returns {VDS_ADVANCEDDISK_PROP} 
     */
    GetProperties() {
        pAdvDiskProp := VDS_ADVANCEDDISK_PROP()
        result := ComCall(3, this, "ptr", pAdvDiskProp, "HRESULT")
        return pAdvDiskProp
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetUniqueId() {
        result := ComCall(4, this, "ptr*", &ppwszId := 0, "HRESULT")
        return ppwszId
    }
}
