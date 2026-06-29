#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains information about a reparse point.
 * @remarks
 * The <b>REPARSE_GUID_DATA_BUFFER</b> structure is 
 *     used by all third-party layered drivers to store data for a reparse point. Each reparse point contains one 
 *     instance of a <b>REPARSE_GUID_DATA_BUFFER</b> 
 *     structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-reparse_guid_data_buffer
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct REPARSE_GUID_DATA_BUFFER {
    #StructPack 4


    struct _GenericReparseBuffer {
        DataBuffer : Int8[1]

    }

    /**
     * The reparse point tag. This member identifies the structure of the user-defined reparse data. For more 
     *       information, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/reparse-point-tags">Reparse Point Tags</a>.
     */
    ReparseTag : UInt32

    /**
     * The size of the reparse data in the <b>DataBuffer</b> member, in bytes. This value may 
     *       vary with different tags and may vary between two uses of the same tag.
     */
    ReparseDataLength : UInt16

    /**
     * Reserved; do not use.
     */
    Reserved : UInt16

    /**
     * A <b>GUID</b> that uniquely identifies the  reparse point. When setting a reparse 
     *       point, the application must provide a non-NULL <b>GUID</b> in the 
     *       <b>ReparseGuid</b> member. When retrieving a reparse point from the file system, 
     *       <b>ReparseGuid</b> is the <b>GUID</b> assigned when the reparse point 
     *       was set.
     */
    ReparseGuid : Guid

    GenericReparseBuffer : REPARSE_GUID_DATA_BUFFER._GenericReparseBuffer

}
