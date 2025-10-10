#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the computer account types under which a command action (see FsrmActionType) can run.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmaccounttype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmAccountType{

    /**
     * The account type is unknown. Do not use this value to set the 
 *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactioncommand-get_account">IFsrmActionCommand::Account</a> property.
     * @type {Integer (Int32)}
     */
    static FsrmAccountType_Unknown => 0

    /**
     * Run the command or pipeline module under the "NetworkService" account.
     * @type {Integer (Int32)}
     */
    static FsrmAccountType_NetworkService => 1

    /**
     * Run the command or pipeline module under the "LocalService" account.
     * @type {Integer (Int32)}
     */
    static FsrmAccountType_LocalService => 2

    /**
     * Run the command or pipeline module under the "LocalSystem" account.
     * @type {Integer (Int32)}
     */
    static FsrmAccountType_LocalSystem => 3

    /**
     * This value is reserved for internal use.
     * @type {Integer (Int32)}
     */
    static FsrmAccountType_InProc => 4

    /**
     * Run the classifier or storage module in a separate process from FSRM (FSRM uses 
 *       <b>CLSCTX_LOCAL_SERVER</b> to instantiate the module). The module's COM registration 
 *       specifies the account used to run the module. If the registration does not specify the account, the module is 
 *       run using the user's account.
     * @type {Integer (Int32)}
     */
    static FsrmAccountType_External => 5

    /**
     * Run the command or pipeline module under the account that FSRM selects. This is the recommended value.
 * 
 * <b>Windows Server 2008 R2 and Windows Server 2008:  </b>This enumeration value is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmAccountType_Automatic => 500
}
