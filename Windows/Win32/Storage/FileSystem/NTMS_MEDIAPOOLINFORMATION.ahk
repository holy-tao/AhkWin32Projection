#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NTMS_MEDIAPOOLINFORMATION structure defines the properties specific to a media pool object.
 * @remarks
 * 
 * The 
 * <b>NTMS_MEDIAPOOLINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ntmsapi/ns-ntmsapi-ntms_mediapoolinformation
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NTMS_MEDIAPOOLINFORMATION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

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
     * @type {Integer}
     */
    PoolType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Single media type that makes up each media pool.
     * @type {Pointer<Guid>}
     */
    MediaType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Parent media pool or <b>NULL</b>.
     * @type {Pointer<Guid>}
     */
    Parent {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

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
     * @type {Integer}
     */
    AllocationPolicy {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

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
     * @type {Integer}
     */
    DeallocationPolicy {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Number of times the medium can be allocated and deallocated. This member is writable.
     * @type {Integer}
     */
    dwMaxAllocates {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Number of physical media in this media pool.
     * @type {Integer}
     */
    dwNumberOfPhysicalMedia {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Number of logical media in this media pool.
     * @type {Integer}
     */
    dwNumberOfLogicalMedia {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Number of media pools in this media pool.
     * @type {Integer}
     */
    dwNumberOfMediaPools {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
