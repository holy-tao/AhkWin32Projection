#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that specify the type of property value to be returned by the GetStringProperty method or set by the SetStringProperty method on the IX509PolicyServerUrl interface.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-policyserverurlpropertyid
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct PolicyServerUrlPropertyID {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
