#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_PRIMITIVE_BLEND.ahk" { D2D1_PRIMITIVE_BLEND }
#Import ".\ID2D1CommandSink3.ahk" { ID2D1CommandSink3 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * This interface performs all the same functions as the existing ID2D1CommandSink3 interface. It also enables access to the new primitive blend mode, MAX, through the SetPrimitiveBlend2 method.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1commandsink4
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1CommandSink4 extends ID2D1CommandSink3 {
    /**
     * The interface identifier for ID2D1CommandSink4
     * @type {Guid}
     */
    static IID := Guid("{c78a6519-40d6-4218-b2de-beeeb744bb3e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1CommandSink4 interfaces
    */
    struct Vtbl extends ID2D1CommandSink3.Vtbl {
        SetPrimitiveBlend2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1CommandSink4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets a new primitive blend mode. Allows access to the MAX primitive blend mode.
     * @param {D2D1_PRIMITIVE_BLEND} primitiveBlend Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_primitive_blend">D2D1_PRIMITIVE_BLEND</a></b>
     * 
     * The primitive blend that will apply to subsequent primitives.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, it returns S_OK. If it fails, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1commandsink4-setprimitiveblend2
     */
    SetPrimitiveBlend2(primitiveBlend) {
        result := ComCall(33, this, D2D1_PRIMITIVE_BLEND, primitiveBlend, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1CommandSink4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPrimitiveBlend2 := CallbackCreate(GetMethod(implObj, "SetPrimitiveBlend2"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPrimitiveBlend2)
    }
}
