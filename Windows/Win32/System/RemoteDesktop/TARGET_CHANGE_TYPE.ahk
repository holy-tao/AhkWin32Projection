#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of change that occurred in a target.
 * @see https://docs.microsoft.com/windows/win32/api//sessdirpublictypes/ne-sessdirpublictypes-target_change_type
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class TARGET_CHANGE_TYPE extends Win32Enum{

    /**
     * Unspecified change in the target.
     * @type {Integer (Int32)}
     */
    static TARGET_CHANGE_UNSPEC => 1

    /**
     * The target's external IP address changed.
     * @type {Integer (Int32)}
     */
    static TARGET_EXTERNALIP_CHANGED => 2

    /**
     * The target's internal IP address changed.
     * @type {Integer (Int32)}
     */
    static TARGET_INTERNALIP_CHANGED => 4

    /**
     * The target was reported to RD Connection Broker.
     * @type {Integer (Int32)}
     */
    static TARGET_JOINED => 8

    /**
     * The target was deleted  from the store in RD Connection Broker.
     * @type {Integer (Int32)}
     */
    static TARGET_REMOVED => 16

    /**
     * The target's state changed. To determine the current state of the target, check the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nf-sbtsv-itssbtarget-get_targetstate">TargetState</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a>.
     * @type {Integer (Int32)}
     */
    static TARGET_STATE_CHANGED => 32

    /**
     * The target is not hosting any sessions currently.
     * @type {Integer (Int32)}
     */
    static TARGET_IDLE => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TARGET_PENDING => 128

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TARGET_INUSE => 256

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TARGET_PATCH_STATE_CHANGED => 512

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TARGET_FARM_MEMBERSHIP_CHANGED => 1024
}
