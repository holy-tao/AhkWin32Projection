#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DCompositeMaterial.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a composite material that's defined by a mixture of base materials.
 * @remarks
 * Each composite material is defined by a mixture of base materials that are listed in the specified base material group ([MaterialGroupId](printing3dcompositematerialgroup_materialgroupid.md)). The index values of possible base materials from that material group are specified in [MaterialIndices](printing3dcompositematerialgroup_materialindices.md). Each mixture is defined by listing the proportion of the overall mixture for each base material (values between 0 and 1). The mixtures of base materials are specified in [Composites](printing3dcompositematerialgroup_composites.md), where the proportion values are specified in the same order as the base materials in [MaterialIndices](printing3dcompositematerialgroup_materialindices.md).
 * 
 * This class corresponds to the `<composite>` element in the 3D Manufacturing Format (3MF) specification. For more info, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcompositematerial
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DCompositeMaterial extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DCompositeMaterial

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DCompositeMaterial.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the mixture of base materials used in the composite material. Each mixture is defined by listing the proportion of the overall mixture for each base material (values between 0 and 1).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcompositematerial.values
     * @type {IVector<Float>} 
     */
    Values {
        get => this.get_Values()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [Printing3DCompositeMaterial](printing3dcompositematerial.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DCompositeMaterial")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<Float>} 
     */
    get_Values() {
        if (!this.HasProp("__IPrinting3DCompositeMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DCompositeMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DCompositeMaterial := IPrinting3DCompositeMaterial(outPtr)
        }

        return this.__IPrinting3DCompositeMaterial.get_Values()
    }

;@endregion Instance Methods
}
