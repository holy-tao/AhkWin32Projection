#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The DSMCC_FILTER_OPTIONS structure specifies additional filtering criteria for the DSM-CC portions of the section header.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-dsmcc_filter_options
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct DSMCC_FILTER_OPTIONS {
    #StructPack 4

    /**
     * If this flag is <b>TRUE</b>, the protocolDiscriminator field in the header must match the value of the <b>Protocol</b> structure member. Otherwise, the protocolDiscriminator field is ignored.
     */
    fSpecifyProtocol : BOOL

    /**
     * Specifies a value for the protocolDiscriminator field. For MPEG-2 DSM-CC messages, this field must equal 0x11.
     */
    Protocol : Int8

    /**
     * If this field is <b>TRUE</b>, the dsmccType field in the header must match the value of the <b>Type</b> structure member. Otherwise, the dsmccType field is ignored.
     */
    fSpecifyType : BOOL

    /**
     * Specifies a value for the dsmccType field, which defines the DSM-CC message type.
     */
    Type : Int8

    /**
     * If this flag is <b>TRUE</b>, the messageId field in the header must match the value of the <b>MessageId</b> structure member. Otherwise, the messageId field is ignored.
     */
    fSpecifyMessageId : BOOL

    /**
     * Specifies a value for the messageId field, which defines the DSM-CC message within the scope of the message type.
     */
    MessageId : UInt16

    /**
     * If this flag is <b>TRUE</b>, the transactionId (or downloadId) field in the header must match the value of the <b>TransactionId</b> structure member. Otherwise, the transactionId/downloadId field is ignored.
     */
    fSpecifyTransactionId : BOOL

    /**
     * If this flag is <b>TRUE</b>, the transactionId bits are masked so that the following subfields are ignored:
     * 
     * <ul>
     * <li>Updated flag</li>
     * <li>Version </li>
     * </ul>
     * The following subfields are matched against the <b>TransactionId</b> structure member:
     * 
     * <ul>
     * <li>Identification</li>
     * <li>Originator</li>
     * </ul>
     * For more information about the subfields within the transactionId, see section 4.6.5 of TR 101 202, <i>Digital Video Broadcasting (DVB); Implementation Guidelines for Data Broadcasting</i>. (This resource may not be available in some languages 
     * 
     * and countries.)
     * 
     * This flag is ignored if <b>fSpecifyTransactionId</b> is <b>FALSE</b>.
     */
    fUseTrxIdMessageIdMask : BOOL

    /**
     * Specifies a value for the transactionId field.
     */
    TransactionId : UInt32

    /**
     * If this flag is <b>TRUE</b>, the moduleVersion field in the header must match the value of the <b>ModuleVersion</b> structure member. Otherwise, the moduleVersion field is ignored.
     */
    fSpecifyModuleVersion : BOOL

    /**
     * Specifies a value for the moduleVersion field.
     */
    ModuleVersion : Int8

    /**
     * If this flag is <b>TRUE</b>, the blockNumber field in the header must match the value of the BlockNumber structure member. Otherwise, the moduleVersion field is ignored.
     */
    fSpecifyBlockNumber : BOOL

    /**
     * Specifies a value for the blockNumber field.
     */
    BlockNumber : UInt16

    /**
     * If this flag is <b>TRUE</b>, the <b>NumberOfBlocksInModule</b> structure member specifies the number of blocks in the module. Applies only to download data block (DDB) messages.
     */
    fGetModuleCall : BOOL

    /**
     * Specifies the number of blocks in the module. Applies only to DDB messages.
     */
    NumberOfBlocksInModule : UInt16

}
