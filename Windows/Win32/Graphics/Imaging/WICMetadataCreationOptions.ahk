#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies metadata creation options.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/ne-wincodecsdk-wicmetadatacreationoptions
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICMetadataCreationOptions {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
