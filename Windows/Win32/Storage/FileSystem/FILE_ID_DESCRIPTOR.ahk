#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_ID_128.ahk" { FILE_ID_128 }
#Import ".\FILE_ID_TYPE.ahk" { FILE_ID_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Specifies the type of ID that is being used.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_id_descriptor
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_ID_DESCRIPTOR {
    #StructPack 8

    /**
     * The size of this <b>FILE_ID_DESCRIPTOR</b> 
     *       structure.
     */
    dwSize : UInt32

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
     */
    Type : FILE_ID_TYPE

    FileId : Int64

    static __New() {
        DefineProp(this.Prototype, 'ObjectId', { type: Guid, offset: 8 })
        DefineProp(this.Prototype, 'ExtendedFileId', { type: FILE_ID_128, offset: 8 })
        this.DeleteProp("__New")
    }
}
