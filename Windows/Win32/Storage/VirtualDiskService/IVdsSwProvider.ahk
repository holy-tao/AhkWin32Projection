#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumVdsObject.ahk
#Include .\IVdsPack.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to perform operations specific to the software provider.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsswprovider
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsSwProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsSwProvider
     * @type {Guid}
     */
    static IID => Guid("{9aa58360-ce33-4f92-b658-ed24b14425b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryPacks", "CreatePack"]

    /**
     * Returns an enumeration object that contains all packs managed by the software provider.
     * @returns {IEnumVdsObject} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the packs  as <a href="https://docs.microsoft.com/windows/desktop/VDS/pack-object">pack objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the   pack objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsswprovider-querypacks
     */
    QueryPacks() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Creates a pack object.
     * @returns {IVdsPack} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdspack">IVdsPack</a> interface. Callers must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsswprovider-createpack
     */
    CreatePack() {
        result := ComCall(4, this, "ptr*", &ppPack := 0, "HRESULT")
        return IVdsPack(ppPack)
    }
}
