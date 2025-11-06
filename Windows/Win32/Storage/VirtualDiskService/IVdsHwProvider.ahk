#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumVdsObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing query, reenumeration, and refresh operations on a hardware provider.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdshwprovider
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsHwProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsHwProvider
     * @type {Guid}
     */
    static IID => Guid("{d99bdaae-b13a-4178-9fdb-e27f16b4603e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QuerySubSystems", "Reenumerate", "Refresh"]

    /**
     * 
     * @returns {IEnumVdsObject} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdshwprovider-querysubsystems
     */
    QuerySubSystems() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate
     */
    Reenumerate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh
     */
    Refresh() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
