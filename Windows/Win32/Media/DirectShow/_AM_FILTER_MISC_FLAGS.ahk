#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The _AM_FILTER_MISC_FLAGS enumeration contains flags that indicate whether a filter is a source filter or a renderer filter.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-_am_filter_misc_flags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class _AM_FILTER_MISC_FLAGS extends Win32Enum{

    /**
     * The filter is a renderer and sends an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-complete">EC_COMPLETE</a> event at the end of the stream.
     * @type {Integer (Int32)}
     */
    static AM_FILTER_MISC_FLAGS_IS_RENDERER => 1

    /**
     * The filter is a source filter.
     * @type {Integer (Int32)}
     */
    static AM_FILTER_MISC_FLAGS_IS_SOURCE => 2
}
