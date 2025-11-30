#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class EX_POOL_PRIORITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static LowPoolPriority => 0

    /**
     * @type {Integer (Int32)}
     */
    static LowPoolPrioritySpecialPoolOverrun => 8

    /**
     * @type {Integer (Int32)}
     */
    static LowPoolPrioritySpecialPoolUnderrun => 9

    /**
     * @type {Integer (Int32)}
     */
    static NormalPoolPriority => 16

    /**
     * @type {Integer (Int32)}
     */
    static NormalPoolPrioritySpecialPoolOverrun => 24

    /**
     * @type {Integer (Int32)}
     */
    static NormalPoolPrioritySpecialPoolUnderrun => 25

    /**
     * @type {Integer (Int32)}
     */
    static HighPoolPriority => 32

    /**
     * @type {Integer (Int32)}
     */
    static HighPoolPrioritySpecialPoolOverrun => 40

    /**
     * @type {Integer (Int32)}
     */
    static HighPoolPrioritySpecialPoolUnderrun => 41
}
