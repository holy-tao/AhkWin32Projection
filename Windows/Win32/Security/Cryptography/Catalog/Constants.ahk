#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 */

;@region Constants

/**
 * @type {String}
 */
export global szOID_CATALOG_LIST := "1.3.6.1.4.1.311.12.1.1"

/**
 * @type {String}
 */
export global szOID_CATALOG_LIST_MEMBER := "1.3.6.1.4.1.311.12.1.2"

/**
 * @type {String}
 */
export global szOID_CATALOG_LIST_MEMBER2 := "1.3.6.1.4.1.311.12.1.3"

/**
 * @type {String}
 */
export global CRYPTCAT_FILEEXT := "CAT"

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTCAT_MAX_MEMBERTAG := 64

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTCAT_MEMBER_SORTED := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTCAT_E_AREA_HEADER := 0

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTCAT_E_AREA_MEMBER := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTCAT_E_AREA_ATTRIBUTE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTCAT_E_CDF_UNSUPPORTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTCAT_E_CDF_DUPLICATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTCAT_E_CDF_TAGNOTFOUND := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTCAT_E_CDF_MEMBER_FILE_PATH := 65537

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTCAT_E_CDF_MEMBER_INDIRECTDATA := 65538

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTCAT_E_CDF_MEMBER_FILENOTFOUND := 65540

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTCAT_E_CDF_BAD_GUID_CONV := 131073

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTCAT_E_CDF_ATTR_TOOFEWVALUES := 131074

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTCAT_E_CDF_ATTR_TYPECOMBO := 131076

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTCAT_ADDCATALOG_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTCAT_ADDCATALOG_HARDLINK := 1
;@endregion Constants
