#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DCompositeMaterialGroup.ahk
#Include .\IPrinting3DCompositeMaterialGroup2.ahk
#Include .\IPrinting3DCompositeMaterialGroupFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a group of composite materials.
 * @remarks
 * Each composite material is defined by a mixture of base materials that are listed in the specified base material group ([MaterialGroupId](printing3dcompositematerialgroup_materialgroupid.md)). The index values of possible base materials from that material group are specified in [MaterialIndices](printing3dcompositematerialgroup_materialindices.md). Each mixture is defined by listing the proportion of the overall mixture for each base material (values between 0 and 1). The mixtures of base materials are specified in [Composites](printing3dcompositematerialgroup_composites.md), where the proportion values are specified in the same order as the base materials in [MaterialIndices](printing3dcompositematerialgroup_materialindices.md).
 * 
 * This class corresponds to the `<compositematerials>` element in the 3D Manufacturing Format (3MF) specification. For more info, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcompositematerialgroup
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DCompositeMaterialGroup extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DCompositeMaterialGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DCompositeMaterialGroup.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the [Printing3DCompositeMaterialGroup](printing3dcompositematerialgroup.md) class.
     * @remarks
     * Set *MaterialGroupId* to a value greater than zero. A value of zero is not valid and triggers an **E_INVALIADARG** error.
     * @param {Integer} MaterialGroupId The identifier (ID) of the composite material group; a value greater than zero.
     * @returns {Printing3DCompositeMaterialGroup} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcompositematerialgroup.#ctor
     */
    static Create(MaterialGroupId) {
        if (!Printing3DCompositeMaterialGroup.HasProp("__IPrinting3DCompositeMaterialGroupFactory")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DCompositeMaterialGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrinting3DCompositeMaterialGroupFactory.IID)
            Printing3DCompositeMaterialGroup.__IPrinting3DCompositeMaterialGroupFactory := IPrinting3DCompositeMaterialGroupFactory(factoryPtr)
        }

        return Printing3DCompositeMaterialGroup.__IPrinting3DCompositeMaterialGroupFactory.Create(MaterialGroupId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets an list of mixtures that define individual composite materials. Each mixture is defined by listing the proportion of the overall mixture for each base material (values between 0 and 1), where the proportion values are specified in the same order as the base materials in [MaterialIndices](printing3dcompositematerialgroup_materialindices.md).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcompositematerialgroup.composites
     * @type {IVector<Printing3DCompositeMaterial>} 
     */
    Composites {
        get => this.get_Composites()
    }

    /**
     * Gets the identifier (ID) of the base material group that defines the materials used in the composite material group.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcompositematerialgroup.materialgroupid
     * @type {Integer} 
     */
    MaterialGroupId {
        get => this.get_MaterialGroupId()
    }

    /**
     * Gets an ordered list of base materials that are used to make the composite materials in the group. The order of base materials is maintained in the mixture values defined by [Composites](printing3dcompositematerialgroup_composites.md).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcompositematerialgroup.materialindices
     * @type {IVector<Integer>} 
     */
    MaterialIndices {
        get => this.get_MaterialIndices()
    }

    /**
     * Gets the existing [Printing3DBaseMaterialGroup](printing3dbasematerialgroup.md) whose [Printing3DBaseMaterial](printing3dbasematerial.md) members will be used to produce composite materials.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcompositematerialgroup.basematerialgroup
     * @type {Printing3DBaseMaterialGroup} 
     */
    BaseMaterialGroup {
        get => this.get_BaseMaterialGroup()
        set => this.put_BaseMaterialGroup(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<Printing3DCompositeMaterial>} 
     */
    get_Composites() {
        if (!this.HasProp("__IPrinting3DCompositeMaterialGroup")) {
            if ((queryResult := this.QueryInterface(IPrinting3DCompositeMaterialGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DCompositeMaterialGroup := IPrinting3DCompositeMaterialGroup(outPtr)
        }

        return this.__IPrinting3DCompositeMaterialGroup.get_Composites()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaterialGroupId() {
        if (!this.HasProp("__IPrinting3DCompositeMaterialGroup")) {
            if ((queryResult := this.QueryInterface(IPrinting3DCompositeMaterialGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DCompositeMaterialGroup := IPrinting3DCompositeMaterialGroup(outPtr)
        }

        return this.__IPrinting3DCompositeMaterialGroup.get_MaterialGroupId()
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_MaterialIndices() {
        if (!this.HasProp("__IPrinting3DCompositeMaterialGroup")) {
            if ((queryResult := this.QueryInterface(IPrinting3DCompositeMaterialGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DCompositeMaterialGroup := IPrinting3DCompositeMaterialGroup(outPtr)
        }

        return this.__IPrinting3DCompositeMaterialGroup.get_MaterialIndices()
    }

    /**
     * 
     * @returns {Printing3DBaseMaterialGroup} 
     */
    get_BaseMaterialGroup() {
        if (!this.HasProp("__IPrinting3DCompositeMaterialGroup2")) {
            if ((queryResult := this.QueryInterface(IPrinting3DCompositeMaterialGroup2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DCompositeMaterialGroup2 := IPrinting3DCompositeMaterialGroup2(outPtr)
        }

        return this.__IPrinting3DCompositeMaterialGroup2.get_BaseMaterialGroup()
    }

    /**
     * 
     * @param {Printing3DBaseMaterialGroup} value 
     * @returns {HRESULT} 
     */
    put_BaseMaterialGroup(value) {
        if (!this.HasProp("__IPrinting3DCompositeMaterialGroup2")) {
            if ((queryResult := this.QueryInterface(IPrinting3DCompositeMaterialGroup2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DCompositeMaterialGroup2 := IPrinting3DCompositeMaterialGroup2(outPtr)
        }

        return this.__IPrinting3DCompositeMaterialGroup2.put_BaseMaterialGroup(value)
    }

;@endregion Instance Methods
}
