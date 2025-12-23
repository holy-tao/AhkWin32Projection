#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the security descriptor of the task.
 * @remarks
 * For scripting development, the security descriptor of a task is specified using the [**RegistrationInfo.SecurityDescriptor**](registrationinfo-securitydescriptor.md) property.
 * 
 * For C++ development, the security descriptor of a task is specified using the [**IRegistrationInfo::SecurityDescriptor**](/windows/desktop/api/taskschd/nf-taskschd-iregistrationinfo-get_securitydescriptor) property.
 * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-securitydescriptor-registrationinfotype-element
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class SecurityDescriptor extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
