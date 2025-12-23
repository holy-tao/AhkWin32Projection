#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Describes how a property should be treated. These values are defined in Shtypes.h.
 * @see https://learn.microsoft.com/windows/win32/api/shtypes/ne-shtypes-shcolstate
 * @namespace Windows.Win32.UI.Shell.Common
 * @version v4.0.30319
 */
class SHCOLSTATE extends Win32Enum{

    /**
     * The value is displayed according to default settings for the column.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_DEFAULT => 0

    /**
     * The value is displayed as a string.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_TYPE_STR => 1

    /**
     * The value is displayed as an integer.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_TYPE_INT => 2

    /**
     * The value is displayed as a date/time.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_TYPE_DATE => 3

    /**
     * A mask for display type values SHCOLSTATE_TYPE_STR, SHCOLSTATE_TYPE_INT, and SHCOLSTATE_TYPE_DATE.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_TYPEMASK => 15

    /**
     * The column should be on by default in Details view.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_ONBYDEFAULT => 16

    /**
     * Will be slow to compute. Perform on a background thread.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_SLOW => 32

    /**
     * Provided by a handler, not the folder.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_EXTENDED => 64

    /**
     * Not displayed in the context menu, but is listed in the <b>More...</b> dialog.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_SECONDARYUI => 128

    /**
     * Not displayed in the UI.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_HIDDEN => 256

    /**
     * <b>VarCmp</b> produces same result as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-compareids">IShellFolder::CompareIDs</a>.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_PREFER_VARCMP => 512

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psformatfordisplay">PSFormatForDisplay</a> produces same result as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-compareids">IShellFolder::CompareIDs</a>.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_PREFER_FMTCMP => 1024

    /**
     * Do not sort folders separately.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_NOSORTBYFOLDERNESS => 2048

    /**
     * Only displayed in the UI.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_VIEWONLY => 65536

    /**
     * Marks columns with values that should be read in a batch.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_BATCHREAD => 131072

    /**
     * Grouping is disabled for this column.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_NO_GROUPBY => 262144

    /**
     * Can't resize the column.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_FIXED_WIDTH => 4096

    /**
     * The width is the same in all dpi.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_NODPISCALE => 8192

    /**
     * Fixed width and height ratio.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_FIXED_RATIO => 16384

    /**
     * Filters out new display flags.
     * @type {Integer (Int32)}
     */
    static SHCOLSTATE_DISPLAYMASK => 61440
}
