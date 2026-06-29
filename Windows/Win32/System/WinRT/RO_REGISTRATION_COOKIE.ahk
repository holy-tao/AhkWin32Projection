#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents activation factories that are registered by calling the RoRegisterActivationFactories function.
 * @remarks
 * The [**RoRegisterActivationFactories**](/windows/win32/api/roapi/nf-roapi-roregisteractivationfactories) function returns a **RO\_REGISTRATION\_COOKIE** when a activatable class factories are registered with the Windows Runtime. The [**RoRevokeActivationFactories**](/windows/win32/api/roapi/nf-roapi-rorevokeactivationfactories) function uses the cookie to remove the class factories.
 * @see https://learn.microsoft.com/windows/win32/WinRT/ro-registration-cookie
 * @namespace Windows.Win32.System.WinRT
 */
export default struct RO_REGISTRATION_COOKIE {
    value : IntPtr

    __value {
        set {
            if (value is RO_REGISTRATION_COOKIE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    __New(value := 0) {
        this.value := value
    }
}
