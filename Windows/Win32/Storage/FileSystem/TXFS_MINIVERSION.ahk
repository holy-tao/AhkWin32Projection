#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The view of the file as of its last commit.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-createfiletransacteda
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class TXFS_MINIVERSION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_MINIVERSION_COMMITTED_VIEW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_MINIVERSION_DIRTY_VIEW => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_MINIVERSION_DEFAULT_VIEW => 65534
}
