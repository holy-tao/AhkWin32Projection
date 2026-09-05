#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class RECO_TYPE extends Win32Enum {

    /**
     * Native name: RECO_TYPE_WSTRING
     * @type {Integer (Int32)}
     */
    static WSTRING => 0

    /**
     * Native name: RECO_TYPE_WCHAR
     * @type {Integer (Int32)}
     */
    static WCHAR => 1
}
