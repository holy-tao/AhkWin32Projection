#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the type of property value to be returned by the GetStringProperty method or set by the SetStringProperty method on the IX509PolicyServerUrl interface.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-policyserverurlpropertyid
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class PolicyServerUrlPropertyID extends Win32Enum{

    /**
     * Specify or retrieve an ID for the policy server.
     * @type {Integer (Int32)}
     */
    static PsPolicyID => 0

    /**
     * Specify or retrieve a display name for the policy server.
     * @type {Integer (Int32)}
     */
    static PsFriendlyName => 1
}
