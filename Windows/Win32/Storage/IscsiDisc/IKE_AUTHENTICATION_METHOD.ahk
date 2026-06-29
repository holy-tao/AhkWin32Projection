#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * IKE_AUTHENTICATION_METHOD enumeration indicates the type of Internet Key Exchange (IKE) authentication method.
 * @remarks
 * Used in conjunction with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-setiscsiikeinfoa">SetIScsiIKEInfo</a> function to establish the IPsec policy to use during iSCSI operations.
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ne-iscsidsc-ike_authentication_method
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct IKE_AUTHENTICATION_METHOD {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The authentication method was preshared.
     * @type {Integer (Int32)}
     */
    static IKE_AUTHENTICATION_PRESHARED_KEY_METHOD => 1
}
