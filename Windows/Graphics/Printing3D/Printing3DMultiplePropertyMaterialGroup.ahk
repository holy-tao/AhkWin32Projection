#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DMultiplePropertyMaterialGroup.ahk
#Include .\IPrinting3DMultiplePropertyMaterialGroupFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a multi-property material group.
 * @remarks
 * Each multi-property material is defined by a combination of properties and/or materials that are listed in the specified material groups ([MaterialGroupIndices](printing3dmultiplepropertymaterialgroup_materialgroupindices.md)). Each combination is defined by listing the index of an item from one material group with the index of an item from a secondary material group. The combinations are specified in [MultipleProperties](printing3dmultiplepropertymaterialgroup_multipleproperties.md), where the index values are specified in the same order as the material groups listed in [MaterialGroupIndices](printing3dmultiplepropertymaterialgroup_materialgroupindices.md).
 * 
 * The Printing3DMultiplePropertyMaterialGroup class corresponds to the `<multiproperties>` element in the 3D Manufacturing Format (3MF) specification. For more info, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmultiplepropertymaterialgroup
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DMultiplePropertyMaterialGroup extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DMultiplePropertyMaterialGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DMultiplePropertyMaterialGroup.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the [Printing3DMultiplePropertyMaterialGroup](printing3dmultiplepropertymaterialgroup.md) class.
     * @remarks
     * Set *MaterialGroupId* to a value greater than zero. A value of zero is not valid and triggers an **E_INVALIADARG** error.
     * @param {Integer} MaterialGroupId The identifier (ID) of the multi-property material group; a value greater than zero.
     * @returns {Printing3DMultiplePropertyMaterialGroup} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmultiplepropertymaterialgroup.#ctor
     */
    static Create(MaterialGroupId) {
        if (!Printing3DMultiplePropertyMaterialGroup.HasProp("__IPrinting3DMultiplePropertyMaterialGroupFactory")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DMultiplePropertyMaterialGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrinting3DMultiplePropertyMaterialGroupFactory.IID)
            Printing3DMultiplePropertyMaterialGroup.__IPrinting3DMultiplePropertyMaterialGroupFactory := IPrinting3DMultiplePropertyMaterialGroupFactory(factoryPtr)
        }

        return Printing3DMultiplePropertyMaterialGroup.__IPrinting3DMultiplePropertyMaterialGroupFactory.Create(MaterialGroupId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a list of property-material combinations. Each combination is defined by listing the index of an item from one material group with the index of an item from a secondary material group. The index values are specified in the same order as the material groups listed in [MaterialGroupIndices](printing3dmultiplepropertymaterialgroup_materialgroupindices.md).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmultiplepropertymaterialgroup.multipleproperties
     * @type {IVector<Printing3DMultiplePropertyMaterial>} 
     */
    MultipleProperties {
        get => this.get_MultipleProperties()
    }

    /**
     * Gets an ordered list of material groups (**MaterialGroupId** values) that are used to define property-material combinations in the multi-property group. The order of material groups is maintained in the combinations defined by [MultipleProperties](printing3dmultiplepropertymaterialgroup_multipleproperties.md).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmultiplepropertymaterialgroup.materialgroupindices
     * @type {IVector<Integer>} 
     */
    MaterialGroupIndices {
        get => this.get_MaterialGroupIndices()
    }

    /**
     * Gets the identifier (ID) of the multi-property material group.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmultiplepropertymaterialgroup.materialgroupid
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
     * @returns {IVector<Printing3DMultiplePropertyMaterial>} 
     */
    get_MultipleProperties() {
        if (!this.HasProp("__IPrinting3DMultiplePropertyMaterialGroup")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMultiplePropertyMaterialGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMultiplePropertyMaterialGroup := IPrinting3DMultiplePropertyMaterialGroup(outPtr)
        }

        return this.__IPrinting3DMultiplePropertyMaterialGroup.get_MultipleProperties()
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_MaterialGroupIndices() {
        if (!this.HasProp("__IPrinting3DMultiplePropertyMaterialGroup")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMultiplePropertyMaterialGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMultiplePropertyMaterialGroup := IPrinting3DMultiplePropertyMaterialGroup(outPtr)
        }

        return this.__IPrinting3DMultiplePropertyMaterialGroup.get_MaterialGroupIndices()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaterialGroupId() {
        if (!this.HasProp("__IPrinting3DMultiplePropertyMaterialGroup")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMultiplePropertyMaterialGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMultiplePropertyMaterialGroup := IPrinting3DMultiplePropertyMaterialGroup(outPtr)
        }

        return this.__IPrinting3DMultiplePropertyMaterialGroup.get_MaterialGroupId()
    }

;@endregion Instance Methods
}
