#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Batch types for [CompositionCommitBatch](compositioncommitbatch.md) and [CompositionScopedBatch](compositionscopedbatch.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionbatchtypes
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionBatchTypes extends Win32BitflagEnum{

    /**
     * None.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The batch contains animations.
     * @type {Integer (UInt32)}
     */
    static Animation => 1

    /**
     * The batch contains effects.
     * @type {Integer (UInt32)}
     */
    static Effect => 2

    /**
     * The batch contains an infinite animation.
     * @type {Integer (UInt32)}
     */
    static InfiniteAnimation => 4

    /**
     * The batch contains all animations.
     * @type {Integer (UInt32)}
     */
    static AllAnimations => 5
}
