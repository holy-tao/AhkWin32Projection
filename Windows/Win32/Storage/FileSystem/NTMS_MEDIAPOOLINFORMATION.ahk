#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The NTMS_MEDIAPOOLINFORMATION structure defines the properties specific to a media pool object.
 * @remarks
 * The 
 * <b>NTMS_MEDIAPOOLINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_mediapoolinformation
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NTMS_MEDIAPOOLINFORMATION {
    #StructPack 4

    /**
     * NTMS supports the following media pool types. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NTMS_POOLTYPE_UNKNOWN"></a><a id="ntms_pooltype_unknown"></a><dl>
     * <dt><b>NTMS_POOLTYPE_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown pool type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NTMS_POOLTYPE_SCRATCH"></a><a id="ntms_pooltype_scratch"></a><dl>
     * <dt><b>NTMS_POOLTYPE_SCRATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Media that is available to other applications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NTMS_POOLTYPE_FOREIGN"></a><a id="ntms_pooltype_foreign"></a><dl>
     * <dt><b>NTMS_POOLTYPE_FOREIGN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Media that has been written to and does not contain a recognizable on-media identifier label-type or label ID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NTMS_POOLTYPE_IMPORT"></a><a id="ntms_pooltype_import"></a><dl>
     * <dt><b>NTMS_POOLTYPE_IMPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Media that has been written to, has a recognizable on-media identifier label type but an unrecognizable label ID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NTMS_POOLTYPE_APPLICATION"></a><a id="ntms_pooltype_application"></a><dl>
     * <dt><b>NTMS_POOLTYPE_APPLICATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Media pool created by an application. One or more application media pools can be created per system.
     * 
     * </td>
     * </tr>
     * </table>
     */
    PoolType : UInt32

    /**
     * Single media type that makes up each media pool.
     */
    MediaType : Guid

    /**
     * Parent media pool or <b>NULL</b>.
     */
    Parent : Guid

    /**
     * Bit field indicating action at allocation time. This member is writable. This can be the following value. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NTMS_ALLOCATE_FROMSCRATCH"></a><a id="ntms_allocate_fromscratch"></a><dl>
     * <dt><b>NTMS_ALLOCATE_FROMSCRATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draw media from free if none is available in the pool. The default is not to draw from free.
     * 
     * </td>
     * </tr>
     * </table>
     */
    AllocationPolicy : UInt32

    /**
     * Bit field indicating action at deallocation time. This member is writable. This can be the following value. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NTMS_DEALLOCATE_TOSCRATCH"></a><a id="ntms_deallocate_toscratch"></a><dl>
     * <dt><b>NTMS_DEALLOCATE_TOSCRATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return media to free when available. The default is not to return to free.
     * 
     * </td>
     * </tr>
     * </table>
     */
    DeallocationPolicy : UInt32

    /**
     * Number of times the medium can be allocated and deallocated. This member is writable.
     */
    dwMaxAllocates : UInt32

    /**
     * Number of physical media in this media pool.
     */
    dwNumberOfPhysicalMedia : UInt32

    /**
     * Number of logical media in this media pool.
     */
    dwNumberOfLogicalMedia : UInt32

    /**
     * Number of media pools in this media pool.
     */
    dwNumberOfMediaPools : UInt32

}
