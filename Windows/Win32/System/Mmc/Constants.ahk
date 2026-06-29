#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.Mmc
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global MMC_VER := 512

/**
 * @type {Integer (UInt32)}
 */
export global MMC_PROP_CHANGEAFFECTSUI := 1

/**
 * @type {Integer (UInt32)}
 */
export global MMC_PROP_MODIFIABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MMC_PROP_REMOVABLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global MMC_PROP_PERSIST := 8

/**
 * @type {Integer (Int32)}
 */
export global MMCLV_AUTO := -1

/**
 * @type {Integer (Int32)}
 */
export global MMCLV_NOPARAM := -2

/**
 * @type {Integer (Int32)}
 */
export global MMCLV_NOICON := -1

/**
 * @type {Integer (UInt32)}
 */
export global MMCLV_VIEWSTYLE_ICON := 0

/**
 * @type {Integer (UInt32)}
 */
export global MMCLV_VIEWSTYLE_SMALLICON := 2

/**
 * @type {Integer (UInt32)}
 */
export global MMCLV_VIEWSTYLE_LIST := 3

/**
 * @type {Integer (UInt32)}
 */
export global MMCLV_VIEWSTYLE_REPORT := 1

/**
 * @type {Integer (UInt32)}
 */
export global MMCLV_VIEWSTYLE_FILTERED := 4

/**
 * @type {Integer (UInt32)}
 */
export global MMCLV_NOPTR := 0

/**
 * @type {Integer (UInt32)}
 */
export global MMCLV_UPDATE_NOINVALIDATEALL := 1

/**
 * @type {Integer (UInt32)}
 */
export global MMCLV_UPDATE_NOSCROLL := 2

/**
 * @type {Integer (Int32)}
 */
export global MMC_IMAGECALLBACK := -1

/**
 * @type {Integer (UInt32)}
 */
export global RDI_STR := 2

/**
 * @type {Integer (UInt32)}
 */
export global RDI_IMAGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global RDI_STATE := 8

/**
 * @type {Integer (UInt32)}
 */
export global RDI_PARAM := 16

/**
 * @type {Integer (UInt32)}
 */
export global RDI_INDEX := 32

/**
 * @type {Integer (UInt32)}
 */
export global RDI_INDENT := 64

/**
 * @type {Integer (UInt32)}
 */
export global MMC_VIEW_OPTIONS_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global MMC_VIEW_OPTIONS_NOLISTVIEWS := 1

/**
 * @type {Integer (UInt32)}
 */
export global MMC_VIEW_OPTIONS_MULTISELECT := 2

/**
 * @type {Integer (UInt32)}
 */
export global MMC_VIEW_OPTIONS_OWNERDATALIST := 4

/**
 * @type {Integer (UInt32)}
 */
export global MMC_VIEW_OPTIONS_FILTERED := 8

/**
 * @type {Integer (UInt32)}
 */
export global MMC_VIEW_OPTIONS_CREATENEW := 16

/**
 * @type {Integer (UInt32)}
 */
export global MMC_VIEW_OPTIONS_USEFONTLINKING := 32

/**
 * @type {Integer (UInt32)}
 */
export global MMC_VIEW_OPTIONS_EXCLUDE_SCOPE_ITEMS_FROM_LIST := 64

/**
 * @type {Integer (UInt32)}
 */
export global MMC_VIEW_OPTIONS_LEXICAL_SORT := 128

/**
 * @type {Integer (UInt32)}
 */
export global MMC_PSO_NOAPPLYNOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global MMC_PSO_HASHELP := 2

/**
 * @type {Integer (UInt32)}
 */
export global MMC_PSO_NEWWIZARDTYPE := 4

/**
 * @type {Integer (UInt32)}
 */
export global MMC_PSO_NO_PROPTITLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global RFI_PARTIAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global RFI_WRAP := 2

/**
 * @type {Integer (UInt32)}
 */
export global RSI_DESCENDING := 1

/**
 * @type {Integer (UInt32)}
 */
export global RSI_NOSORTICON := 2

/**
 * @type {Integer (UInt32)}
 */
export global SDI_STR := 2

/**
 * @type {Integer (UInt32)}
 */
export global SDI_IMAGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SDI_OPENIMAGE := 8

/**
 * @type {Integer (UInt32)}
 */
