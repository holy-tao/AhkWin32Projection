#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify whether the element was added to or removed from the live visual tree.
 * @remarks
 * <b>VisualMutationType</b> is used by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/nn-xamlom-ivisualtreeservicecallback">IVisualTreeServiceCallback</a> to indicate to the callback
 * whether the element is entering or leaving the live visual tree.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ne-xamlom-visualmutationtype
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct VisualMutationType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The child element was added to the visual tree of the parent element.
     * @type {Integer (Int32)}
     */
    static Add => 0

    /**
     * The child element was removed from the visual tree of the parent element.
     * @type {Integer (Int32)}
     */
    static Remove => 1
}
