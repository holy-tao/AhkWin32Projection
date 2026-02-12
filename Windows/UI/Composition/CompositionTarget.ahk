#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionTarget.ahk
#Include .\ICompositionTargetFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the window on which to display the composition tree.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiontarget
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionTarget extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionTarget

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionTarget.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The root of the composition tree to display.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiontarget.root
     * @type {Visual} 
     */
    Root {
        get => this.get_Root()
        set => this.put_Root(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Visual} 
     */
    get_Root() {
        if (!this.HasProp("__ICompositionTarget")) {
            if ((queryResult := this.QueryInterface(ICompositionTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionTarget := ICompositionTarget(outPtr)
        }

        return this.__ICompositionTarget.get_Root()
    }

    /**
     * 
     * @param {Visual} value 
     * @returns {HRESULT} 
     */
    put_Root(value) {
        if (!this.HasProp("__ICompositionTarget")) {
            if ((queryResult := this.QueryInterface(ICompositionTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionTarget := ICompositionTarget(outPtr)
        }

        return this.__ICompositionTarget.put_Root(value)
    }

;@endregion Instance Methods
}
