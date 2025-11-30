#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/ne-wdstptmgmt-wdstransport_tftp_capability
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDSTRANSPORT_TFTP_CAPABILITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WdsTptTftpCapMaximumBlockSize => 1

    /**
     * @type {Integer (Int32)}
     */
    static WdsTptTftpCapVariableWindow => 2
}
