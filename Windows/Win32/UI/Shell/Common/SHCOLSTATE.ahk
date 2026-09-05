#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Describes how a property should be treated. These values are defined in Shtypes.h.
 * @see https://learn.microsoft.com/windows/win32/api/shtypes/ne-shtypes-shcolstate
 * @namespace Windows.Win32.UI.Shell.Common
 */
class SHCOLSTATE extends Win32Enum {

    /**
     * The value is displayed according to default settings for the column.
     * Native name: SHCOLSTATE_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * The value is displayed as a string.
     * Native name: SHCOLSTATE_TYPE_STR
     * @type {Integer (Int32)}
     */
    static TYPE_STR => 1

    /**
     * The value is displayed as an integer.
     * Native name: SHCOLSTATE_TYPE_INT
     * @type {Integer (Int32)}
     */
    static TYPE_INT => 2

    /**
     * The value is displayed as a date/time.
     * Native name: SHCOLSTATE_TYPE_DATE
     * @type {Integer (Int32)}
     */
    static TYPE_DATE => 3

    /**
     * A mask for display type values SHCOLSTATE_TYPE_STR, SHCOLSTATE_TYPE_INT, and SHCOLSTATE_TYPE_DATE.
     * Native name: SHCOLSTATE_TYPEMASK
     * @type {Integer (Int32)}
     */
    static TYPEMASK => 15

    /**
     * The column should be on by default in Details view.
     * Native name: SHCOLSTATE_ONBYDEFAULT
     * @type {Integer (Int32)}
     */
    static ONBYDEFAULT => 16

    /**
     * Will be slow to compute. Perform on a background thread.
     * Native name: SHCOLSTATE_SLOW
     * @type {Integer (Int32)}
     */
    static SLOW => 32

    /**
     * Provided by a handler, not the folder.
     * Native name: SHCOLSTATE_EXTENDED
     * @type {Integer (Int32)}
     */
    static EXTENDED => 64

    /**
     * Not displayed in the context menu, but is listed in the <b>More...</b> dialog.
     * Native name: SHCOLSTATE_SECONDARYUI
     * @type {Integer (Int32)}
     */
    static SECONDARYUI => 128

    /**
     * Not displayed in the UI.
     * Native name: SHCOLSTATE_HIDDEN
     * @type {Integer (Int32)}
     */
    static HIDDEN => 256

    /**
     * <b>VarCmp</b> produces same result as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-compareids">IShellFolder::CompareIDs</a>.
     * Native name: SHCOLSTATE_PREFER_VARCMP
     * @type {Integer (Int32)}
     */
    static PREFER_VARCMP => 512

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psformatfordisplay">PSFormatForDisplay</a> produces same result as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-compareids">IShellFolder::CompareIDs</a>.
     * Native name: SHCOLSTATE_PREFER_FMTCMP
     * @type {Integer (Int32)}
     */
    static PREFER_FMTCMP => 1024

    /**
     * Do not sort folders separately.
     * Native name: SHCOLSTATE_NOSORTBYFOLDERNESS
     * @type {Integer (Int32)}
     */
    static NOSORTBYFOLDERNESS => 2048

    /**
     * Only displayed in the UI.
     * Native name: SHCOLSTATE_VIEWONLY
     * @type {Integer (Int32)}
     */
    static VIEWONLY => 65536

    /**
     * Marks columns with values that should be read in a batch.
     * Native name: SHCOLSTATE_BATCHREAD
     * @type {Integer (Int32)}
     */
    static BATCHREAD => 131072

    /**
     * Grouping is disabled for this column.
     * Native name: SHCOLSTATE_NO_GROUPBY
     * @type {Integer (Int32)}
     */
    static NO_GROUPBY => 262144

    /**
     * Can't resize the column.
     * Native name: SHCOLSTATE_FIXED_WIDTH
     * @type {Integer (Int32)}
     */
    static FIXED_WIDTH => 4096

    /**
     * The width is the same in all dpi.
     * Native name: SHCOLSTATE_NODPISCALE
     * @type {Integer (Int32)}
     */
    static NODPISCALE => 8192

    /**
     * Fixed width and height ratio.
     * Native name: SHCOLSTATE_FIXED_RATIO
     * @type {Integer (Int32)}
     */
    static FIXED_RATIO => 16384

    /**
     * Filters out new display flags.
     * Native name: SHCOLSTATE_DISPLAYMASK
     * @type {Integer (Int32)}
     */
    static DISPLAYMASK => 61440
}
