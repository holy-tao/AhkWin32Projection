#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a detailed reason as to why attention is required for an update before it can proceed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateattentionrequiredreason
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdateAttentionRequiredReason extends Win32Enum{

    /**
     * No attention required.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * A seeker update is missing user approval.
     * @type {Integer (Int32)}
     */
    static SeekerUpdate => 1

    /**
     * The update requires a reboot.
     * @type {Integer (Int32)}
     */
    static ReadyToReboot => 2

    /**
     * The update is waiting for a non-metered network.
     * @type {Integer (Int32)}
     */
    static NeedNonMeteredNetwork => 3

    /**
     * The update requires user agreement to download over a metered network.
     * @type {Integer (Int32)}
     */
    static NeedUserAgreementForMeteredNetwork => 4

    /**
     * There was no network connectivity when the update was last attempted.
     * @type {Integer (Int32)}
     */
    static NeedNetwork => 5

    /**
     * More disk space is needed to complete the update.
     * @type {Integer (Int32)}
     */
    static NeedMoreSpace => 6

    /**
     * The update was blocked due to Battery Saver being enabled.
     * @type {Integer (Int32)}
     */
    static BatterySaverEnabled => 7

    /**
     * The update requires user interaction in order to proceed.
     * @type {Integer (Int32)}
     */
    static NeedUserInteraction => 8

    /**
     * A policy is configured that requires user agreement before the update can proceed.
     * @type {Integer (Int32)}
     */
    static NeedUserAgreementForPolicy => 9

    /**
     * The update encountered a compatibility error.
     * @type {Integer (Int32)}
     */
    static CompatibilityError => 10

    /**
     * User interaction is needed to approve the End-User License Agreement (EULA) associated with the update.
     * @type {Integer (Int32)}
     */
    static NeedUserInteractionForEula => 11

    /**
     * User interaction is needed to approve the China Type Approval (CTA) block for the update.
     * @type {Integer (Int32)}
     */
    static NeedUserInteractionForCta => 12

    /**
     * The update was blocked due to regulation.
     * @type {Integer (Int32)}
     */
    static Regulated => 13

    /**
     * An external reboot prevented the update from proceeding.
     * @type {Integer (Int32)}
     */
    static ExternalReboot => 14

    /**
     * The update couldn't proceed due to another update being in progress.
     * @type {Integer (Int32)}
     */
    static OtherUpdate => 15

    /**
     * The update was blocked by the update provider.
     * @type {Integer (Int32)}
     */
    static BlockedByProvider => 16

    /**
     * The update was blocked by a post-reboot failure.
     * @type {Integer (Int32)}
     */
    static BlockedByPostRebootFailure => 17

    /**
     * The update could not proceed because a user was actively using the device.
     * @type {Integer (Int32)}
     */
    static UserEngaged => 18

    /**
     * The update was blocked due to the battery level of the device being too low.
     * @type {Integer (Int32)}
     */
    static BlockedByBattery => 19

    /**
     * The update could not complete an action due to it being exclusive to one update at a time.
     * @type {Integer (Int32)}
     */
    static Exclusivity => 20

    /**
     * The update was blocked due to a serialization issue.
     * @type {Integer (Int32)}
     */
    static BlockedBySerialization => 21

    /**
     * The update was blocked due to a conflict class.
     * @type {Integer (Int32)}
     */
    static ConflictClass => 22

    /**
     * The update was blocked because it requires Windows update administrator approval.
     * @type {Integer (Int32)}
     */
    static BlockedByAdminApproval => 23

    /**
     * The update was blocked due to too many recent attempts.
     * @type {Integer (Int32)}
     */
    static BlockedByTooManyAttempts => 24

    /**
     * The update was blocked due to a recent failure.
     * @type {Integer (Int32)}
     */
    static BlockedByFailure => 25

    /**
     * The update was demoted due to many failed recent attempts.
     * @type {Integer (Int32)}
     */
    static Demotion => 26

    /**
     * The update was blocked due to the active hours configured on the device.
     * @type {Integer (Int32)}
     */
    static BlockedByActiveHours => 27

    /**
     * The update was blocked due to being scheduled to install in the next available maintenance window.
     * @type {Integer (Int32)}
     */
    static ScheduledForMaintenance => 28

    /**
     * The update was blocked due to being scheduled to install at a specific time indicated by a configured policy.
     * @type {Integer (Int32)}
     */
    static PolicyScheduledInstallTime => 29

    /**
     * The update was blocked due to OOBE constraints.
     * @type {Integer (Int32)}
     */
    static BlockedByOobe => 30

    /**
     * The update was deferred by OOBE blocking criteria.
     * @type {Integer (Int32)}
     */
    static DeferredDuringOobe => 31

    /**
     * The update was deferred to attempt again during a more sustainable (eco-friendly) time.
     * @type {Integer (Int32)}
     */
    static DeferredForSustainableTime => 32

    /**
     * @type {Integer (Int32)}
     */
    static BlockedByAppClose => 33

    /**
     * @type {Integer (Int32)}
     */
    static BlockedByAppRestart => 34
}
