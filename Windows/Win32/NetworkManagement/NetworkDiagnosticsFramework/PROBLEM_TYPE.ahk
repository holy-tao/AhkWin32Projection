#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PROBLEM_TYPE enumeration describes the type of problem a helper class indicates is present.
 * @see https://learn.microsoft.com/windows/win32/api/ndhelper/ne-ndhelper-problem_type
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class PROBLEM_TYPE extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PT_INVALID => 0

    /**
     * A low-health problem exists within the component itself. No problems were found within local components on which this component depends.
     * @type {Integer (Int32)}
     */
    static PT_LOW_HEALTH => 1

    /**
     * A low-health problem exists within local components on which this component depends.
     * @type {Integer (Int32)}
     */
    static PT_LOWER_HEALTH => 2

    /**
     * The low-health problem is in the out-of-box components this component depends on.
     * @type {Integer (Int32)}
     */
    static PT_DOWN_STREAM_HEALTH => 4

    /**
     * The component's resource is being highly utilized. No high utilization was found within local components on which this component depends.
     * @type {Integer (Int32)}
     */
    static PT_HIGH_UTILIZATION => 8

    /**
     * The causes of the component's high-utilization problem are from local components that depend on it.
     * @type {Integer (Int32)}
     */
    static PT_HIGHER_UTILIZATION => 16

    /**
     * The causes of the component's high-utilization problem are from upstream network components that depend on it.
     * @type {Integer (Int32)}
     */
    static PT_UP_STREAM_UTILIZATION => 32
}
