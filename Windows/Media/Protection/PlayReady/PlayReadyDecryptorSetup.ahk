#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines decryptor setup requirements indicating when to acquire licenses for the content.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadydecryptorsetup
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadyDecryptorSetup extends Win32Enum{

    /**
     * Indicates the DECRYPTORSETUP is not present in the rights management header. This indicates that a player app can guarantee that the license (chain) for the content is available prior to setting up the media graph.
     * @type {Integer (Int32)}
     */
    static Uninitialized => 0

    /**
     * Indicates that a player app cannot guarantee that the license (chain) for the content is available prior to setting up the media graph.
     * @type {Integer (Int32)}
     */
    static OnDemand => 1
}
