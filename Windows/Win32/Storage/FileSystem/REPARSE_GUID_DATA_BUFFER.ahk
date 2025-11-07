#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a reparse point.
 * @remarks
 * 
 * The <b>REPARSE_GUID_DATA_BUFFER</b> structure is 
 *     used by all third-party layered drivers to store data for a reparse point. Each reparse point contains one 
 *     instance of a <b>REPARSE_GUID_DATA_BUFFER</b> 
 *     structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-reparse_guid_data_buffer
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class REPARSE_GUID_DATA_BUFFER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _GenericReparseBuffer extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Array<Byte>}
         */
        DataBuffer{
            get {
                if(!this.HasProp("__DataBufferProxyArray"))
                    this.__DataBufferProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
                return this.__DataBufferProxyArray
            }
        }
    
    }

    /**
     * The reparse point tag. This member identifies the structure of the user-defined reparse data. For more 
     *       information, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/reparse-point-tags">Reparse Point Tags</a>.
     * @type {Integer}
     */
    ReparseTag {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the reparse data in the <b>DataBuffer</b> member, in bytes. This value may 
     *       vary with different tags and may vary between two uses of the same tag.
     * @type {Integer}
     */
    ReparseDataLength {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * A <b>GUID</b> that uniquely identifies the  reparse point. When setting a reparse 
     *       point, the application must provide a non-NULL <b>GUID</b> in the 
     *       <b>ReparseGuid</b> member. When retrieving a reparse point from the file system, 
     *       <b>ReparseGuid</b> is the <b>GUID</b> assigned when the reparse point 
     *       was set.
     * @type {Pointer<Guid>}
     */
    ReparseGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {_GenericReparseBuffer}
     */
    GenericReparseBuffer{
        get {
            if(!this.HasProp("__GenericReparseBuffer"))
                this.__GenericReparseBuffer := %this.__Class%._GenericReparseBuffer(16, this)
            return this.__GenericReparseBuffer
        }
    }
}
