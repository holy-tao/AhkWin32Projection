#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_PROCESS_IDS_USING_FILE_INFORMATION {
    #StructPack 8

    NumberOfProcessIdsInList : UInt32

    ProcessIdList : IntPtr[1]

}
