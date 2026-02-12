#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how an animated property can be accessed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationpropertyaccessmode
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class AnimationPropertyAccessMode extends Win32Enum{

    /**
     * The property cannot be accessed.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The property can only be read.
     * @type {Integer (Int32)}
     */
    static ReadOnly => 1

    /**
     * The property can only be written to.
     * @type {Integer (Int32)}
     */
    static WriteOnly => 2

    /**
     * The property can be read or written to.
     * @type {Integer (Int32)}
     */
    static ReadWrite => 3
}
