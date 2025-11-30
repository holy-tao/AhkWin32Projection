#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether the element was added to or removed from the live visual tree.
 * @remarks
 * 
 * <b>VisualMutationType</b> is used by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/nn-xamlom-ivisualtreeservicecallback">IVisualTreeServiceCallback</a> to indicate to the callback
 * whether the element is entering or leaving the live visual tree.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xamlom/ne-xamlom-visualmutationtype
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class VisualMutationType extends Win32Enum{

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
