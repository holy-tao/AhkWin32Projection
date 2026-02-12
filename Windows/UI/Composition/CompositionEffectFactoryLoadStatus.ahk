#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The status of the asynchronous compilation of a shader for an effect description.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneffectfactoryloadstatus
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionEffectFactoryLoadStatus extends Win32Enum{

    /**
     * The operation was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The effect was too complex.
     * @type {Integer (Int32)}
     */
    static EffectTooComplex => 1

    /**
     * The operation is still pending.
     * @type {Integer (Int32)}
     */
    static Pending => 2

    /**
     * Other error.
     * @type {Integer (Int32)}
     */
    static Other => -1
}
