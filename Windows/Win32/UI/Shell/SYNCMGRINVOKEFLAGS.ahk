#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The SYNCMGRINVOKEFLAGS enumeration value specifies how the Sync Manager is to be invoked in the ISyncMgrSynchronizeInvoke::UpdateItems method.
 * @see https://docs.microsoft.com/windows/win32/api//mobsync/ne-mobsync-syncmgrinvokeflags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGRINVOKEFLAGS extends Win32Enum{

    /**
     * Immediately start the synchronization without displaying the <b>Choice</b> dialog box.
     * @type {Integer (Int32)}
     */
    static SYNCMGRINVOKE_STARTSYNC => 2

    /**
     * Indicates that the <b>Choice</b> dialog should be minimized by default.
     * @type {Integer (Int32)}
     */
    static SYNCMGRINVOKE_MINIMIZED => 4
}
