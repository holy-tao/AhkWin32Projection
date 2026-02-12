#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionShape.ahk
#Include .\ICompositionContainerShape.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a container for CompositionShapes, used to group items that share 2D transforms.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioncontainershape
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionContainerShape extends CompositionShape {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionContainerShape

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionContainerShape.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of CompostionShapes in this container.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioncontainershape.shapes
     * @type {CompositionShapeCollection} 
     */
    Shapes {
        get => this.get_Shapes()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CompositionShapeCollection} 
     */
    get_Shapes() {
        if (!this.HasProp("__ICompositionContainerShape")) {
            if ((queryResult := this.QueryInterface(ICompositionContainerShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionContainerShape := ICompositionContainerShape(outPtr)
        }

        return this.__ICompositionContainerShape.get_Shapes()
    }

;@endregion Instance Methods
}
