#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines a channel to which providers can log events.
 * @remarks
 * If the channel's name follows the channel naming convention, the Windows Event Viewer will list the channel using the string that follows the backslash. For example, if the channel name is Company-Product-Component/Operational, then the Event Viewer will list the channel as Operational under the Company-Product-Component provider. Otherwise, the entire channel name is shown under the provider. The localized display name is used if provided.
 * @see https://learn.microsoft.com/windows/win32/WES/eventmanifestschema-channeltype-complextype
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class ChannelType extends Win32Enum {

    /**
     * Native name: ChannelTypeNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: ChannelTypeOther
     * @type {Integer (Int32)}
     */
    static Other => 1

    /**
     * Native name: ChannelTypeVideo
     * @type {Integer (Int32)}
     */
    static Video => 2

    /**
     * Native name: ChannelTypeAudio
     * @type {Integer (Int32)}
     */
    static Audio => 4

    /**
     * Native name: ChannelTypeText
     * @type {Integer (Int32)}
     */
    static Text => 8

    /**
     * Native name: ChannelTypeSubtitles
     * @type {Integer (Int32)}
     */
    static Subtitles => 16

    /**
     * Native name: ChannelTypeCaptions
     * @type {Integer (Int32)}
     */
    static Captions => 32

    /**
     * Native name: ChannelTypeSuperimpose
     * @type {Integer (Int32)}
     */
    static Superimpose => 64

    /**
     * Native name: ChannelTypeData
     * @type {Integer (Int32)}
     */
    static Data => 128
}
