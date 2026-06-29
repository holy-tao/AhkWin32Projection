#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Describes a node in a transform topology.
 * @remarks
 * Transform nodes are type-less and only define the notion of an object that accepts a number of inputs and is an output. This interface limits a topology to single output nodes.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1transformnode
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1TransformNode extends IUnknown {
    /**
     * The interface identifier for ID2D1TransformNode
     * @type {Guid}
     */
    static IID := Guid("{b2efe1e7-729f-4102-949f-505fa21bf666}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1TransformNode interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInputCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1TransformNode.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of inputs to the transform node.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * This method returns the number of inputs to this transform node.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformnode-getinputcount
     */
    GetInputCount() {
        result := ComCall(3, this, UInt32)
        return result
    }

    Query(iid) {
        if (ID2D1TransformNode.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInputCount := CallbackCreate(GetMethod(implObj, "GetInputCount"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInputCount)
    }
}
