#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicCameraViewportParameters.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents per-viewport parameters for rendering holographic content.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccameraviewportparameters
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicCameraViewportParameters extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicCameraViewportParameters

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicCameraViewportParameters.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets vertices in NDC space that define the viewport area the user cannot see, given the headset's lens geometry.
     * @remarks
     * An app can improve performance by not rendering to the pixels covered by the hidden area mesh.
     * 
     * If it is more convenient to reason about the visible area rather than the hidden area, inspect the [VisibleAreaMesh](holographiccameraviewportparameters_visibleareamesh.md) property instead.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccameraviewportparameters.hiddenareamesh
     */
    HiddenAreaMesh {
        get => this.get_HiddenAreaMesh()
    }

    /**
     * Gets vertices in NDC space that define the viewport area the user can see, given the headset's lens geometry.
     * @remarks
     * An app can improve performance by only rendering to the pixels covered by the visible area mesh.
     * 
     * If it is more convenient to reason about the hidden area rather than the visible area, inspect the [HiddenAreaMesh](holographiccameraviewportparameters_hiddenareamesh.md) property instead.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccameraviewportparameters.visibleareamesh
     */
    VisibleAreaMesh {
        get => this.get_VisibleAreaMesh()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_HiddenAreaMesh(value) {
        if (!this.HasProp("__IHolographicCameraViewportParameters")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraViewportParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraViewportParameters := IHolographicCameraViewportParameters(outPtr)
        }

        return this.__IHolographicCameraViewportParameters.get_HiddenAreaMesh(value)
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_VisibleAreaMesh(value) {
        if (!this.HasProp("__IHolographicCameraViewportParameters")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraViewportParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraViewportParameters := IHolographicCameraViewportParameters(outPtr)
        }

        return this.__IHolographicCameraViewportParameters.get_VisibleAreaMesh(value)
    }

;@endregion Instance Methods
}
