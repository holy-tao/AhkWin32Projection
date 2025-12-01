#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines a channel to which providers can log events.
 * @remarks
 * If the channel's name follows the channel naming convention, the Windows Event Viewer will list the channel using the string that follows the backslash. For example, if the channel name is Company-Product-Component/Operational, then the Event Viewer will list the channel as Operational under the Company-Product-Component provider. Otherwise, the entire channel name is shown under the provider. The localized display name is used if provided.
 * @see https://learn.microsoft.com/windows/win32/WES/eventmanifestschema-channeltype-complextype
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ChannelType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ChannelTypeNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static ChannelTypeOther => 1

    /**
     * @type {Integer (Int32)}
     */
    static ChannelTypeVideo => 2

    /**
     * @type {Integer (Int32)}
     */
    static ChannelTypeAudio => 4

    /**
     * @type {Integer (Int32)}
     */
    static ChannelTypeText => 8

    /**
     * @type {Integer (Int32)}
     */
    static ChannelTypeSubtitles => 16

    /**
     * @type {Integer (Int32)}
     */
    static ChannelTypeCaptions => 32

    /**
     * @type {Integer (Int32)}
     */
    static ChannelTypeSuperimpose => 64

    /**
     * @type {Integer (Int32)}
     */
    static ChannelTypeData => 128
}
