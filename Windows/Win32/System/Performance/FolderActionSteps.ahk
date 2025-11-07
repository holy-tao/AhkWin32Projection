#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the action that the data manager takes when both the age and size limits are met.
 * @remarks
 * 
 * Specify one or more actions. The data manager applies the actions in the order in which they are defined in this enumeration.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/ne-pla-folderactionsteps
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class FolderActionSteps{

    /**
     * Creates a cabinet file. The name of the cabinet file is  <i>nameofthesubfolder</i>.cab.
     * @type {Integer (Int32)}
     */
    static plaCreateCab => 1

    /**
     * Deletes all files in the folder, except the report and cabinet file.
     * @type {Integer (Int32)}
     */
    static plaDeleteData => 2

    /**
     * Sends the cabinet file to the location specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ifolderaction-get_sendcabto">IFolderAction::SendCabTo</a> property.
     * @type {Integer (Int32)}
     */
    static plaSendCab => 4

    /**
     * Deletes the cabinet file.
     * @type {Integer (Int32)}
     */
    static plaDeleteCab => 8

    /**
     * Deletes the report file.
     * @type {Integer (Int32)}
     */
    static plaDeleteReport => 16
}
