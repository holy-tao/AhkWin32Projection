#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specify the type of adapter being used.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-component-constants
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
class WINBIO_COMPONENT extends Win32Enum {

    /**
     * Native name: WINBIO_COMPONENT_SENSOR
     * @type {Integer (UInt32)}
     */
    static SENSOR => 1

    /**
     * Native name: WINBIO_COMPONENT_ENGINE
     * @type {Integer (UInt32)}
     */
    static ENGINE => 2

    /**
     * Native name: WINBIO_COMPONENT_STORAGE
     * @type {Integer (UInt32)}
     */
    static STORAGE => 3
}
