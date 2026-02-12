#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the levels of availability for the content in a [TargetedContentContainer](targetedcontentcontainer.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentavailability
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentAvailability extends Win32Enum{

    /**
     * No content or files are available.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Content is available but files aren't available yet.
     * @type {Integer (Int32)}
     */
    static Partial => 1

    /**
     * All content and files are available.
     * @type {Integer (Int32)}
     */
    static All => 2
}
