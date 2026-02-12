#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICompositionDebugHeatMaps.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents heatmaps that show overdrawn areas of a composition UI.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.diagnostics.compositiondebugheatmaps
 * @namespace Windows.UI.Composition.Diagnostics
 * @version WindowsRuntime 1.4
 */
class CompositionDebugHeatMaps extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionDebugHeatMaps

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionDebugHeatMaps.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Hides the heatmap for the specified subtree.
     * @param {Visual} subtree The part of the visual tree for which to hide the heatmap.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.diagnostics.compositiondebugheatmaps.hide
     */
    Hide(subtree) {
        if (!this.HasProp("__ICompositionDebugHeatMaps")) {
            if ((queryResult := this.QueryInterface(ICompositionDebugHeatMaps.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionDebugHeatMaps := ICompositionDebugHeatMaps(outPtr)
        }

        return this.__ICompositionDebugHeatMaps.Hide(subtree)
    }

    /**
     * Shows a graphical representation of the GPU memory used by the app.
     * @param {Visual} subtree The part of the visual tree for which to show texture memory usage.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.diagnostics.compositiondebugheatmaps.showmemoryusage
     */
    ShowMemoryUsage(subtree) {
        if (!this.HasProp("__ICompositionDebugHeatMaps")) {
            if ((queryResult := this.QueryInterface(ICompositionDebugHeatMaps.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionDebugHeatMaps := ICompositionDebugHeatMaps(outPtr)
        }

        return this.__ICompositionDebugHeatMaps.ShowMemoryUsage(subtree)
    }

    /**
     * Highlights pixels affected by multiple visuals at the same time.
     * @param {Visual} subtree The part of the visual tree for which to show overdraw regions.
     * @param {Integer} contentKinds An enumeration value that specifies what type of content is shown on the overdraw heatmap.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.diagnostics.compositiondebugheatmaps.showoverdraw
     */
    ShowOverdraw(subtree, contentKinds) {
        if (!this.HasProp("__ICompositionDebugHeatMaps")) {
            if ((queryResult := this.QueryInterface(ICompositionDebugHeatMaps.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionDebugHeatMaps := ICompositionDebugHeatMaps(outPtr)
        }

        return this.__ICompositionDebugHeatMaps.ShowOverdraw(subtree, contentKinds)
    }

    /**
     * Highlights areas of the app UI that are producing updates.
     * @param {Visual} subtree The part of the visual tree for which to show redraw.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.diagnostics.compositiondebugheatmaps.showredraw
     */
    ShowRedraw(subtree) {
        if (!this.HasProp("__ICompositionDebugHeatMaps")) {
            if ((queryResult := this.QueryInterface(ICompositionDebugHeatMaps.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionDebugHeatMaps := ICompositionDebugHeatMaps(outPtr)
        }

        return this.__ICompositionDebugHeatMaps.ShowRedraw(subtree)
    }

;@endregion Instance Methods
}
