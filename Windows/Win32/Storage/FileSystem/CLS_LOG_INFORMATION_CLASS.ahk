#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLS_LOG_INFORMATION_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ClfsLogBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static ClfsLogBasicInformationPhysical => 1

    /**
     * @type {Integer (Int32)}
     */
    static ClfsLogPhysicalNameInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static ClfsLogStreamIdentifierInformation => 3

    /**
     * @type {Integer (Int32)}
     */
    static ClfsLogSystemMarkingInformation => 4

    /**
     * @type {Integer (Int32)}
     */
    static ClfsLogPhysicalLsnInformation => 5
}
