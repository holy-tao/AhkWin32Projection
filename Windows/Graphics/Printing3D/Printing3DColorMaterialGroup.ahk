#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DColorMaterialGroup.ahk
#Include .\IPrinting3DColorMaterialGroupFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a group of color materials used in the 3D model.
 * @remarks
 * The Printing3DColorMaterialGroup class corresponds to the `<colorgroup>` element in the 3D Manufacturing Format (3MF) specification. For more info, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcolormaterialgroup
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DColorMaterialGroup extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DColorMaterialGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DColorMaterialGroup.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the [Printing3DColorMaterialGroup](printing3dcolormaterialgroup.md) class.
     * @remarks
     * Set *MaterialGroupId* to a value greater than zero. A value of zero is not valid and triggers an **E_INVALIADARG** error.
     * @param {Integer} MaterialGroupId The identifier for the group of color materials used in the 3D model; a value greater than zero.
     * @returns {Printing3DColorMaterialGroup} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcolormaterialgroup.#ctor
     */
    static Create(MaterialGroupId) {
        if (!Printing3DColorMaterialGroup.HasProp("__IPrinting3DColorMaterialGroupFactory")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DColorMaterialGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrinting3DColorMaterialGroupFactory.IID)
            Printing3DColorMaterialGroup.__IPrinting3DColorMaterialGroupFactory := IPrinting3DColorMaterialGroupFactory(factoryPtr)
        }

        return Printing3DColorMaterialGroup.__IPrinting3DColorMaterialGroupFactory.Create(MaterialGroupId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a group of color materials used in the 3D model.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcolormaterialgroup.colors
     * @type {IVector<Printing3DColorMaterial>} 
     */
    Colors {
        get => this.get_Colors()
    }

    /**
     * Gets the identifier (ID) for the color material group.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcolormaterialgroup.materialgroupid
     * @type {Integer} 
     */
    MaterialGroupId {
        get => this.get_MaterialGroupId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<Printing3DColorMaterial>} 
     */
    get_Colors() {
        if (!this.HasProp("__IPrinting3DColorMaterialGroup")) {
            if ((queryResult := this.QueryInterface(IPrinting3DColorMaterialGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DColorMaterialGroup := IPrinting3DColorMaterialGroup(outPtr)
        }

        return this.__IPrinting3DColorMaterialGroup.get_Colors()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaterialGroupId() {
        if (!this.HasProp("__IPrinting3DColorMaterialGroup")) {
            if ((queryResult := this.QueryInterface(IPrinting3DColorMaterialGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DColorMaterialGroup := IPrinting3DColorMaterialGroup(outPtr)
        }

        return this.__IPrinting3DColorMaterialGroup.get_MaterialGroupId()
    }

;@endregion Instance Methods
}
