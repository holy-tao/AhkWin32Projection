#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of package for a IAppxBundleManifestPackageInfo object.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ne-appxpackaging-appx_bundle_payload_package_type
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE extends Win32Enum{

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
