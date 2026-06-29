#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the device claims for the token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_device_claims
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_DEVICE_CLAIMS {
    #StructPack 8

    /**
     * The device claims for the token.
     */
    DeviceClaims : IntPtr

}
