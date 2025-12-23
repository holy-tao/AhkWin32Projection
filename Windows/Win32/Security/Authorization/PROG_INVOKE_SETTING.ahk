#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the initial setting of the function used to track the progress of a call to the TreeSetNamedSecurityInfo or TreeResetNamedSecurityInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/accctrl/ne-accctrl-prog_invoke_setting
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class PROG_INVOKE_SETTING extends Win32Enum{

    /**
     * Never invoke the progress function.
     * @type {Integer (Int32)}
     */
    static ProgressInvokeNever => 1

    /**
     * Invoke the progress function for every object.
     * @type {Integer (Int32)}
     */
    static ProgressInvokeEveryObject => 2

    /**
     * Invoke the progress function only when an error is encountered.
     * @type {Integer (Int32)}
     */
    static ProgressInvokeOnError => 3

    /**
     * Discontinue the tree operation.
     * 
     * <div class="alert"><b>Note</b>  The original state of the tree will not be reset, and the results are unpredictable.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static ProgressCancelOperation => 4

    /**
     * Retry the tree operation.
     * @type {Integer (Int32)}
     */
    static ProgressRetryOperation => 5

    /**
     * Invoke the progress function before and after applying security on the object and on the error.
     * @type {Integer (Int32)}
     */
    static ProgressInvokePrePostError => 6
}
