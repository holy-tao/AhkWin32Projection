#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TRANSACTION_LIST_ENTRY.ahk" { TRANSACTION_LIST_ENTRY }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TRANSACTION_LIST_INFORMATION {
    #StructPack 4

    NumberOfTransactions : UInt32

    TransactionInformation : TRANSACTION_LIST_ENTRY[1]

}
