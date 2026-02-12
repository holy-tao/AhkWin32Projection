#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the types of content that PlayReady can use in different scenarios.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndcontentidtype
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class NDContentIDType extends Win32Enum{

    /**
     * License key identifier.
     * @type {Integer (Int32)}
     */
    static KeyID => 1

    /**
     * **PlayReadyObject** can be one of the following two objects.
     * 
     * 
     * + A full PlayReady Object (PRO), which is a binary format defined by PlayReady.
     * + A raw XML WRMHeader.
     * Both of these types of objects are described in the *Supporting In-Home Content Distribution with PlayReady for Network Devices* document located on the [Microsoft PlayReady Documents](https://www.microsoft.com/PlayReady/documents/) Web page.
     * @type {Integer (Int32)}
     */
    static PlayReadyObject => 2

    /**
     * Custom object specific to the transmitter. It is expected that the transmitter will understand the data contained therein. PlayReady does not define a standard format for custom content identifiers.
     * @type {Integer (Int32)}
     */
    static Custom => 3
}
