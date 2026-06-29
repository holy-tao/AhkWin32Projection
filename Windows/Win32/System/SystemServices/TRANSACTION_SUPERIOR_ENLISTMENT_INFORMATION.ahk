#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TRANSACTION_ENLISTMENT_PAIR.ahk" { TRANSACTION_ENLISTMENT_PAIR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TRANSACTION_SUPERIOR_ENLISTMENT_INFORMATION {
    #StructPack 4

    SuperiorEnlistmentPair : TRANSACTION_ENLISTMENT_PAIR

}
