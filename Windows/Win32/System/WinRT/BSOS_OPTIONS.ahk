#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the behavior of a RandomAccessStream that encapsulates a Component Object Model (COM) IStream.
 * @see https://docs.microsoft.com/windows/win32/api//shcore/ne-shcore-bsos_options
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class BSOS_OPTIONS extends Win32Enum{

    /**
     * When creating a <a href="https://docs.microsoft.com/uwp/api/windows.storage.streams.randomaccessstream">RandomAccessStream</a> over a stream, use the base <a href="https://docs.microsoft.com/previous-versions/hh438400(v=vs.85)">IRandomAccessStream</a> behavior on the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-stgmove">STGM</a> mode from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a> method.
     * @type {Integer (Int32)}
     */
    static BSOS_DEFAULT => 0

    /**
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idestinationstreamfactory-getdestinationstream">GetDestinationStream</a> method.
     * @type {Integer (Int32)}
     */
    static BSOS_PREFERDESTINATIONSTREAM => 1
}
