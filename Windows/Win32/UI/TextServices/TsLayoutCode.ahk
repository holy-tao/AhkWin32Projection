#Requires AutoHotkey v2.0.0 64-bit

/**
 * Elements of the TsLayoutCode enumeration are used to specify the type of layout change in an ITextStoreACPSink::OnLayoutChange or ITextStoreAnchorSink::OnLayoutChange notification.
 * @see https://learn.microsoft.com/windows/win32/api/textstor/ne-textstor-tslayoutcode
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TsLayoutCode{

    /**
     * The view has just been created.
     * @type {Integer (Int32)}
     */
    static TS_LC_CREATE => 0

    /**
     * The view layout has changed.
     * @type {Integer (Int32)}
     */
    static TS_LC_CHANGE => 1

    /**
     * The view is about to be destroyed.
     * @type {Integer (Int32)}
     */
    static TS_LC_DESTROY => 2
}
