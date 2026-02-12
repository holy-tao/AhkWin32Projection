#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the possible installation states for [TargetedContentValue.File](targetedcontentvalue_file.md)/[TargetedContentValue.Files](targetedcontentvalue_files.md) content in a [TargetedContentContainer](targetedcontentcontainer.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentappinstallationstate
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentAppInstallationState extends Win32Enum{

    /**
     * File(s) cannot be installed.
     * @type {Integer (Int32)}
     */
    static NotApplicable => 0

    /**
     * File(s) is not installed.
     * @type {Integer (Int32)}
     */
    static NotInstalled => 1

    /**
     * File(s) is installed.
     * @type {Integer (Int32)}
     */
    static Installed => 2
}
