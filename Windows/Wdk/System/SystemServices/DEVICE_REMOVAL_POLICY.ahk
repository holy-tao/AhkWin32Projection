#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DEVICE_REMOVAL_POLICY extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static RemovalPolicyExpectNoRemoval => 1

    /**
     * @type {Integer (Int32)}
     */
    static RemovalPolicyExpectOrderlyRemoval => 2

    /**
     * @type {Integer (Int32)}
     */
    static RemovalPolicyExpectSurpriseRemoval => 3
}
