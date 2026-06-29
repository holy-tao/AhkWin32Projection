#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the version number of the task.
 * @remarks
 * For scripting development, the version of a task is specified using [**RegistrationInfo.Version**](registrationinfo-version.md) property.
 * 
 * For C++ development, the version of a task is specified using [**IRegistrationInfo::Version**](/windows/desktop/api/taskschd/nf-taskschd-iregistrationinfo-get_version) property.
 * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-version-registrationinfotype-element
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct Version {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static V2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static V3 => 3
}
