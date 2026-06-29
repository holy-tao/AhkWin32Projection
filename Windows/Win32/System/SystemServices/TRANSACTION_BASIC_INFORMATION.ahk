#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TRANSACTION_BASIC_INFORMATION {
    #StructPack 4

    TransactionId : Guid

    State : UInt32

    Outcome : UInt32

}
