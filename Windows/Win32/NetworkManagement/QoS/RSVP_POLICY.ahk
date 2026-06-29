#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RSVP_POLICY structure stores one or more undefined policy elements.
 * @remarks
 * RSVP transports the data contained in an <b>RSVP_POLICY</b> structure on behalf of the Policy Control component.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-rsvp_policy
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct RSVP_POLICY {
    #StructPack 2

    /**
     * Size of the entire element object, in bytes.
     */
    Len : UInt16

    /**
     * Type of RSVP policy element  in <b>Info</b>.
     */
    Type : UInt16

    /**
     * Policy data, expressed in UCHARs.
     */
    Info : Int8[4]

}
