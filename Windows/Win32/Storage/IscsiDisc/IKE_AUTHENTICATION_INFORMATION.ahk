#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKE_AUTHENTICATION_METHOD.ahk" { IKE_AUTHENTICATION_METHOD }
#Import ".\IKE_AUTHENTICATION_PRESHARED_KEY.ahk" { IKE_AUTHENTICATION_PRESHARED_KEY }

/**
 * IKE_AUTHENTICATION_INFORMATION structure contains Internet Key Exchange (IKE) authentication information used to establish a secure channel between two key management daemons.
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-ike_authentication_information
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct IKE_AUTHENTICATION_INFORMATION {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ne-iscsidsc-ike_authentication_method">IKE_AUTHENTICATION_METHOD</a> structure that indicates the authentication method.
     */
    AuthMethod : IKE_AUTHENTICATION_METHOD

    PsKey : IKE_AUTHENTICATION_PRESHARED_KEY

}
