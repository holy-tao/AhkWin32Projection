#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class EBindPolicyLevels extends Win32Enum {

    /**
     * Native name: ePolicyLevelNone
     * @type {Integer (Int32)}
     */
    static LevelNone => 0

    /**
     * Native name: ePolicyLevelRetargetable
     * @type {Integer (Int32)}
     */
    static LevelRetargetable => 1

    /**
     * Native name: ePolicyUnifiedToCLR
     * @type {Integer (Int32)}
     */
    static UnifiedToCLR => 2

    /**
     * Native name: ePolicyLevelApp
     * @type {Integer (Int32)}
     */
    static LevelApp => 4

    /**
     * Native name: ePolicyLevelPublisher
     * @type {Integer (Int32)}
     */
    static LevelPublisher => 8

    /**
     * Native name: ePolicyLevelHost
     * @type {Integer (Int32)}
     */
    static LevelHost => 16

    /**
     * Native name: ePolicyLevelAdmin
     * @type {Integer (Int32)}
     */
    static LevelAdmin => 32

    /**
     * Native name: ePolicyPortability
     * @type {Integer (Int32)}
     */
    static Portability => 64
}
