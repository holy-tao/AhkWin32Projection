#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the possible change events that are used by the FILESHARE_CHANGE structure to describe an entry in a file share event notification list.
 * @remarks
 * <b>NNLEN</b> is defined by ClusAPI.h as follows.
 * 
 * 
 * ``` syntax
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-fileshare_change_enum
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct FILESHARE_CHANGE_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
