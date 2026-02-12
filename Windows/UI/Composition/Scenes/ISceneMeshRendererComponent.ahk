#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SceneMaterial.ahk
#Include .\SceneMesh.ahk
#Include .\SceneMeshMaterialAttributeMap.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class ISceneMeshRendererComponent extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceneMeshRendererComponent
     * @type {Guid}
     */
    static IID => Guid("{9929f7e3-6364-477e-98fe-74ed9fd4c2de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Material", "put_Material", "get_Mesh", "put_Mesh", "get_UVMappings"]

    /**
     * @type {SceneMaterial} 
     */
    Material {
        get => this.get_Material()
        set => this.put_Material(value)
    }

    /**
     * @type {SceneMesh} 
     */
    Mesh {
        get => this.get_Mesh()
        set => this.put_Mesh(value)
    }

    /**
     * @type {SceneMeshMaterialAttributeMap} 
     */
    UVMappings {
        get => this.get_UVMappings()
    }

    /**
     * 
     * @returns {SceneMaterial} 
     */
    get_Material() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SceneMaterial(value)
    }

    /**
     * 
     * @param {SceneMaterial} value 
     * @returns {HRESULT} 
     */
    put_Material(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SceneMesh} 
     */
    get_Mesh() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SceneMesh(value)
    }

    /**
     * 
     * @param {SceneMesh} value 
     * @returns {HRESULT} 
     */
    put_Mesh(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SceneMeshMaterialAttributeMap} 
     */
    get_UVMappings() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SceneMeshMaterialAttributeMap(value)
    }
}
