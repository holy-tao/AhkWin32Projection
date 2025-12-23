#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FILE_ID_128.ahk

/**
 * Specifies the type of ID that is being used.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_id_descriptor
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_ID_DESCRIPTOR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size of this <b>FILE_ID_DESCRIPTOR</b> 
     *       structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The discriminator for the union indicating the type of identifier that is being passed.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FileIdType"></a><a id="fileidtype"></a><a id="FILEIDTYPE"></a><dl>
     * <dt><b>FileIdType</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the <b>FileId</b> member of the union.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ObjectIdType"></a><a id="objectidtype"></a><a id="OBJECTIDTYPE"></a><dl>
     * <dt><b>ObjectIdType</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the <b>ObjectId</b> member of the union.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ExtendedFileIdType"></a><a id="extendedfileidtype"></a><a id="EXTENDEDFILEIDTYPE"></a><dl>
     * <dt><b>ExtendedFileIdType</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the <b>ExtendedFileId</b> member of the union.
     *         
     * 
     * <b>Windows XP, Windows Server 2003, Windows Vista, Windows Server 2008, Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    FileId {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    ObjectId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {FILE_ID_128}
     */
    ExtendedFileId{
        get {
            if(!this.HasProp("__ExtendedFileId"))
                this.__ExtendedFileId := FILE_ID_128(8, this)
            return this.__ExtendedFileId
        }
    }
}
