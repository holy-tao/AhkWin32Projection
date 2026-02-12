#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the types of interaction values supported by each [TargetedContentItem](targetedcontentitem.md) object in a [TargetedContentContainer](targetedcontentcontainer.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentinteraction
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentInteraction extends Win32Enum{

    /**
     * An impression, such as any time a user opens an app or website.
     * 
     * > [!NOTE]
     * > Different apps can have different rules for reporting impressions.
     * @type {Integer (Int32)}
     */
    static Impression => 0

    /**
     * A click-through action, such as when a user clicks on a specific link.
     * @type {Integer (Int32)}
     */
    static ClickThrough => 1

    /**
     * A hover action over the item.
     * @type {Integer (Int32)}
     */
    static Hover => 2

    /**
     * A like action.
     * @type {Integer (Int32)}
     */
    static Like => 3

    /**
     * A dislike action.
     * @type {Integer (Int32)}
     */
    static Dislike => 4

    /**
     * A dismiss action.
     * @type {Integer (Int32)}
     */
    static Dismiss => 5

    /**
     * Interaction indicates ineligibility.
     * @type {Integer (Int32)}
     */
    static Ineligible => 6

    /**
     * An accept action.
     * @type {Integer (Int32)}
     */
    static Accept => 7

    /**
     * A decline action.
     * @type {Integer (Int32)}
     */
    static Decline => 8

    /**
     * A defer action.
     * @type {Integer (Int32)}
     */
    static Defer => 9

    /**
     * A cancel action.
     * @type {Integer (Int32)}
     */
    static Canceled => 10

    /**
     * A conversion action, such as when a user becomes a paying customer.
     * @type {Integer (Int32)}
     */
    static Conversion => 11

    /**
     * Interaction indicates an opportunity.
     * @type {Integer (Int32)}
     */
    static Opportunity => 12
}
