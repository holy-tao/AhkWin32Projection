#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPalmRejectionDelayZonePreview.ahk
#Include ..\..\..\..\Foundation\IClosable.ahk
#Include .\IPalmRejectionDelayZonePreviewStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides functionality to support palm rejection around an inking region.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.preview.palmrejectiondelayzonepreview
 * @namespace Windows.UI.Input.Inking.Preview
 * @version WindowsRuntime 1.4
 */
class PalmRejectionDelayZonePreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPalmRejectionDelayZonePreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPalmRejectionDelayZonePreview.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a palm rejection region based on the specified inking panel.
     * @remarks
     * Use [PalmRejectionDelayZonePreview.CreateForVisual(Visual inputPanelVisual, Rect inputPanelRect, Visual viewportVisual, Rect viewportRect)](palmrejectiondelayzonepreview_createforvisual_1317285844.md) if you need to specify an enclosing viewport for your inking region.
     * 
     * If *inputPanelRect* changes, you must call [PalmRejectionDelayZonePreview.Dispose](/uwp/api/windows.ui.input.inking.preview.palmrejectiondelayzonepreview.dispose) to release the [PalmRejectionDelayZonePreview](palmrejectiondelayzonepreview.md) object and then call [CreateForVisual](/uwp/api/windows.ui.input.inking.preview.palmrejectiondelayzonepreview.createforvisual) with the updated rect to create a new palm rejection region.
     * @param {Visual} inputPanelVisual The visual object associated with the inking panel.
     * @param {RECT} inputPanelRect The region where palm rejection is to be enabled, relative to the coordinate space of the *inputPanelVisual*.
     * @returns {PalmRejectionDelayZonePreview} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.preview.palmrejectiondelayzonepreview.createforvisual
     */
    static CreateForVisual(inputPanelVisual, inputPanelRect) {
        if (!PalmRejectionDelayZonePreview.HasProp("__IPalmRejectionDelayZonePreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.Preview.PalmRejectionDelayZonePreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPalmRejectionDelayZonePreviewStatics.IID)
            PalmRejectionDelayZonePreview.__IPalmRejectionDelayZonePreviewStatics := IPalmRejectionDelayZonePreviewStatics(factoryPtr)
        }

        return PalmRejectionDelayZonePreview.__IPalmRejectionDelayZonePreviewStatics.CreateForVisual(inputPanelVisual, inputPanelRect)
    }

    /**
     * Creates a palm rejection region based on the specified inking panel.
     * @remarks
     * Use [PalmRejectionDelayZonePreview.CreateForVisual(Visual inputPanelVisual, Rect inputPanelRect, Visual viewportVisual, Rect viewportRect)](palmrejectiondelayzonepreview_createforvisual_1317285844.md) if you need to specify an enclosing viewport for your inking region.
     * 
     * If *inputPanelRect* changes, you must call [PalmRejectionDelayZonePreview.Dispose](/uwp/api/windows.ui.input.inking.preview.palmrejectiondelayzonepreview.dispose) to release the [PalmRejectionDelayZonePreview](palmrejectiondelayzonepreview.md) object and then call [CreateForVisual](/uwp/api/windows.ui.input.inking.preview.palmrejectiondelayzonepreview.createforvisual) with the updated rect to create a new palm rejection region.
     * @param {Visual} inputPanelVisual The visual object associated with the inking panel.
     * @param {RECT} inputPanelRect The region where palm rejection is to be enabled, relative to the coordinate space of the *inputPanelVisual*.
     * @param {Visual} viewportVisual 
     * @param {RECT} viewportRect 
     * @returns {PalmRejectionDelayZonePreview} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.preview.palmrejectiondelayzonepreview.createforvisual
     */
    static CreateForVisualWithViewportClip(inputPanelVisual, inputPanelRect, viewportVisual, viewportRect) {
        if (!PalmRejectionDelayZonePreview.HasProp("__IPalmRejectionDelayZonePreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.Preview.PalmRejectionDelayZonePreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPalmRejectionDelayZonePreviewStatics.IID)
            PalmRejectionDelayZonePreview.__IPalmRejectionDelayZonePreviewStatics := IPalmRejectionDelayZonePreviewStatics(factoryPtr)
        }

        return PalmRejectionDelayZonePreview.__IPalmRejectionDelayZonePreviewStatics.CreateForVisualWithViewportClip(inputPanelVisual, inputPanelRect, viewportVisual, viewportRect)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Releases all system resources associated with the [PalmRejectionDelayZonePreview](palmrejectiondelayzonepreview.md) object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.preview.palmrejectiondelayzonepreview.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
