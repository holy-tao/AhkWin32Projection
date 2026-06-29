#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE.ahk" { CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE }
#Import ".\CLAIM_SECURITY_ATTRIBUTE_FLAGS.ahk" { CLAIM_SECURITY_ATTRIBUTE_FLAGS }

/**
 * Defines a resource attribute that is defined in continuous memory for persistence within a serialized security descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-claim_security_attribute_relative_v1
 * @namespace Windows.Win32.Security
 */
export default struct CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1 {
    #StructPack 4


    struct _Values {
        pInt64 : UInt32[1]

        static __New() {
            DefineProp(this.Prototype, 'pUint64', { type: UInt32[1], offset: 0 })
            DefineProp(this.Prototype, 'ppString', { type: UInt32[1], offset: 0 })
            DefineProp(this.Prototype, 'pFqbn', { type: UInt32[1], offset: 0 })
            DefineProp(this.Prototype, 'pOctetString', { type: UInt32[1], offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * A value that indicates an offset from the beginning of the <b>CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1</b> structure to a string of Unicode characters that contain the name of the claim security attribute. The string must be at least 4 bytes in length.
     */
    Name : UInt32

    ValueType : CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE

    /**
     * This member is currently reserved and must be set to zero when sent and must be ignored when received.
     */
    Reserved : UInt16

    Flags : CLAIM_SECURITY_ATTRIBUTE_FLAGS

    /**
     * The number of values contained in the <b>Values</b> member.
     */
    ValueCount : UInt32

    /**
     * An array of offsets from the beginning of the CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1 structure. Each offset indicates the location of a claim security attribute value of the type specified in the <b>ValueType</b> member.
     */
    Values : CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1._Values

}
