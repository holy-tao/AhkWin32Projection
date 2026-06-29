#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_DRAWING_STATE_DESCRIPTION1.ahk" { D2D1_DRAWING_STATE_DESCRIPTION1 }
#Import ".\ID2D1DrawingStateBlock.ahk" { ID2D1DrawingStateBlock }

/**
 * Implementation of a drawing state block that adds the functionality of primitive blend in addition to already existing antialias mode, transform, tags and text rendering mode.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nn-d2d1_1-id2d1drawingstateblock1
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1DrawingStateBlock1 extends ID2D1DrawingStateBlock {
    /**
     * The interface identifier for ID2D1DrawingStateBlock1
     * @type {Guid}
     */
    static IID := Guid("{689f1f85-c72e-4e33-8f19-85754efd5ace}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1DrawingStateBlock1 interfaces
    */
    struct Vtbl extends ID2D1DrawingStateBlock.Vtbl {
        GetDescription : IntPtr
        SetDescription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1DrawingStateBlock1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the antialiasing mode, transform, tags, primitive blend, and unit mode portion of the drawing state.
     * @param {Pointer<D2D1_DRAWING_STATE_DESCRIPTION1>} stateDescription Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_drawing_state_description1">D2D1_DRAWING_STATE_DESCRIPTION1</a>*</b>
     * 
     * When this method returns, contains the antialiasing mode, transform, tags, primitive blend, and unit mode portion of the drawing state. You must allocate storage for this parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1drawingstateblock1-getdescription
     */
    GetDescription(stateDescription) {
        ComCall(8, this, D2D1_DRAWING_STATE_DESCRIPTION1.Ptr, stateDescription)
    }

    /**
     * Sets the D2D1_DRAWING_STATE_DESCRIPTION1 associated with this drawing state block.
     * @param {Pointer<D2D1_DRAWING_STATE_DESCRIPTION1>} stateDescription Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_drawing_state_description1">D2D1_DRAWING_STATE_DESCRIPTION1</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_drawing_state_description1">D2D1_DRAWING_STATE_DESCRIPTION1</a> to be set associated with  this drawing state block.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1drawingstateblock1-setdescription
     */
    SetDescription(stateDescription) {
        ComCall(9, this, D2D1_DRAWING_STATE_DESCRIPTION1.Ptr, stateDescription)
    }

    Query(iid) {
        if (ID2D1DrawingStateBlock1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 2)
        this.vtbl.SetDescription := CallbackCreate(GetMethod(implObj, "SetDescription"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDescription)
        CallbackFree(this.vtbl.SetDescription)
    }
}
