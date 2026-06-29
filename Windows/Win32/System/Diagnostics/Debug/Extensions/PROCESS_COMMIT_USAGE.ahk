#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PROCESS_COMMIT_USAGE {
    #StructPack 8

    ImageFileName : Int8[16]

    ClientId : Int64

    ProcessAddress : Int64

    CommitCharge : Int64

    SharedCommitCharge : Int64

    ReleasedCommitDebt : Int64

    Reserved : Int64

}
