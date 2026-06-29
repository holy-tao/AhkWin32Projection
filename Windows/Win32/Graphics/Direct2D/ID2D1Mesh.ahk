#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1TessellationSink.ahk" { ID2D1TessellationSink }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }

/**
 * Represents a set of vertices that form a list of triangles.
 * @remarks
 * <h3><a id="Creating_ID2D1Mesh_Objects"></a><a id="creating_id2d1mesh_objects"></a><a id="CREATING_ID2D1MESH_OBJECTS"></a>Creating ID2D1Mesh Objects</h3>
 * To create a mesh, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createmesh">ID2D1RenderTarget::CreateMesh</a> method on the render target with which the mesh will be used. A mesh can only be used with the render target that created it and the render target's compatible targets.
 * 
 * A mesh is a device-dependent resource: your application should create meshes after it initializes the render target with which the meshes will be used, and recreate the meshes whenever the render target needs recreated. (For more information about resources, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1mesh
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Mesh extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1Mesh
     * @type {Guid}
     */
    static IID := Guid("{2cd906c2-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Mesh interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        Open : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Mesh.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Opens the mesh for population.
     * @returns {ID2D1TessellationSink} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1tessellationsink">ID2D1TessellationSink</a>**</b>
     * 
     * When this method returns, contains a pointer to a pointer to an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1tessellationsink">ID2D1TessellationSink</a> that is used to populate the mesh. This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1mesh-open
     */
    Open() {
        result := ComCall(4, this, "ptr*", &tessellationSink := 0, "HRESULT")
        return ID2D1TessellationSink(tessellationSink)
    }

    Query(iid) {
        if (ID2D1Mesh.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Open := CallbackCreate(GetMethod(implObj, "Open"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Open)
    }
}
