#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the behavior of a live source filter.
 * @remarks
 * If no flags are set (the default case), the source filter is assumed to be live and not to perform any rate matching on its own.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-_am_pushsource_flags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class _AM_PUSHSOURCE_FLAGS{

    /**
     * The filter uses its own rate-matching mechanism; the renderer should therefore not attempt to match rates with this filter.
     * @type {Integer (Int32)}
     */
    static AM_PUSHSOURCECAPS_INTERNAL_RM => 1

    /**
     * The filter is not live. Do not treat it as a live source, even though it exposes the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iampushsource">IAMPushSource</a> interface.
     * @type {Integer (Int32)}
     */
    static AM_PUSHSOURCECAPS_NOT_LIVE => 2

    /**
     * The filter time stamps the samples using a private clock. The clock is not available to the rest of the graph through <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ireferenceclock">IReferenceClock</a>.
     * @type {Integer (Int32)}
     */
    static AM_PUSHSOURCECAPS_PRIVATE_CLOCK => 4

    /**
     * Reserved; do not use.
     * @type {Integer (Int32)}
     */
    static AM_PUSHSOURCEREQS_USE_STREAM_CLOCK => 65536

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AM_PUSHSOURCEREQS_USE_CLOCK_CHAIN => 131072
}
