#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This resource represents the privilege level for a Diagnostic Data Query session
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ne-diagnosticdataquerytypes-ddqaccesslevel
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
export default struct DdqAccessLevel {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No data can be accessed using this session.
     * @type {Integer (Int32)}
     */
    static NoData => 0

    /**
     * Only the current user's data can be accessed using this session.
     * @type {Integer (Int32)}
     */
    static CurrentUserData => 1

    /**
     * All User data can be accessed using this session.
     * @type {Integer (Int32)}
     */
    static AllUserData => 2
}
