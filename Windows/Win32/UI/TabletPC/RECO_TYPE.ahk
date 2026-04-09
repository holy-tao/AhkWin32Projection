#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class RECO_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static RECO_TYPE_WSTRING => 0

    /**
     * @type {Integer (Int32)}
     */
    static RECO_TYPE_WCHAR => 1
}
