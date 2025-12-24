#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumVdsObject.ahk
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
     * Returns an IEnumVdsObject enumeration object containing a list of the HBA ports known to VDS on the local system.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the HBA ports  as <a href="https://docs.microsoft.com/windows/desktop/VDS/startup-and-service-objects">HBA port objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the HBA port objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsservicehba-queryhbaports
     */
    QueryHbaPorts() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }
}
