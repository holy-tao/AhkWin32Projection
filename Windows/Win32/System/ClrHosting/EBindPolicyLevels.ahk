#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class EBindPolicyLevels extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ePolicyLevelNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static ePolicyLevelRetargetable => 1

    /**
     * @type {Integer (Int32)}
     */
    static ePolicyUnifiedToCLR => 2

    /**
     * @type {Integer (Int32)}
     */
    static ePolicyLevelApp => 4

    /**
     * @type {Integer (Int32)}
     */
    static ePolicyLevelPublisher => 8

    /**
     * @type {Integer (Int32)}
     */
    static ePolicyLevelHost => 16

    /**
     * @type {Integer (Int32)}
     */
    static ePolicyLevelAdmin => 32

    /**
     * @type {Integer (Int32)}
     */
    static ePolicyPortability => 64
}
