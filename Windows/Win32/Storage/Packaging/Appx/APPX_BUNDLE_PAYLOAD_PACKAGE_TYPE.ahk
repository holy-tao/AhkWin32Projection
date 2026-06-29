#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of package for a IAppxBundleManifestPackageInfo object.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ne-appxpackaging-appx_bundle_payload_package_type
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The package is an app.
     * @type {Integer (Int32)}
     */
    static APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE_APPLICATION => 0

    /**
     * The package is a resource.
     * @type {Integer (Int32)}
     */
    static APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE_RESOURCE => 1
}
