#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies metadata creation options.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/ne-wincodecsdk-wicmetadatacreationoptions
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICMetadataCreationOptions extends Win32Enum {

    /**
     * The default metadata creation options. The default value is <b>WICMetadataCreationAllowUnknown</b>.
     * Native name: WICMetadataCreationDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Allow unknown metadata creation.
     * Native name: WICMetadataCreationAllowUnknown
     * @type {Integer (Int32)}
     */
    static AllowUnknown => 0

    /**
     * Fail on unknown metadata creation.
     * Native name: WICMetadataCreationFailUnknown
     * @type {Integer (Int32)}
     */
    static FailUnknown => 65536

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ne-wincodecsdk-wicmetadatacreationoptions">WICMetadataCreationOptions</a> mask.
     * Native name: WICMetadataCreationMask
     * @type {Integer (Int32)}
     */
    static Mask => -65536
}
