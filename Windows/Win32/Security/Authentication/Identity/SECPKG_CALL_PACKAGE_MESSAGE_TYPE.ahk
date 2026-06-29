#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_CALL_PACKAGE_MESSAGE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static SecPkgCallPackageMinMessage => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SecPkgCallPackagePinDcMessage => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SecPkgCallPackageUnpinAllDcsMessage => 1025

    /**
     * @type {Integer (Int32)}
     */
    static SecPkgCallPackageTransferCredMessage => 1026

    /**
     * @type {Integer (Int32)}
     */
    static SecPkgCallPackageMaxMessage => 1026
}
