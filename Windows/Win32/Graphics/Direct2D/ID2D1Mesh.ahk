#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1TessellationSink.ahk
#Include .\ID2D1Resource.ahk

/**
 * Represents a set of vertices that form a list of triangles.
 * @remarks
 * 
  * <h3><a id="Creating_ID2D1Mesh_Objects"></a><a id="creating_id2d1mesh_objects"></a><a id="CREATING_ID2D1MESH_OBJECTS"></a>Creating ID2D1Mesh Objects</h3>
  * To create a mesh, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createmesh">ID2D1RenderTarget::CreateMesh</a> method on the render target with which the mesh will be used. A mesh can only be used with the render target that created it and the render target's compatible targets.
  * 
  * A mesh is a device-dependent resource: your application should create meshes after it initializes the render target with which the meshes will be used, and recreate the meshes whenever the render target needs recreated. (For more information about resources, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.)
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1mesh
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Mesh extends ID2D1Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Mesh
     * @type {Guid}
     */
    static IID => Guid("{2cd906c2-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open"]

    /**
     * 
     * @returns {ID2D1TessellationSink} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1mesh-open
     */
    Open() {
        result := ComCall(4, this, "ptr*", &tessellationSink := 0, "HRESULT")
        return ID2D1TessellationSink(tessellationSink)
    }
}
