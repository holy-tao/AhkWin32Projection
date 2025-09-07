#Requires AutoHotkey v2.0.0 64-bit

/**
 * The LOCKTYPE enumeration values indicate the type of locking requested for the specified range of bytes. The values are used in the ILockBytes::LockRegion and IStream::LockRegion methods.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-locktype
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class LOCKTYPE{

    /**
     * If this lock is granted, the specified range of bytes can be opened and read any number of times, but writing to the locked range is prohibited except for the owner that was granted this lock.
     * @type {Integer (Int32)}
     */
    static LOCK_WRITE => 1

    /**
     * If this lock is granted, writing to the specified range of bytes is prohibited except by the owner that was granted this lock.
     * @type {Integer (Int32)}
     */
    static LOCK_EXCLUSIVE => 2

    /**
     * If this lock is granted, no other <b>LOCK_ONLYONCE</b> lock can be obtained on the range. Usually this lock type is an alias for some other lock type. Thus, specific implementations can have additional behavior associated with this lock type.
     * @type {Integer (Int32)}
     */
    static LOCK_ONLYONCE => 4
}
