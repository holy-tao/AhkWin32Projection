#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AppPolicyThreadInitializationType enumeration indicates the kind of initialization that should be automatically performed for a process when beginthread[ex] creates a thread.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-apppolicythreadinitializationtype
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct AppPolicyThreadInitializationType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that no initialization should be performed.
     * @type {Integer (Int32)}
     */
    static AppPolicyThreadInitializationType_None => 0

    /**
     * Indicates that Windows Runtime initialization should be performed.
     * @type {Integer (Int32)}
     */
    static AppPolicyThreadInitializationType_InitializeWinRT => 1
}
