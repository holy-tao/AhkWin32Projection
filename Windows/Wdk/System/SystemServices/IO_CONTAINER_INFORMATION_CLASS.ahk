#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IO_CONTAINER_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: IoSessionStateInformation
     * @type {Integer (Int32)}
     */
    static SessionStateInformation => 0

    /**
     * Native name: IoMaxContainerInformationClass
     * @type {Integer (Int32)}
     */
    static MaxContainerInformationClass => 1
}
