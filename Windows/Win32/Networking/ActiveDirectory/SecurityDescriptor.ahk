#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the security descriptor of the task.
 * @remarks
 * For scripting development, the security descriptor of a task is specified using the [**RegistrationInfo.SecurityDescriptor**](registrationinfo-securitydescriptor.md) property.
 * 
 * For C++ development, the security descriptor of a task is specified using the [**IRegistrationInfo::SecurityDescriptor**](/windows/desktop/api/taskschd/nf-taskschd-iregistrationinfo-get_securitydescriptor) property.
 * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-securitydescriptor-registrationinfotype-element
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct SecurityDescriptor {
    #StructPack 1

}
