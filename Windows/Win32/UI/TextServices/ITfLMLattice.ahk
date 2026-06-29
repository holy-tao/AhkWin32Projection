#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumTfLatticeElements.ahk" { IEnumTfLatticeElements }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfLMLattice interface is implemented by the speech text service to provide information about lattice element properties and is used by a client (application or other text service).
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itflmlattice
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfLMLattice extends IUnknown {
    /**
     * The interface identifier for ITfLMLattice
     * @type {Guid}
     */
    static IID := Guid("{d4236675-a5bf-4570-9d42-5d6d7b02d59b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfLMLattice interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryType           : IntPtr
        EnumLatticeElements : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfLMLattice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfLMLattice::QueryType method
     * @param {Pointer<Guid>} rguidType Specifies the lattice type identifier. This can be one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/lattice-types">Lattice Type</a> values.
     * @returns {BOOL} Pointer to a <b>BOOL</b> that receives a value that indicates if the lattice type is supported. If the lattice type is supported, this parameter receives a nonzero value and the method returns S_OK. If the lattice type is unsupported, this parameter receives zero and the method returns E_INVALIDARG.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itflmlattice-querytype
     */
    QueryType(rguidType) {
        result := ComCall(3, this, Guid.Ptr, rguidType, BOOL.Ptr, &pfSupported := 0, "HRESULT")
        return pfSupported
    }

    /**
     * ITfLMLattice::EnumLatticeElements method
     * @param {Integer} dwFrameStart Specifies the offset, in 100-nanosecond units, relative to the start of the phrase, of the first element to obtain.
     * @param {Pointer<Guid>} rguidType Specifies the lattice type identifier. This can be one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/lattice-types">Lattice Type</a> values.
     * @returns {IEnumTfLatticeElements} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nn-ctffunc-ienumtflatticeelements">IEnumTfLatticeElements</a> interface pointer that receives the enumerator object.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itflmlattice-enumlatticeelements
     */
    EnumLatticeElements(dwFrameStart, rguidType) {
        result := ComCall(4, this, "uint", dwFrameStart, Guid.Ptr, rguidType, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfLatticeElements(ppEnum)
    }

    Query(iid) {
        if (ITfLMLattice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryType := CallbackCreate(GetMethod(implObj, "QueryType"), flags, 3)
        this.vtbl.EnumLatticeElements := CallbackCreate(GetMethod(implObj, "EnumLatticeElements"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryType)
        CallbackFree(this.vtbl.EnumLatticeElements)
    }
}
