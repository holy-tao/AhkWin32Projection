#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeneratorPositionHelper.ahk
#Include .\IGeneratorPositionHelperStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides utility methods for evaluating and creating [GeneratorPosition](generatorposition.md) structure values. C# and Microsoft Visual Basic code should use members of [GeneratorPosition](generatorposition.md) instead.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.generatorpositionhelper
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class GeneratorPositionHelper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeneratorPositionHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeneratorPositionHelper.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [GeneratorPosition](generatorposition.md) value using provided values for index and offset. C# and Microsoft Visual Basic code should use [GeneratorPosition(Int32,Int32)](/dotnet/api/windows.ui.xaml.controls.primitives.generatorposition.-ctor) instead.
     * @param {Integer} index The index value to create with.
     * @param {Integer} offset The offset value to create with.
     * @returns {GeneratorPosition} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.generatorpositionhelper.fromindexandoffset
     */
    static FromIndexAndOffset(index, offset) {
        if (!GeneratorPositionHelper.HasProp("__IGeneratorPositionHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GeneratorPositionHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeneratorPositionHelperStatics.IID)
            GeneratorPositionHelper.__IGeneratorPositionHelperStatics := IGeneratorPositionHelperStatics(factoryPtr)
        }

        return GeneratorPositionHelper.__IGeneratorPositionHelperStatics.FromIndexAndOffset(index, offset)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
