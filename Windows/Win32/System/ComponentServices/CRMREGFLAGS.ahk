#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Controls which phases of transaction completion should be received by the CRM compensator and whether recovery should fail if in-doubt transactions remain after recovery has been attempted.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ne-comsvcs-crmregflags
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct CRMREGFLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Receive the prepare phase.
     * @type {Integer (Int32)}
     */
    static CRMREGFLAG_PREPAREPHASE => 1

    /**
     * Receive the commit phase.
     * @type {Integer (Int32)}
     */
    static CRMREGFLAG_COMMITPHASE => 2

    /**
     * Receive the abort phase.
     * @type {Integer (Int32)}
     */
    static CRMREGFLAG_ABORTPHASE => 4

    /**
     * Receive all phases.
     * @type {Integer (Int32)}
     */
    static CRMREGFLAG_ALLPHASES => 7

    /**
     * Fail if in-doubt transactions remain after recovery.
     * @type {Integer (Int32)}
     */
    static CRMREGFLAG_FAILIFINDOUBTSREMAIN => 16
}
