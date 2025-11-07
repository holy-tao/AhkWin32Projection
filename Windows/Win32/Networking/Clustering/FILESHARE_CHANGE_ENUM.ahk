#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains the possible change events that are used by the FILESHARE_CHANGE structure to describe an entry in a file share event notification list.
 * @remarks
 * 
 * <b>NNLEN</b> is defined by ClusAPI.h as follows.
 * 
 * <pre class="syntax" xml:space="preserve"><c>#define NNLEN       80                  // Net name length (share name)</c></pre>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ne-clusapi-fileshare_change_enum
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class FILESHARE_CHANGE_ENUM{

    /**
     * This is a place holder value and is not a valid event.
     * @type {Integer (Int32)}
     */
    static FILESHARE_CHANGE_NONE => 0

    /**
     * A new file share resource has been created and will be included with the other file shares managed by the 
 *        File Server resource.
     * @type {Integer (Int32)}
     */
    static FILESHARE_CHANGE_ADD => 1

    /**
     * A file share resource has been deleted and will be removed from the file shares managed by the File Server 
 *        resource.
     * @type {Integer (Int32)}
     */
    static FILESHARE_CHANGE_DEL => 2

    /**
     * One or more properties of an existing file share resource have been changed.
     * @type {Integer (Int32)}
     */
    static FILESHARE_CHANGE_MODIFY => 3
}
