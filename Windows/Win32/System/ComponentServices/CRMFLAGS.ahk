#Requires AutoHotkey v2.0.0 64-bit

/**
 * Provides information about when a particular log record to the CRM compensator was written.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ne-comsvcs-crmflags
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class CRMFLAGS{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CRMFLAG_FORGETTARGET => 1

    /**
     * The record was written during prepare.
     * @type {Integer (Int32)}
     */
    static CRMFLAG_WRITTENDURINGPREPARE => 2

    /**
     * The record was written during commit.
     * @type {Integer (Int32)}
     */
    static CRMFLAG_WRITTENDURINGCOMMIT => 4

    /**
     * The record was written during abort.
     * @type {Integer (Int32)}
     */
    static CRMFLAG_WRITTENDURINGABORT => 8

    /**
     * The record was written during recovery.
     * @type {Integer (Int32)}
     */
    static CRMFLAG_WRITTENDURINGRECOVERY => 16

    /**
     * The record was written during replay.
     * @type {Integer (Int32)}
     */
    static CRMFLAG_WRITTENDURINGREPLAY => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CRMFLAG_REPLAYINPROGRESS => 64
}
