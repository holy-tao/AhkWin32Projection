#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PSCREATETHREADNOTIFYTYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static PsCreateThreadNotifyNonSystem => 0

    /**
     * @type {Integer (Int32)}
     */
    static PsCreateThreadNotifySubsystems => 1
}
