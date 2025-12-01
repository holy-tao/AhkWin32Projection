#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the set of possible EAP method properties.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ne-eaptypes-eap_method_property_type
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_METHOD_PROPERTY_TYPE extends Win32Enum{

    /**
     * Boolean method property for specifying the support for cipher suite negotiation.
     * @type {Integer (Int32)}
     */
    static emptPropCipherSuiteNegotiation => 0

    /**
     * Boolean method property for specifying the support for mutual authentication.
     * @type {Integer (Int32)}
     */
    static emptPropMutualAuth => 1

    /**
     * Boolean method property for specifying the support for message integrity.
     * @type {Integer (Int32)}
     */
    static emptPropIntegrity => 2

    /**
     * Boolean method property for specifying the support for replay protection.
     * @type {Integer (Int32)}
     */
    static emptPropReplayProtection => 3

    /**
     * Boolean method property for specifying the support for encrypting EAP messages.
     * @type {Integer (Int32)}
     */
    static emptPropConfidentiality => 4

    /**
     * Boolean method property for specifying the support for deriving exportable keying materials.
     * @type {Integer (Int32)}
     */
    static emptPropKeyDerivation => 5

    /**
     * Boolean method property for specifying the support for key length of at least 64 bits.
     * @type {Integer (Int32)}
     */
    static emptPropKeyStrength64 => 6

    /**
     * Boolean method property for specifying the support for key length of at least 128 bits.
     * @type {Integer (Int32)}
     */
    static emptPropKeyStrength128 => 7

    /**
     * Boolean method property for specifying the support for key length of at least 256 bits.
     * @type {Integer (Int32)}
     */
    static emptPropKeyStrength256 => 8

    /**
     * Boolean method property for specifying the support for key length of at least 512 bits.
     * @type {Integer (Int32)}
     */
    static emptPropKeyStrength512 => 9

    /**
     * Boolean method property for specifying the support for key length of at least 1024 bits.
     * @type {Integer (Int32)}
     */
    static emptPropKeyStrength1024 => 10

    /**
     * Boolean method property for specifying the support for preventing offline attack that has a work factor based on the number of passwords in an attacker’s dictionary.
     * @type {Integer (Int32)}
     */
    static emptPropDictionaryAttackResistance => 11

    /**
     * Boolean method property for specifying the support for establishing a security association in a smaller number of round trips by using the cached parameters of a previous successful authentication.
     * @type {Integer (Int32)}
     */
    static emptPropFastReconnect => 12

    /**
     * Boolean method property for specifying the support for preventing man-in-the-middle attacks in a tunneling method. The method supporting cryptobinding demonstrates to the EAP server that a single entity has acted as the EAP peer for all methods executed within a tunnel method.
     * @type {Integer (Int32)}
     */
    static emptPropCryptoBinding => 13

    /**
     * Boolean method property for specifying that passive attacks (such as capture of the EAP conversation) or active attacks (including compromise of the MSK or EMSK) do not compromise subsequent or prior MSKs or EMSKs.
     * @type {Integer (Int32)}
     */
    static emptPropSessionIndependence => 14

    /**
     * Boolean method property for specifying the support for fragmentation and reassembly of EAP packets exceeding the MTU size.
     * @type {Integer (Int32)}
     */
    static emptPropFragmentation => 15

    /**
     * Boolean method property for specifying the ability to communicate integrity-protected channel properties, such as endpoint identifiers, which can be compared to values communicated using out of band mechanisms, such as an Authentication, Authorization, and Accounting (AAA) protocol or the lower layer protocol.
     * @type {Integer (Int32)}
     */
    static emptPropChannelBinding => 16

    /**
     * Boolean method property for specifying the support for Network Access Protection.
     * @type {Integer (Int32)}
     */
    static emptPropNap => 17

    /**
     * Boolean method property for specifying the support for execution of the method on a standalone computer.
     * @type {Integer (Int32)}
     */
    static emptPropStandalone => 18

    /**
     * Boolean method property for specifying the support for Microsoft Point-to-Point Encryption (MPPE) protocol encryption.
     * @type {Integer (Int32)}
     */
    static emptPropMppeEncryption => 19

    /**
     * Boolean method property for specifying the ability of the method to tunnel other EAP methods.
     * @type {Integer (Int32)}
     */
    static emptPropTunnelMethod => 20

    /**
     * Boolean method property for specifying the support for method configuration and user interface.
     * @type {Integer (Int32)}
     */
    static emptPropSupportsConfig => 21

    /**
     * Boolean method property for specifying if the method was certified by the EAP Certification Program (ECP).
     * @type {Integer (Int32)}
     */
    static emptPropCertifiedMethod => 22

    /**
     * Boolean method property for specifying a hidden method.
     * @type {Integer (Int32)}
     */
    static emptPropHiddenMethod => 23

    /**
     * Boolean method property for specifying the support for computer authentication.
     * @type {Integer (Int32)}
     */
    static emptPropMachineAuth => 24

    /**
     * Boolean method property for specifying the support for user authentication.
     * @type {Integer (Int32)}
     */
    static emptPropUserAuth => 25

    /**
     * Boolean method property for specifying the support for identity privacy.
     * @type {Integer (Int32)}
     */
    static emptPropIdentityPrivacy => 26

    /**
     * Boolean method property for specifying the support for method chaining.
     * @type {Integer (Int32)}
     */
    static emptPropMethodChaining => 27

    /**
     * Boolean method property for specifying the support for shared state equivalence as defined in RFC4017.
     * @type {Integer (Int32)}
     */
    static emptPropSharedStateEquivalence => 28

    /**
     * <b>DWORD</b> property method for values sent prior to Windows 7.
     * @type {Integer (Int32)}
     */
    static emptLegacyMethodPropertyFlag => 31

    /**
     * String property method for specifying any vendor-specific property of the EAP method.
     * @type {Integer (Int32)}
     */
    static emptPropVendorSpecific => 255
}
