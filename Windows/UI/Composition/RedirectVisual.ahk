#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContainerVisual.ahk
#Include .\IRedirectVisual.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a visual that gets its content from another visual.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.redirectvisual
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class RedirectVisual extends ContainerVisual {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRedirectVisual

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRedirectVisual.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the Visual that this RedirectVisual gets its content from.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.redirectvisual.source
     * @type {Visual} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
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
    get_Source() {
        if (!this.HasProp("__IRedirectVisual")) {
            if ((queryResult := this.QueryInterface(IRedirectVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRedirectVisual := IRedirectVisual(outPtr)
        }

        return this.__IRedirectVisual.get_Source()
    }

    /**
     * 
     * @param {Visual} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        if (!this.HasProp("__IRedirectVisual")) {
            if ((queryResult := this.QueryInterface(IRedirectVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRedirectVisual := IRedirectVisual(outPtr)
        }

        return this.__IRedirectVisual.put_Source(value)
    }

;@endregion Instance Methods
}
