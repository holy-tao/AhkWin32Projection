#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a set of biometric information.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_biometric_ext_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_BIOMETRIC_EXT_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of elements in the <b>rgBiometricData</b> array.
     * @type {Integer}
     */
    cBiometricData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_biometric_data">CERT_BIOMETRIC_DATA</a> structures that contain the biometric data. The <b>cBiometricData</b> member contains the number of elements in this array.
     * @type {Pointer<CERT_BIOMETRIC_DATA>}
     */
    rgBiometricData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
