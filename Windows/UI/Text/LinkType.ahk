#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the link type of a range of text.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.linktype
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class LinkType extends Win32Enum{

    /**
     * A mix of link and nonlink attributes.
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Not a link.
     * @type {Integer (Int32)}
     */
    static NotALink => 1

    /**
     * A link specified by the client; that is, not an autolink or a friendly-name link.
     * @type {Integer (Int32)}
     */
    static ClientLink => 2

    /**
     * The name part of a friendly-name link. The name is the part that is displayed.
     * @type {Integer (Int32)}
     */
    static FriendlyLinkName => 3

    /**
     * The address Uniform Resource Identifier (URI) part of friendly-name link. The address it the part that is sent when the user clicks the name.
     * @type {Integer (Int32)}
     */
    static FriendlyLinkAddress => 4

    /**
     * A Uniform Resource Identifier (URI) that is automatically recognized.
     * @type {Integer (Int32)}
     */
    static AutoLink => 5

    /**
     * An email address that is automatically recognized.
     * @type {Integer (Int32)}
     */
    static AutoLinkEmail => 6

    /**
     * A phone number that is automatically recognized.
     * @type {Integer (Int32)}
     */
    static AutoLinkPhone => 7

    /**
     * A file name, including the full path, that is automatically recognized.
     * @type {Integer (Int32)}
     */
    static AutoLinkPath => 8
}
