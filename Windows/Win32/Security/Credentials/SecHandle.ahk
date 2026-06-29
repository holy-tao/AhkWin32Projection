#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a security handle.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sechandle
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct SecHandle {
    #StructPack 8

    /**
     * The lower 32 bits of the handle.
     */
    dwLower : IntPtr

    /**
     * The upper 32 bits of the handle.
     */
    dwUpper : IntPtr

}
