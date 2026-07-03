#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MSA_INFO_ACCOUNT_TYPE.ahk" { MSA_INFO_ACCOUNT_TYPE }
#Import ".\MSA_INFO_STATE.ahk" { MSA_INFO_STATE }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct MSA_INFO_1 {
    #StructPack 4

    State : MSA_INFO_STATE

    AccountType : MSA_INFO_ACCOUNT_TYPE

}
