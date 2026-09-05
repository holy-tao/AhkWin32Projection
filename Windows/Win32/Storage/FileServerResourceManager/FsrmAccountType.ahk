#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the computer account types under which a command action (see FsrmActionType) can run.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmaccounttype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmAccountType extends Win32Enum {

    /**
     * The account type is unknown. Do not use this value to set the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactioncommand-get_account">IFsrmActionCommand::Account</a> property.
     * Native name: FsrmAccountType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Run the command or pipeline module under the "NetworkService" account.
     * Native name: FsrmAccountType_NetworkService
     * @type {Integer (Int32)}
     */
    static NetworkService => 1

    /**
     * Run the command or pipeline module under the "LocalService" account.
     * Native name: FsrmAccountType_LocalService
     * @type {Integer (Int32)}
     */
    static LocalService => 2

    /**
     * Run the command or pipeline module under the "LocalSystem" account.
     * Native name: FsrmAccountType_LocalSystem
     * @type {Integer (Int32)}
     */
    static LocalSystem => 3

    /**
     * This value is reserved for internal use.
     * Native name: FsrmAccountType_InProc
     * @type {Integer (Int32)}
     */
    static InProc => 4

    /**
     * Run the classifier or storage module in a separate process from FSRM (FSRM uses 
     *       <b>CLSCTX_LOCAL_SERVER</b> to instantiate the module). The module's COM registration 
     *       specifies the account used to run the module. If the registration does not specify the account, the module is 
     *       run using the user's account.
     * Native name: FsrmAccountType_External
     * @type {Integer (Int32)}
     */
    static External => 5

    /**
     * Run the command or pipeline module under the account that FSRM selects. This is the recommended value.
     * 
     * <b>Windows Server 2008 R2 and Windows Server 2008:  </b>This enumeration value is not supported before Windows Server 2012.
     * Native name: FsrmAccountType_Automatic
     * @type {Integer (Int32)}
     */
    static Automatic => 500
}
