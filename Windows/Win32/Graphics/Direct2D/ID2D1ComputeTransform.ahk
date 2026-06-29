#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1ComputeInfo.ahk" { ID2D1ComputeInfo }
#Import ".\ID2D1Transform.ahk" { ID2D1Transform }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Defines a transform that uses a compute shader.
 * @remarks
 * The transform implements the normal Shatzis methods by  implementing <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1transform">ID2D1Transform</a>. In addition, the caller is passed an <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1computeinfo">ID2D1ComputeInfo</a> to describe the compute pass that the transform should execute.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1computetransform
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1ComputeTransform extends ID2D1Transform {
    /**
     * The interface identifier for ID2D1ComputeTransform
     * @type {Guid}
     */
    static IID := Guid("{0d85573c-01e3-4f7d-bfd9-0d60608bf3c3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1ComputeTransform interfaces
    */
    struct Vtbl extends ID2D1Transform.Vtbl {
        SetComputeInfo        : IntPtr
        CalculateThreadgroups : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1ComputeTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the render information used to specify the compute shader pass.
     * @remarks
     * If this method fails, <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-addnode">ID2D1TransformGraph::AddNode</a> fails.
     * @param {ID2D1ComputeInfo} computeInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1computeinfo">ID2D1ComputeInfo</a>*</b>
     * 
     * The render information object to set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1computetransform-setcomputeinfo
     */
    SetComputeInfo(computeInfo) {
        result := ComCall(7, this, "ptr", computeInfo, "HRESULT")
        return result
    }

    /**
     * This method allows a compute-shader–based transform to select the number of thread groups to execute based on the number of output pixels it needs to fill.
     * @remarks
     * If this call fails, the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1effect">ID2D1Effect</a> instance is placed into an error state and fails to draw.
     * @param {Pointer<RECT>} outputRect Type: <b>const <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a>*</b>
     * 
     * The output rectangle that will be filled by the compute transform.
     * @param {Pointer<Integer>} dimensionX Type: <b>UINT32*</b>
     * 
     * The number of threads in the x dimension.
     * @param {Pointer<Integer>} dimensionY Type: <b>UINT32*</b>
     * 
     * The number of threads in the y dimension.
     * @param {Pointer<Integer>} dimensionZ Type: <b>UINT32*</b>
     * 
     * The number of threads in the z dimension.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1computetransform-calculatethreadgroups
     */
    CalculateThreadgroups(outputRect, dimensionX, dimensionY, dimensionZ) {
        dimensionXMarshal := dimensionX is VarRef ? "uint*" : "ptr"
        dimensionYMarshal := dimensionY is VarRef ? "uint*" : "ptr"
        dimensionZMarshal := dimensionZ is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, RECT.Ptr, outputRect, dimensionXMarshal, dimensionX, dimensionYMarshal, dimensionY, dimensionZMarshal, dimensionZ, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1ComputeTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetComputeInfo := CallbackCreate(GetMethod(implObj, "SetComputeInfo"), flags, 2)
        this.vtbl.CalculateThreadgroups := CallbackCreate(GetMethod(implObj, "CalculateThreadgroups"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetComputeInfo)
        CallbackFree(this.vtbl.CalculateThreadgroups)
    }
}
