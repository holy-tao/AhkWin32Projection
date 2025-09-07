#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used in the SYNCMGRHANDLERINFO structure as flags that apply to the current handler.
 * @remarks
 * Only the <b><b>SYNCMGRHANDLER_HASPROPERTIES</b></b> and <b><b>SYNCMGRHANDLER_HIDDEN</b></b> flags are recognized by Windows Vista. Although Windows Vista recognizes the <b><b>SYNCMGRHANDLER_HIDDEN</b></b> flag, it does not currently use it.  
  * 
  * All flags are still valid for previous versions of Windows.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ne-mobsync-syncmgrhandlerflags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGRHANDLERFLAGS{

    /**
     * The current handler provides a property sheet dialog.
     * @type {Integer (Int32)}
     */
    static SYNCMGRHANDLER_HASPROPERTIES => 1

    /**
     * May call back the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-establishconnection">ISyncMgrSynchronizeCallback::EstablishConnection</a> method. This value is ignored in <b>Windows Vista and later</b>.
     * @type {Integer (Int32)}
     */
    static SYNCMGRHANDLER_MAYESTABLISHCONNECTION => 2

    /**
     * Indicates Show Handler in Choice even if items are not shown. This value is ignored in <b>Windows Vista and later</b>.
     * @type {Integer (Int32)}
     */
    static SYNCMGRHANDLER_ALWAYSLISTHANDLER => 4

    /**
     * <b>Windows Vista and later</b>. Do not display handler or item.  This value is ignored by <b>Windows Vista</b>.
     * @type {Integer (Int32)}
     */
    static SYNCMGRHANDLER_HIDDEN => 8
}
