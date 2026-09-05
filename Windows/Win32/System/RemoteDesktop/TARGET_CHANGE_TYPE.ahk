#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of change that occurred in a target.
 * @see https://learn.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-target_change_type
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class TARGET_CHANGE_TYPE extends Win32Enum {

    /**
     * Unspecified change in the target.
     * Native name: TARGET_CHANGE_UNSPEC
     * @type {Integer (Int32)}
     */
    static UNSPEC => 1

    /**
     * The target's external IP address changed.
     * Native name: TARGET_EXTERNALIP_CHANGED
     * @type {Integer (Int32)}
     */
    static EXTERNALIP_CHANGED => 2

    /**
     * The target's internal IP address changed.
     * Native name: TARGET_INTERNALIP_CHANGED
     * @type {Integer (Int32)}
     */
    static INTERNALIP_CHANGED => 4

    /**
     * The target was reported to RD Connection Broker.
     * Native name: TARGET_JOINED
     * @type {Integer (Int32)}
     */
    static JOINED => 8

    /**
     * The target was deleted  from the store in RD Connection Broker.
     * Native name: TARGET_REMOVED
     * @type {Integer (Int32)}
     */
    static REMOVED => 16

    /**
     * The target's state changed. To determine the current state of the target, check the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nf-sbtsv-itssbtarget-get_targetstate">TargetState</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a>.
     * Native name: TARGET_STATE_CHANGED
     * @type {Integer (Int32)}
     */
    static STATE_CHANGED => 32

    /**
     * The target is not hosting any sessions currently.
     * Native name: TARGET_IDLE
     * @type {Integer (Int32)}
     */
    static IDLE => 64

    /**
     * Native name: TARGET_PENDING
     * @type {Integer (Int32)}
     */
    static PENDING => 128

    /**
     * Native name: TARGET_INUSE
     * @type {Integer (Int32)}
     */
    static INUSE => 256

    /**
     * Native name: TARGET_PATCH_STATE_CHANGED
     * @type {Integer (Int32)}
     */
    static PATCH_STATE_CHANGED => 512

    /**
     * Native name: TARGET_FARM_MEMBERSHIP_CHANGED
     * @type {Integer (Int32)}
     */
    static FARM_MEMBERSHIP_CHANGED => 1024
}
