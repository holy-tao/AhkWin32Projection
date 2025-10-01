#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the version number of the task.
 * @remarks
 * For scripting development, the version of a task is specified using [**RegistrationInfo.Version**](registrationinfo-version.md) property.
  * 
  * For C++ development, the version of a task is specified using [**IRegistrationInfo::Version**](/windows/desktop/api/taskschd/nf-taskschd-iregistrationinfo-get_version) property.
 * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-version-registrationinfotype-element
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Version{

    /**
     * @type {Integer (UInt32)}
     */
    static V2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static V3 => 3
}
