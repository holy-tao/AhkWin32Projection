#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DEVICE_REMOVAL_POLICY extends Win32Enum {

    /**
     * Native name: RemovalPolicyExpectNoRemoval
     * @type {Integer (Int32)}
     */
    static ExpectNoRemoval => 1

    /**
     * Native name: RemovalPolicyExpectOrderlyRemoval
     * @type {Integer (Int32)}
     */
    static ExpectOrderlyRemoval => 2

    /**
     * Native name: RemovalPolicyExpectSurpriseRemoval
     * @type {Integer (Int32)}
     */
    static ExpectSurpriseRemoval => 3
}
