#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBACCESSORFLAGSENUM{

    /**
     * @type {Integer (Int32)}
     */
    static DBACCESSOR_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBACCESSOR_PASSBYREF => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBACCESSOR_ROWDATA => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBACCESSOR_PARAMETERDATA => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBACCESSOR_OPTIMIZED => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBACCESSOR_INHERITED => 16
}
