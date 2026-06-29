#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDVBTLocator.ahk" { IDVBTLocator }

/**
 * Gets or sets tuning information for a Digital Video Broadcast - Second Generation Terrestrial (DVB-T2) network.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBTLocator2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-idvbtlocator2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDVBTLocator2 extends IDVBTLocator {
    /**
     * The interface identifier for IDVBTLocator2
     * @type {Guid}
     */
    static IID := Guid("{448a2edf-ae95-4b43-a3cc-747843c453d4}")

    /**
     * The class identifier for DVBTLocator2
     * @type {Guid}
     */
    static CLSID := Guid("{efe3fa02-45d7-4920-be96-53fa7f35b0e6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDVBTLocator2 interfaces
    */
    struct Vtbl extends IDVBTLocator.Vtbl {
        get_PhysicalLayerPipeId : IntPtr
        put_PhysicalLayerPipeId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDVBTLocator2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    PhysicalLayerPipeId {
        get => this.get_PhysicalLayerPipeId()
        set => this.put_PhysicalLayerPipeId(value)
    }

    /**
     * Identifies a Physical Layer Pipe (PLP) that carries a T2 logical data stream.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator2-get_physicallayerpipeid
     */
    get_PhysicalLayerPipeId() {
        result := ComCall(36, this, "int*", &PhysicalLayerPipeIdVal := 0, "HRESULT")
        return PhysicalLayerPipeIdVal
    }

    /**
     * Identifies a Physical Layer Pipe (PLP) that carries a T2 logical data stream.
     * @param {Integer} PhysicalLayerPipeIdVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator2-put_physicallayerpipeid
     */
    put_PhysicalLayerPipeId(PhysicalLayerPipeIdVal) {
        result := ComCall(37, this, "int", PhysicalLayerPipeIdVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDVBTLocator2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PhysicalLayerPipeId := CallbackCreate(GetMethod(implObj, "get_PhysicalLayerPipeId"), flags, 2)
        this.vtbl.put_PhysicalLayerPipeId := CallbackCreate(GetMethod(implObj, "put_PhysicalLayerPipeId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PhysicalLayerPipeId)
        CallbackFree(this.vtbl.put_PhysicalLayerPipeId)
    }
}
