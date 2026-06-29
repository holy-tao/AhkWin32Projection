#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PaxosTagCStruct.ahk" { PaxosTagCStruct }

/**
 * Contains information used to update and validate a PaxosTagCStruct structure.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-witnesstagupdatehelper
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct WitnessTagUpdateHelper {
    #StructPack 8

    /**
     * The cluster configuration version to validate.
     */
    Version : Int32

    /**
     * The Paxos tag to update.
     */
    paxosToSet : PaxosTagCStruct

    /**
     * The Paxos tag to validate.
     */
    paxosToValidate : PaxosTagCStruct

}
