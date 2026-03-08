#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Prevents processes associated with the job from creating desktops and switching desktops using the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createdesktopa">CreateDesktop</a> and 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-switchdesktop">SwitchDesktop</a> functions.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_basic_ui_restrictions
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOB_OBJECT_UILIMIT extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_HANDLES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_READCLIPBOARD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_WRITECLIPBOARD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_SYSTEMPARAMETERS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_DISPLAYSETTINGS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_GLOBALATOMS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_DESKTOP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_EXITWINDOWS => 128
}
