#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of the valid code sets (encodings) of a storage identifier.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_storage_identifier">VDS_STORAGE_IDENTIFIER</a> structure includes 
  *     a <b>VDS_STORAGE_IDENTIFIER_CODE_SET</b> value as a member to indicate the code set of a storage identifier.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_STORAGE_IDENTIFIER_CODE_SET</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_STORAGE_IDENTIFIER_CODE_SET</b> enumeration constant.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdslun/ne-vdslun-vds_storage_identifier_code_set
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_STORAGE_IDENTIFIER_CODE_SET{

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDSStorageIdCodeSetReserved => 0

    /**
     * The storage identifier is encoded as binary data.
     * @type {Integer (Int32)}
     */
    static VDSStorageIdCodeSetBinary => 1

    /**
     * The storage identifier is encoded as ASCII data.
     * @type {Integer (Int32)}
     */
    static VDSStorageIdCodeSetAscii => 2

    /**
     * The storage identifier is encoded as UTF-8.
 * 
 * <b>Windows Vista and Windows Server 2003:  </b>Not supported before Windows Vista with SP1 and Windows Server 2008.
     * @type {Integer (Int32)}
     */
    static VDSStorageIdCodeSetUtf8 => 3
}
