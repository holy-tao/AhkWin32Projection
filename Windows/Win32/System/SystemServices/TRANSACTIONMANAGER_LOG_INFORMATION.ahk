#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TRANSACTIONMANAGER_LOG_INFORMATION {
    #StructPack 4

    LogIdentity : Guid

}
