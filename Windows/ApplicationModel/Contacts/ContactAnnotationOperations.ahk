#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the types of operations you can perform with a [Contact](contact.md).
 * @remarks
 * Use the OR operator to combine these values together into a single bit field.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationoperations
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactAnnotationOperations extends Win32BitflagEnum{

    /**
     * None
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Get the contact profile.
     * @type {Integer (UInt32)}
     */
    static ContactProfile => 1

    /**
     * Send an SMS/MMS message.
     * @type {Integer (UInt32)}
     */
    static Message => 2

    /**
     * Make and audio call.
     * @type {Integer (UInt32)}
     */
    static AudioCall => 4

    /**
     * Make a video call.
     * @type {Integer (UInt32)}
     */
    static VideoCall => 8

    /**
     * Access social media feeds.
     * @type {Integer (UInt32)}
     */
    static SocialFeeds => 16

    /**
     * Share the contact.
     * @type {Integer (UInt32)}
     */
    static Share => 32

    /**
     * @type {Integer (UInt32)}
     */
    static Activity => 64
}
