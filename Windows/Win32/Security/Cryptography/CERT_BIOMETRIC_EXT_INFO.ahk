#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_BIOMETRIC_DATA.ahk" { CERT_BIOMETRIC_DATA }

/**
 * Contains a set of biometric information.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_biometric_ext_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_BIOMETRIC_EXT_INFO {
    #StructPack 8

    /**
     * The number of elements in the <b>rgBiometricData</b> array.
     */
    cBiometricData : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_biometric_data">CERT_BIOMETRIC_DATA</a> structures that contain the biometric data. The <b>cBiometricData</b> member contains the number of elements in this array.
     */
    rgBiometricData : CERT_BIOMETRIC_DATA.Ptr

}
