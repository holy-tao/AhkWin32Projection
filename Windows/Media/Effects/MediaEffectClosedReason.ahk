#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the reason why a media effect was closed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.mediaeffectclosedreason
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class MediaEffectClosedReason extends Win32Enum{

    /**
     * The operation is complete.
     * @type {Integer (Int32)}
     */
    static Done => 0

    /**
     * An unknown error has occurred.
     * @type {Integer (Int32)}
     */
    static UnknownError => 1

    /**
     * The media effect does not support the required encoding format.
     * @type {Integer (Int32)}
     */
    static UnsupportedEncodingFormat => 2

    /**
     * The effect has been unloaded.
     * @type {Integer (Int32)}
     */
    static EffectCurrentlyUnloaded => 3
}
