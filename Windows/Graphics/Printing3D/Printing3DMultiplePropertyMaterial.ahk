#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DMultiplePropertyMaterial.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a combination of properties and/or materials from the material groups specified in ([MaterialGroupIndices](printing3dmultiplepropertymaterialgroup_materialgroupindices.md)).
 * @remarks
 * Each multi-property material is defined by a combination of properties and/or materials that are listed in the specified material groups ([MaterialGroupIndices](printing3dmultiplepropertymaterialgroup_materialgroupindices.md)). Each combination is defined by listing the index of an item from one material group with the index of an item from a secondary material group. The combinations are specified in [MultipleProperties](printing3dmultiplepropertymaterialgroup_multipleproperties.md), where the index values are specified in the same order as the material groups listed in [MaterialGroupIndices](printing3dmultiplepropertymaterialgroup_materialgroupindices.md).
 * 
 * This class corresponds to the `<multi>` element in the 3D Manufacturing Format (3MF) specification. For more info, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmultiplepropertymaterial
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DMultiplePropertyMaterial extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DMultiplePropertyMaterial

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DMultiplePropertyMaterial.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the indices of the properties and/or materials combined in the multi-property material. Each combination is defined by listing the index of an item from one material group with the index of an item from a secondary material group. The index values are specified in the same order as the material groups listed in [MaterialGroupIndices](printing3dmultiplepropertymaterialgroup_materialgroupindices.md).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmultiplepropertymaterial.materialindices
     * @type {IVector<Integer>} 
     */
    MaterialIndices {
        get => this.get_MaterialIndices()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [Printing3DMultiplePropertyMaterial](printing3dmultiplepropertymaterial.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DMultiplePropertyMaterial")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_MaterialIndices() {
        if (!this.HasProp("__IPrinting3DMultiplePropertyMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMultiplePropertyMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMultiplePropertyMaterial := IPrinting3DMultiplePropertyMaterial(outPtr)
        }

        return this.__IPrinting3DMultiplePropertyMaterial.get_MaterialIndices()
    }

;@endregion Instance Methods
}
