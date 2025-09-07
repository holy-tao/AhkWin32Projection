#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The DSMCC_FILTER_OPTIONS structure specifies additional filtering criteria for the DSM-CC portions of the section header.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-dsmcc_filter_options
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class DSMCC_FILTER_OPTIONS extends Win32Struct
{
    static sizeof => 45

    static packingSize => 1

    /**
     * If this flag is <b>TRUE</b>, the protocolDiscriminator field in the header must match the value of the <b>Protocol</b> structure member. Otherwise, the protocolDiscriminator field is ignored.
     * @type {Integer}
     */
    fSpecifyProtocol {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies a value for the protocolDiscriminator field. For MPEG-2 DSM-CC messages, this field must equal 0x11.
     * @type {Integer}
     */
    Protocol {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * If this field is <b>TRUE</b>, the dsmccType field in the header must match the value of the <b>Type</b> structure member. Otherwise, the dsmccType field is ignored.
     * @type {Integer}
     */
    fSpecifyType {
        get => NumGet(this, 5, "int")
        set => NumPut("int", value, this, 5)
    }

    /**
     * Specifies a value for the dsmccType field, which defines the DSM-CC message type.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * If this flag is <b>TRUE</b>, the messageId field in the header must match the value of the <b>MessageId</b> structure member. Otherwise, the messageId field is ignored.
     * @type {Integer}
     */
    fSpecifyMessageId {
        get => NumGet(this, 10, "int")
        set => NumPut("int", value, this, 10)
    }

    /**
     * Specifies a value for the messageId field, which defines the DSM-CC message within the scope of the message type.
     * @type {Integer}
     */
    MessageId {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * If this flag is <b>TRUE</b>, the transactionId (or downloadId) field in the header must match the value of the <b>TransactionId</b> structure member. Otherwise, the transactionId/downloadId field is ignored.
     * @type {Integer}
     */
    fSpecifyTransactionId {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

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
     * @type {Integer}
     */
    fUseTrxIdMessageIdMask {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Specifies a value for the transactionId field.
     * @type {Integer}
     */
    TransactionId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * If this flag is <b>TRUE</b>, the moduleVersion field in the header must match the value of the <b>ModuleVersion</b> structure member. Otherwise, the moduleVersion field is ignored.
     * @type {Integer}
     */
    fSpecifyModuleVersion {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Specifies a value for the moduleVersion field.
     * @type {Integer}
     */
    ModuleVersion {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * If this flag is <b>TRUE</b>, the blockNumber field in the header must match the value of the BlockNumber structure member. Otherwise, the moduleVersion field is ignored.
     * @type {Integer}
     */
    fSpecifyBlockNumber {
        get => NumGet(this, 33, "int")
        set => NumPut("int", value, this, 33)
    }

    /**
     * Specifies a value for the blockNumber field.
     * @type {Integer}
     */
    BlockNumber {
        get => NumGet(this, 37, "ushort")
        set => NumPut("ushort", value, this, 37)
    }

    /**
     * If this flag is <b>TRUE</b>, the <b>NumberOfBlocksInModule</b> structure member specifies the number of blocks in the module. Applies only to download data block (DDB) messages.
     * @type {Integer}
     */
    fGetModuleCall {
        get => NumGet(this, 39, "int")
        set => NumPut("int", value, this, 39)
    }

    /**
     * Specifies the number of blocks in the module. Applies only to DDB messages.
     * @type {Integer}
     */
    NumberOfBlocksInModule {
        get => NumGet(this, 43, "ushort")
        set => NumPut("ushort", value, this, 43)
    }
}
