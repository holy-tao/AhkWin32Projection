#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionProjectedShadowReceiver.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an object that can have a projected shadow cast on it.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowreceiver
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionProjectedShadowReceiver extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionProjectedShadowReceiver

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionProjectedShadowReceiver.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the Visual that the shadow is cast on.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowreceiver.receivingvisual
     * @type {Visual} 
     */
    ReceivingVisual {
        get => this.get_ReceivingVisual()
        set => this.put_ReceivingVisual(value)
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
    get_ReceivingVisual() {
        if (!this.HasProp("__ICompositionProjectedShadowReceiver")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadowReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadowReceiver := ICompositionProjectedShadowReceiver(outPtr)
        }

        return this.__ICompositionProjectedShadowReceiver.get_ReceivingVisual()
    }

    /**
     * 
     * @param {Visual} value 
     * @returns {HRESULT} 
     */
    put_ReceivingVisual(value) {
        if (!this.HasProp("__ICompositionProjectedShadowReceiver")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadowReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadowReceiver := ICompositionProjectedShadowReceiver(outPtr)
        }

        return this.__ICompositionProjectedShadowReceiver.put_ReceivingVisual(value)
    }

;@endregion Instance Methods
}
