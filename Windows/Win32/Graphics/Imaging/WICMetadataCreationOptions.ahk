#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies metadata creation options.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/ne-wincodecsdk-wicmetadatacreationoptions
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICMetadataCreationOptions{

    /**
     * The default metadata creation options. The default value is <b>WICMetadataCreationAllowUnknown</b>.
     * @type {Integer (Int32)}
     */
    static WICMetadataCreationDefault => 0

    /**
     * Allow unknown metadata creation.
     * @type {Integer (Int32)}
     */
    static WICMetadataCreationAllowUnknown => 0

    /**
     * Fail on unknown metadata creation.
     * @type {Integer (Int32)}
     */
    static WICMetadataCreationFailUnknown => 65536

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ne-wincodecsdk-wicmetadatacreationoptions">WICMetadataCreationOptions</a> mask.
     * @type {Integer (Int32)}
     */
    static WICMetadataCreationMask => -65536
}
