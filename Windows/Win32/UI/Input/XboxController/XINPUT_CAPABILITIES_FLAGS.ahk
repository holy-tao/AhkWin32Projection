#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 */
class XINPUT_CAPABILITIES_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: XINPUT_CAPS_VOICE_SUPPORTED
     * @type {Integer (UInt16)}
     */
    static CAPS_VOICE_SUPPORTED => 4

    /**
     * Native name: XINPUT_CAPS_FFB_SUPPORTED
     * @type {Integer (UInt16)}
     */
    static CAPS_FFB_SUPPORTED => 1

    /**
     * Native name: XINPUT_CAPS_WIRELESS
     * @type {Integer (UInt16)}
     */
    static CAPS_WIRELESS => 2

    /**
     * Native name: XINPUT_CAPS_PMD_SUPPORTED
     * @type {Integer (UInt16)}
     */
    static CAPS_PMD_SUPPORTED => 8

    /**
     * Native name: XINPUT_CAPS_NO_NAVIGATION
     * @type {Integer (UInt16)}
     */
    static CAPS_NO_NAVIGATION => 16
}
