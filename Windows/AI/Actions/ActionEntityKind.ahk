#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the entity subclass of an [ActionEntity](actionentity.md).
 * @remarks
 * This enumeration is used by the [ActionEntity.Kind](actionentity_kind.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentitykind
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ActionEntityKind extends Win32Enum{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The entity is a [DocumentActionEntity](documentactionentity.md).
     * @type {Integer (Int32)}
     */
    static Document => 1

    /**
     * The entity is a [FileActionEntity](fileactionentity.md).
     * @type {Integer (Int32)}
     */
    static File => 2

    /**
     * The entity is a [PhotoActionEntity](photoactionentity.md).
     * @type {Integer (Int32)}
     */
    static Photo => 3

    /**
     * The entity is a [TextActionEntity](textactionentity.md).
     * @type {Integer (Int32)}
     */
    static Text => 4

    /**
     * The entity is a [StreamingTextActionEntity](streamingtextactionentity.md).
     * @type {Integer (Int32)}
     */
    static StreamingText => 5

    /**
     * The entity is a [RemoteFileActionEntity](remotefileactionentity.md).
     * @type {Integer (Int32)}
     */
    static RemoteFile => 6

    /**
     * The entity is a [TableActionEntity](tableactionentity.md).
     * @type {Integer (Int32)}
     */
    static Table => 7

    /**
     * The entity is a [ContactActionEntity](contactactionentity.md).
     * @type {Integer (Int32)}
     */
    static Contact => 8

    /**
     * The entity is a [UriActionEntity](uriactionentity.md).
     * @type {Integer (Int32)}
     */
    static Uri => 9

    /**
     * 
     * @type {Integer (Int32)}
     */
    static Array => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static Appointment => 11

    /**
     * 
     * @type {Integer (Int32)}
     */
    static Date => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CustomText => 13
}
