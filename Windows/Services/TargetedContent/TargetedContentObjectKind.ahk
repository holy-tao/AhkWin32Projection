#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the types of values supported by a [TargetedContentObject](targetedcontentobject.md) object in a [TargetedContentContainer](targetedcontentcontainer.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentobjectkind
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentObjectKind extends Win32Enum{

    /**
     * A [TargetedContentCollection](targetedcontentcollection.md) object.
     * @type {Integer (Int32)}
     */
    static Collection => 0

    /**
     * A [TargetedContentItem](targetedcontentitem.md) object.
     * @type {Integer (Int32)}
     */
    static Item => 1

    /**
     * A [TargetedContentValue](targetedcontentvalue.md) object.
     * @type {Integer (Int32)}
     */
    static Value => 2
}
