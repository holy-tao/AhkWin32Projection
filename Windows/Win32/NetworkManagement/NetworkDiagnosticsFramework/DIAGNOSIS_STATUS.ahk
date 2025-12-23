#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DIAGNOSIS_STATUS enumeration describes the result of a hypothesis submitted to a helper class in which the health of a component has been determined.
 * @see https://learn.microsoft.com/windows/win32/api/ndhelper/ne-ndhelper-diagnosis_status
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class DIAGNOSIS_STATUS extends Win32Enum{

    /**
     * A helper class is not implemented
     * @type {Integer (Int32)}
     */
    static DS_NOT_IMPLEMENTED => 0

    /**
     * The helper class has confirmed a problem existing in its component.
     * @type {Integer (Int32)}
     */
    static DS_CONFIRMED => 1

    /**
     * The helper class has determined that no problem exists.
     * @type {Integer (Int32)}
     */
    static DS_REJECTED => 2

    /**
     * The helper class is unable to determine whether there is a problem.
     * @type {Integer (Int32)}
     */
    static DS_INDETERMINATE => 3

    /**
     * The helper class is unable to perform the diagnosis at this time.
     * @type {Integer (Int32)}
     */
    static DS_DEFERRED => 4

    /**
     * The helper class has identified hypotheses to investigate further, but did not identify any problems in its own component.
     * 
     * Equivalent to <b>DS_INDETERMINATE</b>, but is later updated to <b>DS_REJECTED</b> if no hypothesis is confirmed.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows 7, Windows Server 2008 R2, and later.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static DS_PASSTHROUGH => 5
}
