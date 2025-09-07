#Requires AutoHotkey v2.0.0 64-bit

/**
 * Controls aspects of moniker binding operations.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-bind_flags
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class BIND_FLAGS{

    /**
     * If this flag is specified, the moniker implementation can interact with the end user. Otherwise, the moniker implementation should not interact with the user in any way, such as by asking for a password for a network volume that needs mounting. If prohibited from interacting with the user when it otherwise would, a moniker implementation can use a different algorithm that does not require user interaction, or it can fail with the error MK_E_MUSTBOTHERUSER.
     * @type {Integer (Int32)}
     */
    static BIND_MAYBOTHERUSER => 1

    /**
     * If this flag is specified, the caller is not interested in having the operation carried out, but only in learning whether the operation could have been carried out had this flag not been specified. For example, this flag lets the caller indicate only an interest in finding out whether an object actually exists by using this flag in a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a> call. Moniker implementations can, however, ignore this possible optimization and carry out the operation in full. Callers must be able to deal with both cases.
     * @type {Integer (Int32)}
     */
    static BIND_JUSTTESTEXISTENCE => 2
}
