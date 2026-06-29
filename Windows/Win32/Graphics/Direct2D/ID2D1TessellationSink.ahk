#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\D2D1_TRIANGLE.ahk" { D2D1_TRIANGLE }

/**
 * Populates an ID2D1Mesh object with triangles.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1tessellationsink
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1TessellationSink extends IUnknown {
    /**
     * The interface identifier for ID2D1TessellationSink
     * @type {Guid}
     */
    static IID := Guid("{2cd906c1-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1TessellationSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddTriangles : IntPtr
        Close        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1TessellationSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Copies the specified triangles to the sink.
     * @param {Pointer<D2D1_TRIANGLE>} triangles Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_triangle">D2D1_TRIANGLE</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_triangle">D2D1_TRIANGLE</a> structures that describe the triangles to add to the sink.
     * @param {Integer} trianglesCount Type: <b>UINT</b>
     * 
     * The number of triangles to copy from the <i>triangles</i> array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1tessellationsink-addtriangles
     */
    AddTriangles(triangles, trianglesCount) {
        ComCall(3, this, D2D1_TRIANGLE.Ptr, triangles, "uint", trianglesCount)
    }

    /**
     * Closes the sink and returns its error status.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1tessellationsink-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1TessellationSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddTriangles := CallbackCreate(GetMethod(implObj, "AddTriangles"), flags, 3)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddTriangles)
        CallbackFree(this.vtbl.Close)
    }
}
