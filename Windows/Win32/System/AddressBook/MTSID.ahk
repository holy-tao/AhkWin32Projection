#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the properties, members, and remarks for MTSID, which contains an X.400 message transport system (MTS) entry identifier.
 * @remarks
 * The **MTSID** structure is used only for X.400 mappings of MAPI entry identifiers. It corresponds to the MAPI [FLATENTRY](flatentry.md) structure. 
 *   
 * An MTS identifier has the same format as a MAPI entry identifier or a binary property value. MTS identifiers can be particularly useful for canceling deferred messages.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/mtsid
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct MTSID {
    #StructPack 4

    /**
     * > Count of bytes in the array described by the **abEntry** member.
     */
    cb : UInt32

    ab : Int8[1]

}
