#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * The DSMCC_FILTER_OPTIONS structure specifies additional filtering criteria for the DSM-CC portions of the section header.
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2structs/ns-mpeg2structs-dsmcc_filter_options
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class DSMCC_FILTER_OPTIONS extends Win32Struct
{
    static sizeof => 60

    static packingSize => 4

    /**
     * If this flag is <b>TRUE</b>, the protocolDiscriminator field in the header must match the value of the <b>Protocol</b> structure member. Otherwise, the protocolDiscriminator field is ignored.
     * @type {BOOL}
     */
    fSpecifyProtocol{
        get {
            if(!this.HasProp("__fSpecifyProtocol"))
                this.__fSpecifyProtocol := BOOL(this.ptr + 0)
            return this.__fSpecifyProtocol
        }
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
     * @type {BOOL}
     */
    fSpecifyType{
        get {
            if(!this.HasProp("__fSpecifyType"))
                this.__fSpecifyType := BOOL(this.ptr + 8)
            return this.__fSpecifyType
        }
    }

    /**
     * Specifies a value for the dsmccType field, which defines the DSM-CC message type.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * If this flag is <b>TRUE</b>, the messageId field in the header must match the value of the <b>MessageId</b> structure member. Otherwise, the messageId field is ignored.
     * @type {BOOL}
     */
    fSpecifyMessageId{
        get {
            if(!this.HasProp("__fSpecifyMessageId"))
                this.__fSpecifyMessageId := BOOL(this.ptr + 16)
            return this.__fSpecifyMessageId
        }
    }

    /**
     * Specifies a value for the messageId field, which defines the DSM-CC message within the scope of the message type.
     * @type {Integer}
     */
    MessageId {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * If this flag is <b>TRUE</b>, the transactionId (or downloadId) field in the header must match the value of the <b>TransactionId</b> structure member. Otherwise, the transactionId/downloadId field is ignored.
     * @type {BOOL}
     */
    fSpecifyTransactionId{
        get {
            if(!this.HasProp("__fSpecifyTransactionId"))
                this.__fSpecifyTransactionId := BOOL(this.ptr + 24)
            return this.__fSpecifyTransactionId
        }
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
     * @type {BOOL}
     */
    fUseTrxIdMessageIdMask{
        get {
            if(!this.HasProp("__fUseTrxIdMessageIdMask"))
                this.__fUseTrxIdMessageIdMask := BOOL(this.ptr + 28)
            return this.__fUseTrxIdMessageIdMask
        }
    }

    /**
     * Specifies a value for the transactionId field.
     * @type {Integer}
     */
    TransactionId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * If this flag is <b>TRUE</b>, the moduleVersion field in the header must match the value of the <b>ModuleVersion</b> structure member. Otherwise, the moduleVersion field is ignored.
     * @type {BOOL}
     */
    fSpecifyModuleVersion{
        get {
            if(!this.HasProp("__fSpecifyModuleVersion"))
                this.__fSpecifyModuleVersion := BOOL(this.ptr + 36)
            return this.__fSpecifyModuleVersion
        }
    }

    /**
     * Specifies a value for the moduleVersion field.
     * @type {Integer}
     */
    ModuleVersion {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }

    /**
     * If this flag is <b>TRUE</b>, the blockNumber field in the header must match the value of the BlockNumber structure member. Otherwise, the moduleVersion field is ignored.
     * @type {BOOL}
     */
    fSpecifyBlockNumber{
        get {
            if(!this.HasProp("__fSpecifyBlockNumber"))
                this.__fSpecifyBlockNumber := BOOL(this.ptr + 44)
            return this.__fSpecifyBlockNumber
        }
    }

    /**
     * Specifies a value for the blockNumber field.
     * @type {Integer}
     */
    BlockNumber {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * If this flag is <b>TRUE</b>, the <b>NumberOfBlocksInModule</b> structure member specifies the number of blocks in the module. Applies only to download data block (DDB) messages.
     * @type {BOOL}
     */
    fGetModuleCall{
        get {
            if(!this.HasProp("__fGetModuleCall"))
                this.__fGetModuleCall := BOOL(this.ptr + 52)
            return this.__fGetModuleCall
        }
    }

    /**
     * Specifies the number of blocks in the module. Applies only to DDB messages.
     * @type {Integer}
     */
    NumberOfBlocksInModule {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }
}
