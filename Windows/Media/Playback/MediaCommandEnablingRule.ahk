#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies a rule for enabling a System Media Transport Controls command.
 * @remarks
 * Set the [EnablingRule](mediaplaybackcommandmanagercommandbehavior_enablingrule.md) property of a [MediaPlaybackCommandManagerCommandBehavior](mediaplaybackcommandmanagercommandbehavior.md) object to specify the enabling rule for a System Media Transport Controls command that is managed by a [MediaPlaybackCommandManager](mediaplaybackcommandmanager.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediacommandenablingrule
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaCommandEnablingRule extends Win32Enum{

    /**
     * The system dynamically determines whether the command is enabled.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * The command is always enabled.
     * @type {Integer (Int32)}
     */
    static Always => 1

    /**
     * The command is never enabled.
     * @type {Integer (Int32)}
     */
    static Never => 2
}
