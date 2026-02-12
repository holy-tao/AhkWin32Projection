#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SceneObject.ahk
#Include .\ISceneNode.ahk
#Include .\ISceneNodeStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an element in the scene's visual tree.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenenode
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class SceneNode extends SceneObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISceneNode

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISceneNode.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of SceneNode.
     * @param {Compositor} compositor_ An instance of the [Compositor](../windows.ui.composition/compositor.md) class.
     * @returns {SceneNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenenode.create
     */
    static Create(compositor_) {
        if (!SceneNode.HasProp("__ISceneNodeStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Scenes.SceneNode")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISceneNodeStatics.IID)
            SceneNode.__ISceneNodeStatics := ISceneNodeStatics(factoryPtr)
        }

        return SceneNode.__ISceneNodeStatics.Create(compositor_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the collection of children of this node.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenenode.children
     * @type {SceneNodeCollection} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * Gets the collection of components for this node.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenenode.components
     * @type {SceneComponentCollection} 
     */
    Components {
        get => this.get_Components()
    }

    /**
     * Gets the node that this node is a child of.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenenode.parent
     * @type {SceneNode} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * Gets the transform that describes the position, rotation, and scale of this node.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenenode.transform
     * @type {SceneModelTransform} 
     */
    Transform {
        get => this.get_Transform()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SceneNodeCollection} 
     */
    get_Children() {
        if (!this.HasProp("__ISceneNode")) {
            if ((queryResult := this.QueryInterface(ISceneNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneNode := ISceneNode(outPtr)
        }

        return this.__ISceneNode.get_Children()
    }

    /**
     * 
     * @returns {SceneComponentCollection} 
     */
    get_Components() {
        if (!this.HasProp("__ISceneNode")) {
            if ((queryResult := this.QueryInterface(ISceneNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneNode := ISceneNode(outPtr)
        }

        return this.__ISceneNode.get_Components()
    }

    /**
     * 
     * @returns {SceneNode} 
     */
    get_Parent() {
        if (!this.HasProp("__ISceneNode")) {
            if ((queryResult := this.QueryInterface(ISceneNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneNode := ISceneNode(outPtr)
        }

        return this.__ISceneNode.get_Parent()
    }

    /**
     * 
     * @returns {SceneModelTransform} 
     */
    get_Transform() {
        if (!this.HasProp("__ISceneNode")) {
            if ((queryResult := this.QueryInterface(ISceneNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneNode := ISceneNode(outPtr)
        }

        return this.__ISceneNode.get_Transform()
    }

    /**
     * Retrieves the first component of the specified kind.
     * @param {Integer} value The kind of component to find.
     * @returns {SceneComponent} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenenode.findfirstcomponentoftype
     */
    FindFirstComponentOfType(value) {
        if (!this.HasProp("__ISceneNode")) {
            if ((queryResult := this.QueryInterface(ISceneNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneNode := ISceneNode(outPtr)
        }

        return this.__ISceneNode.FindFirstComponentOfType(value)
    }

;@endregion Instance Methods
}