export global SDI_STATE := 16

/**
 * @type {Integer (UInt32)}
 */
export global SDI_PARAM := 32

/**
 * @type {Integer (UInt32)}
 */
export global SDI_CHILDREN := 64

/**
 * @type {Integer (UInt32)}
 */
export global SDI_PARENT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SDI_PREVIOUS := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global SDI_NEXT := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global SDI_FIRST := 134217728

/**
 * @type {Integer (Int32)}
 */
export global MMC_MULTI_SELECT_COOKIE := -2

/**
 * @type {Integer (Int32)}
 */
export global MMC_WINDOW_COOKIE := -3

/**
 * @type {Integer (Int32)}
 */
export global SPECIAL_COOKIE_MIN := -10

/**
 * @type {Integer (Int32)}
 */
export global SPECIAL_COOKIE_MAX := -1

/**
 * @type {Integer (UInt32)}
 */
export global MMC_NW_OPTION_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global MMC_NW_OPTION_NOSCOPEPANE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MMC_NW_OPTION_NOTOOLBARS := 2

/**
 * @type {Integer (UInt32)}
 */
export global MMC_NW_OPTION_SHORTTITLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global MMC_NW_OPTION_CUSTOMTITLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global MMC_NW_OPTION_NOPERSIST := 16

/**
 * @type {Integer (UInt32)}
 */
export global MMC_NW_OPTION_NOACTIONPANE := 32

/**
 * @type {Integer (UInt32)}
 */
export global MMC_NODEID_SLOW_RETRIEVAL := 1

/**
 * @type {Integer (Int32)}
 */
export global SPECIAL_DOBJ_MIN := -10

/**
 * @type {Integer (UInt32)}
 */
export global SPECIAL_DOBJ_MAX := 0

/**
 * @type {Integer (Int32)}
 */
export global AUTO_WIDTH := -1

/**
 * @type {Integer (Int32)}
 */
export global HIDE_COLUMN := -4

/**
 * @type {Integer (UInt32)}
 */
export global ILSIF_LEAVE_LARGE_ICON := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global ILSIF_LEAVE_SMALL_ICON := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global HDI_HIDDEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global RDCI_ScopeItem := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global RVTI_MISC_OPTIONS_NOLISTVIEWS := 1

/**
 * @type {Integer (UInt32)}
 */
export global RVTI_LIST_OPTIONS_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RVTI_LIST_OPTIONS_OWNERDATALIST := 2

/**
 * @type {Integer (UInt32)}
 */
export global RVTI_LIST_OPTIONS_MULTISELECT := 4

/**
 * @type {Integer (UInt32)}
 */
export global RVTI_LIST_OPTIONS_FILTERED := 8

/**
 * @type {Integer (UInt32)}
 */
export global RVTI_LIST_OPTIONS_USEFONTLINKING := 32

/**
 * @type {Integer (UInt32)}
 */
export global RVTI_LIST_OPTIONS_EXCLUDE_SCOPE_ITEMS_FROM_LIST := 64

/**
 * @type {Integer (UInt32)}
 */
export global RVTI_LIST_OPTIONS_LEXICAL_SORT := 128

/**
 * @type {Integer (UInt32)}
 */
export global RVTI_LIST_OPTIONS_ALLOWPASTE := 256

/**
 * @type {Integer (UInt32)}
 */
export global RVTI_HTML_OPTIONS_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RVTI_HTML_OPTIONS_NOLISTVIEW := 1

/**
 * @type {Integer (UInt32)}
 */
export global RVTI_OCX_OPTIONS_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RVTI_OCX_OPTIONS_NOLISTVIEW := 1

/**
 * @type {Integer (UInt32)}
 */
export global RVTI_OCX_OPTIONS_CACHE_OCX := 2

/**
 * @type {Integer (UInt32)}
 */
export global MMC_DEFAULT_OPERATION_COPY := 1

/**
 * @type {Integer (UInt32)}
 */
export global MMC_ITEM_OVERLAY_STATE_MASK := 3840

/**
 * @type {Integer (UInt32)}
 */
export global MMC_ITEM_OVERLAY_STATE_SHIFT := 8

/**
 * @type {Integer (UInt32)}
 */
export global MMC_ITEM_STATE_MASK := 255
;@endregion Constants
