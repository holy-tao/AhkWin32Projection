#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICompositionPath.ahk
#Include .\ICompositionPathFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a series of connected lines and curves.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpath
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionPath extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionPath

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionPath.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the CompositionPath class.
     * @param {IGeometrySource2D} source The source of the path data.
     * @returns {CompositionPath} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpath.#ctor
     */
    static Create(source) {
        if (!CompositionPath.HasProp("__ICompositionPathFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.CompositionPath")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionPathFactory.IID)
            CompositionPath.__ICompositionPathFactory := ICompositionPathFactory(factoryPtr)
        }

        return CompositionPath.__ICompositionPathFactory.Create(source)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
