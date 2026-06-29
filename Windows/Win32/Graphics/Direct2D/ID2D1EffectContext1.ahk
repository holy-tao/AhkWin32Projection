#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D2D1_BUFFER_PRECISION.ahk" { D2D1_BUFFER_PRECISION }
#Import ".\ID2D1EffectContext.ahk" { ID2D1EffectContext }
#Import ".\ID2D1LookupTable3D.ahk" { ID2D1LookupTable3D }

/**
 * Provides factory methods and other state management for effect and transform authors. (ID2D1EffectContext1)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor_1/nn-d2d1effectauthor_1-id2d1effectcontext1
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1EffectContext1 extends ID2D1EffectContext {
    /**
     * The interface identifier for ID2D1EffectContext1
     * @type {Guid}
     */
    static IID := Guid("{84ab595a-fc81-4546-bacd-e8ef4d8abe7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1EffectContext1 interfaces
    */
    struct Vtbl extends ID2D1EffectContext.Vtbl {
        CreateLookupTable3D : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1EffectContext1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a 3D lookup table for mapping a 3-channel input to a 3-channel output. The table data must be provided in 4-channel format. (ID2D1EffectContext1.CreateLookupTable3D)
     * @param {D2D1_BUFFER_PRECISION} precision Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_buffer_precision">D2D1_BUFFER_PRECISION</a></b>
     * 
     * Precision of the input lookup table data.
     * @param {Pointer<Integer>} extents Type: <b>const UINT32*</b>
     * 
     * Number of lookup table elements per dimension (X, Y, Z).
     * @param {Pointer<Integer>} data Type: <b>const BYTE*</b>
     * 
     * Buffer holding the lookup table data.
     * @param {Integer} dataCount Type: <b>UINT32</b>
     * 
     * Size of the lookup table data buffer.
     * @param {Pointer<Integer>} strides Type: <b>const UINT32*</b>
     * 
     * An array containing two values. The first value is the size in bytes from one row (X dimension) of LUT data to the next. 
     *           The second value is the size in bytes from one LUT data plane (X and Y dimensions) to the next.
     * @returns {ID2D1LookupTable3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1lookuptable3d">ID2D1LookupTable3D</a>**</b>
     * 
     * Receives the new lookup table instance.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor_1/nf-d2d1effectauthor_1-id2d1effectcontext1-createlookuptable3d
     */
    CreateLookupTable3D(precision, extents, data, dataCount, strides) {
        extentsMarshal := extents is VarRef ? "uint*" : "ptr"
        dataMarshal := data is VarRef ? "char*" : "ptr"
        stridesMarshal := strides is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, D2D1_BUFFER_PRECISION, precision, extentsMarshal, extents, dataMarshal, data, "uint", dataCount, stridesMarshal, strides, "ptr*", &lookupTable := 0, "HRESULT")
        return ID2D1LookupTable3D(lookupTable)
    }

    Query(iid) {
        if (ID2D1EffectContext1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateLookupTable3D := CallbackCreate(GetMethod(implObj, "CreateLookupTable3D"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateLookupTable3D)
    }
}
