#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the masking policy for a shadow.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiondropshadowsourcepolicy
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionDropShadowSourcePolicy extends Win32Enum{

    /**
     * Shadow defaults to rectangular shape or the mask provided.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Shadow uses a mask using the alpha value of the visual's brush.
     * @type {Integer (Int32)}
     */
    static InheritFromVisualContent => 1
}
