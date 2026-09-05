#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkRecognizer extends Win32Enum {

    /**
     * Native name: DISPID_RecoClsid
     * @type {Integer (Int32)}
     */
    static RecoClsid => 1

    /**
     * Native name: DISPID_RecoName
     * @type {Integer (Int32)}
     */
    static RecoName => 2

    /**
     * Native name: DISPID_RecoVendor
     * @type {Integer (Int32)}
     */
    static RecoVendor => 3

    /**
     * Native name: DISPID_RecoCapabilities
     * @type {Integer (Int32)}
     */
    static RecoCapabilities => 4

    /**
     * Native name: DISPID_RecoLanguageID
     * @type {Integer (Int32)}
     */
    static RecoLanguageID => 5

    /**
     * Native name: DISPID_RecoPreferredPacketDescription
     * @type {Integer (Int32)}
     */
    static RecoPreferredPacketDescription => 6

    /**
     * Native name: DISPID_RecoCreateRecognizerContext
     * @type {Integer (Int32)}
     */
    static RecoCreateRecognizerContext => 7

    /**
     * Native name: DISPID_RecoSupportedProperties
     * @type {Integer (Int32)}
     */
    static RecoSupportedProperties => 8
}
