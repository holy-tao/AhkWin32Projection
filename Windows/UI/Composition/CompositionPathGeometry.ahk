#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionGeometry.ahk
#Include .\ICompositionPathGeometry.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a series of connected lines and curves.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpathgeometry
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionPathGeometry extends CompositionGeometry {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionPathGeometry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionPathGeometry.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the data that defines the lines and curves of the path.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpathgeometry.path
     * @type {CompositionPath} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CompositionPath} 
     */
    get_Path() {
        if (!this.HasProp("__ICompositionPathGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionPathGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPathGeometry := ICompositionPathGeometry(outPtr)
        }

        return this.__ICompositionPathGeometry.get_Path()
    }

    /**
     * 
     * @param {CompositionPath} value 
     * @returns {HRESULT} 
     */
    put_Path(value) {
        if (!this.HasProp("__ICompositionPathGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionPathGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPathGeometry := ICompositionPathGeometry(outPtr)
        }

        return this.__ICompositionPathGeometry.put_Path(value)
    }

;@endregion Instance Methods
}
