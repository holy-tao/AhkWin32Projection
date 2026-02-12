#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICompositionTarget.ahk
#Include .\ICompositionTargetStatics3.ahk
#Include .\ICompositionTargetStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the composited display surface for an app. This class provides application-wide rendering events.
 * @remarks
 * CompositionTarget events are useful for rendering scenarios like:
 * 
 * - synchronizing [DirectX interop rendering](/windows/uwp/gaming/directx-and-xaml-interop) using the [Rendering](compositiontarget_rendering.md) event
 * 
 * - measuring frame rendering time using the [Rendered](compositiontarget_rendered.md) event
 * 
 * - regenerating custom visual content on screen in response to the [SurfaceContentsLost](compositiontarget_surfacecontentslost.md) event, for example regenerating a [RenderTargetBitmap](../windows.ui.xaml.media.imaging/rendertargetbitmap.md) or DirectX interop content in a [SurfaceImageSource](../windows.ui.xaml.media.imaging/surfaceimagesource.md) 
 * 
 * For scenarios that don't involve custom rendering or frame time measurement you probably won't need CompositionTarget and can just rely on the XAML rendering system running and performing all your composition and layout.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositiontarget
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class CompositionTarget extends IInspectable {
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

;@region Static Methods
    /**
     * 
     * @param {EventHandler<RenderedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_Rendered(handler) {
        if (!CompositionTarget.HasProp("__ICompositionTargetStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.CompositionTarget")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionTargetStatics3.IID)
            CompositionTarget.__ICompositionTargetStatics3 := ICompositionTargetStatics3(factoryPtr)
        }

        return CompositionTarget.__ICompositionTargetStatics3.add_Rendered(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_Rendered(token) {
        if (!CompositionTarget.HasProp("__ICompositionTargetStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.CompositionTarget")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionTargetStatics3.IID)
            CompositionTarget.__ICompositionTargetStatics3 := ICompositionTargetStatics3(factoryPtr)
        }

        return CompositionTarget.__ICompositionTargetStatics3.remove_Rendered(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_Rendering(handler) {
        if (!CompositionTarget.HasProp("__ICompositionTargetStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.CompositionTarget")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionTargetStatics.IID)
            CompositionTarget.__ICompositionTargetStatics := ICompositionTargetStatics(factoryPtr)
        }

        return CompositionTarget.__ICompositionTargetStatics.add_Rendering(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_Rendering(token) {
        if (!CompositionTarget.HasProp("__ICompositionTargetStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.CompositionTarget")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionTargetStatics.IID)
            CompositionTarget.__ICompositionTargetStatics := ICompositionTargetStatics(factoryPtr)
        }

        return CompositionTarget.__ICompositionTargetStatics.remove_Rendering(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_SurfaceContentsLost(handler) {
        if (!CompositionTarget.HasProp("__ICompositionTargetStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.CompositionTarget")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionTargetStatics.IID)
            CompositionTarget.__ICompositionTargetStatics := ICompositionTargetStatics(factoryPtr)
        }

        return CompositionTarget.__ICompositionTargetStatics.add_SurfaceContentsLost(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_SurfaceContentsLost(token) {
        if (!CompositionTarget.HasProp("__ICompositionTargetStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.CompositionTarget")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionTargetStatics.IID)
            CompositionTarget.__ICompositionTargetStatics := ICompositionTargetStatics(factoryPtr)
        }

        return CompositionTarget.__ICompositionTargetStatics.remove_SurfaceContentsLost(token)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
