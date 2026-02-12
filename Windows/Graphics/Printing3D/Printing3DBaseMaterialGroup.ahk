#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DBaseMaterialGroup.ahk
#Include .\IPrinting3DBaseMaterialGroupFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a group of base materials used in the 3D model.
 * @remarks
 * The Printing3DBaseMaterialGroup class corresponds to the `<basematerials>` element in the 3D Manufacturing Format (3MF) specification. For more info, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dbasematerialgroup
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DBaseMaterialGroup extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DBaseMaterialGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DBaseMaterialGroup.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the [Printing3DBaseMaterialGroup](printing3dbasematerialgroup.md) class.
     * @remarks
     * Set *MaterialGroupId* to a value greater than zero. A value of zero is not valid and triggers an **E_INVALIADARG** error.
     * @param {Integer} MaterialGroupId The identifier for the group of base materials used in the 3D model; a value greater than zero.
     * @returns {Printing3DBaseMaterialGroup} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dbasematerialgroup.#ctor
     */
    static Create(MaterialGroupId) {
        if (!Printing3DBaseMaterialGroup.HasProp("__IPrinting3DBaseMaterialGroupFactory")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DBaseMaterialGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrinting3DBaseMaterialGroupFactory.IID)
            Printing3DBaseMaterialGroup.__IPrinting3DBaseMaterialGroupFactory := IPrinting3DBaseMaterialGroupFactory(factoryPtr)
        }

        return Printing3DBaseMaterialGroup.__IPrinting3DBaseMaterialGroupFactory.Create(MaterialGroupId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a group of base materials used in the 3D model.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dbasematerialgroup.bases
     * @type {IVector<Printing3DBaseMaterial>} 
     */
    Bases {
        get => this.get_Bases()
    }

    /**
     * Gets the identifier (ID) of the base material group.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dbasematerialgroup.materialgroupid
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
     * @returns {IVector<Printing3DBaseMaterial>} 
     */
    get_Bases() {
        if (!this.HasProp("__IPrinting3DBaseMaterialGroup")) {
            if ((queryResult := this.QueryInterface(IPrinting3DBaseMaterialGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DBaseMaterialGroup := IPrinting3DBaseMaterialGroup(outPtr)
        }

        return this.__IPrinting3DBaseMaterialGroup.get_Bases()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaterialGroupId() {
        if (!this.HasProp("__IPrinting3DBaseMaterialGroup")) {
            if ((queryResult := this.QueryInterface(IPrinting3DBaseMaterialGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DBaseMaterialGroup := IPrinting3DBaseMaterialGroup(outPtr)
        }

        return this.__IPrinting3DBaseMaterialGroup.get_MaterialGroupId()
    }

;@endregion Instance Methods
}
