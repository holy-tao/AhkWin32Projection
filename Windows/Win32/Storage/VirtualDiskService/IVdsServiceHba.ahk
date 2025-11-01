#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to query HBA ports on the local system.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsservicehba
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsServiceHba extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsServiceHba
     * @type {Guid}
     */
    static IID => Guid("{0ac13689-3134-47c6-a17c-4669216801be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryHbaPorts"]

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservicehba-queryhbaports
     */
    QueryHbaPorts(ppEnum) {
        result := ComCall(3, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
