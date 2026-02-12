#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Grid.ahk
#Include .\ISwapChainBackgroundPanel.ahk
#Include .\ISwapChainBackgroundPanel2.ahk
#Include .\ISwapChainBackgroundPanelFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Implements a XAML layout surface target for Microsoft DirectX interoperation scenarios. This panel has some atypical restrictions on its usage within an app window; see Remarks.
  * 
  * > [!IMPORTANT]
  * > SwapChainBackgroundPanel may be altered or unavailable for releases after Windows 8.1. Instead, use [SwapChainPanel](swapchainpanel.md).
 * @remarks
 * > [!IMPORTANT]
 * > SwapChainBackgroundPanel is deprecated and may not be supported in future releases. Change any existing code that used SwapChainBackgroundPanel to use [SwapChainPanel](swapchainpanel.md) instead. There's no downside to using [SwapChainPanel](swapchainpanel.md); the API is new because it relies upon an upgrade in the internal rendering and composition systems that were introduced starting with Windows 8.1.
 * 
 * For most scenarios a [SwapChainPanel](swapchainpanel.md) will provide a more versatile Microsoft DirectX interop render surface than a SwapChainBackgroundPanel does. That's because a [SwapChainPanel](swapchainpanel.md) doesn't have many of the XAML-side composition limitations that are listed in the "Composition limitations" section below. For example you can apply a [RenderTransform](../windows.ui.xaml/uielement_rendertransform.md) to a [SwapChainPanel](swapchainpanel.md). For more info, see [DirectX and XAML interop](/previous-versions/windows/apps/hh825871(v=win.10)) and [SwapChainPanel](swapchainpanel.md).
 * 
 * A SwapChainBackgroundPanel is a [Grid](grid.md) subclass, so you can use [ColumnDefinitions](grid_columndefinitions.md) and [RowDefinitions](grid_rowdefinitions.md) properties to declare the panel's characteristics, and the attached properties of [Grid](grid.md) such as [Grid.Row](/uwp/api/windows.ui.xaml.controls.grid.row) and [Grid.Column](/uwp/api/windows.ui.xaml.controls.grid.column) on child elements to position those child elements in the layout.
 * 
 * For more info on how to use SwapChainBackgroundPanel, including sample code, see [DirectX and XAML interop](/previous-versions/windows/apps/hh825871(v=win.10)).
 * 
 * The SwapChainBackgroundPanel class does not inherit from the [Control](control.md) class, and you cannot force focus to this element. Events that rely on having focus, such as **KeyUp** and **KeyDown**, may have no effect.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swapchainbackgroundpanel
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SwapChainBackgroundPanel extends Grid {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISwapChainBackgroundPanel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISwapChainBackgroundPanel.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {SwapChainBackgroundPanel} 
     */
    static CreateInstance() {
        if (!SwapChainBackgroundPanel.HasProp("__ISwapChainBackgroundPanelFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwapChainBackgroundPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwapChainBackgroundPanelFactory.IID)
            SwapChainBackgroundPanel.__ISwapChainBackgroundPanelFactory := ISwapChainBackgroundPanelFactory(factoryPtr)
        }

        return SwapChainBackgroundPanel.__ISwapChainBackgroundPanelFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * > [!NOTE]
     * > [SwapChainBackgroundPanel](swapchainbackgroundpanel.md) may be altered or unavailable for releases after Windows 8.1 Instead, use [SwapChainPanel](swapchainpanel.md).
     * 
     * Creates a core input object that handles the input types as specified by the *deviceTypes* parameter.
     * @remarks
     * > [!IMPORTANT]
     * > You must call CreateCoreIndependentInputSource from a non-UI thread, otherwise this method will fail.
     * @param {Integer} deviceTypes A combined value of the enumeration.
     * @returns {CoreIndependentInputSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swapchainbackgroundpanel.createcoreindependentinputsource
     */
    CreateCoreIndependentInputSource(deviceTypes) {
        if (!this.HasProp("__ISwapChainBackgroundPanel2")) {
            if ((queryResult := this.QueryInterface(ISwapChainBackgroundPanel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwapChainBackgroundPanel2 := ISwapChainBackgroundPanel2(outPtr)
        }

        return this.__ISwapChainBackgroundPanel2.CreateCoreIndependentInputSource(deviceTypes)
    }

;@endregion Instance Methods
}
