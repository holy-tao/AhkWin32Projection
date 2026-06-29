#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IVdsPack.ahk" { IVdsPack }
#Import ".\IEnumVdsObject.ahk" { IEnumVdsObject }

/**
 * Provides methods to perform operations specific to the software provider.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsswprovider
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsSwProvider extends IUnknown {
    /**
     * The interface identifier for IVdsSwProvider
     * @type {Guid}
     */
    static IID := Guid("{9aa58360-ce33-4f92-b658-ed24b14425b8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsSwProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryPacks : IntPtr
        CreatePack : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsSwProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns an enumeration object that contains all packs managed by the software provider.
     * @returns {IEnumVdsObject} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the packs  as <a href="https://docs.microsoft.com/windows/desktop/VDS/pack-object">pack objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the   pack objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsswprovider-querypacks
     */
    QueryPacks() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Creates a pack object.
     * @remarks
     * Use this method to create a pack before calling the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdspack-migratedisks">IVdsPack::MigrateDisks</a> method to convert disk formatting. When converting a basic disk to dynamic format,  pass either a new or existing pack as an argument to <b>MigrateDisks</b>. When converting a dynamic disk to basic format, use <b>CreatePack</b> to create a new, individual pack to hold the basic disk.
     * @returns {IVdsPack} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdspack">IVdsPack</a> interface. Callers must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsswprovider-createpack
     */
    CreatePack() {
        result := ComCall(4, this, "ptr*", &ppPack := 0, "HRESULT")
        return IVdsPack(ppPack)
    }

    Query(iid) {
        if (IVdsSwProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryPacks := CallbackCreate(GetMethod(implObj, "QueryPacks"), flags, 2)
        this.vtbl.CreatePack := CallbackCreate(GetMethod(implObj, "CreatePack"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryPacks)
        CallbackFree(this.vtbl.CreatePack)
    }
}
