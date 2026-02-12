#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SceneNodeCollection.ahk
#Include .\SceneComponentCollection.ahk
#Include .\SceneNode.ahk
#Include .\SceneModelTransform.ahk
#Include .\SceneComponent.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class ISceneNode extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceneNode
     * @type {Guid}
     */
    static IID => Guid("{acf2c247-f307-4581-9c41-af2e29c3b016}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Children", "get_Components", "get_Parent", "get_Transform", "FindFirstComponentOfType"]

    /**
     * @type {SceneNodeCollection} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * @type {SceneComponentCollection} 
     */
    Components {
        get => this.get_Components()
    }

    /**
     * @type {SceneNode} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {SceneModelTransform} 
     */
    Transform {
        get => this.get_Transform()
    }

    /**
     * 
     * @returns {SceneNodeCollection} 
     */
    get_Children() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SceneNodeCollection(value)
    }

    /**
     * 
     * @returns {SceneComponentCollection} 
     */
    get_Components() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SceneComponentCollection(value)
    }

    /**
     * 
     * @returns {SceneNode} 
     */
    get_Parent() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SceneNode(value)
    }

    /**
     * 
     * @returns {SceneModelTransform} 
     */
    get_Transform() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SceneModelTransform(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {SceneComponent} 
     */
    FindFirstComponentOfType(value) {
        result := ComCall(10, this, "int", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SceneComponent(result_)
    }
}
