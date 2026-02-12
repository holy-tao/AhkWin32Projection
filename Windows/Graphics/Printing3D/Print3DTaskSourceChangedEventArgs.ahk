#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrint3DTaskSourceChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [SourceChanged](print3dtask_sourcechanged.md) event.
 * @remarks
 * This API is designed for use with 3D Manufacturing Format (3MF) packages. For more info about 3MF, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dtasksourcechangedeventargs
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Print3DTaskSourceChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrint3DTaskSourceChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrint3DTaskSourceChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the updated 3D print package from the workflow.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dtasksourcechangedeventargs.source
     * @type {Printing3D3MFPackage} 
     */
    Source {
        get => this.get_Source()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Printing3D3MFPackage} 
     */
    get_Source() {
        if (!this.HasProp("__IPrint3DTaskSourceChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrint3DTaskSourceChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DTaskSourceChangedEventArgs := IPrint3DTaskSourceChangedEventArgs(outPtr)
        }

        return this.__IPrint3DTaskSourceChangedEventArgs.get_Source()
    }

;@endregion Instance Methods
}
