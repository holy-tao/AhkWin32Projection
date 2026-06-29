#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values that indicate the type of sub-channel data.
 * @remarks
 * For details on the format of the sub-channel data, see Sub-Channel Field Formats in the latest release of the MMC specification at ftp://ftp.t10.org/t10/drafts/mmc5.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/ne-imapi2-imapi_format2_raw_cd_data_sector_type
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IMAPI_FORMAT2_RAW_CD_DATA_SECTOR_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The data contains P and Q sub-channel data.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_RAW_CD_SUBCODE_PQ_ONLY => 1

    /**
     * The data contains corrected and de-interleaved R-W sub-channel data.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_RAW_CD_SUBCODE_IS_COOKED => 2

    /**
     * The data contains raw P-W sub-channel data that is returned in the order received from the disc surface.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_RAW_CD_SUBCODE_IS_RAW => 3
}
