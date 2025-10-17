#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PaxosTagCStruct.ahk

/**
 * Contains information used to validate a PaxosTagCStruct structure.
 * @see https://docs.microsoft.com/windows/win32/api//resapi/ns-resapi-witnesstaghelper
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class WitnessTagHelper extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The cluster configuration version to validate.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The Paxos tag to validate.
     * @type {PaxosTagCStruct}
     */
    paxosToValidate{
        get {
            if(!this.HasProp("__paxosToValidate"))
                this.__paxosToValidate := PaxosTagCStruct(8, this)
            return this.__paxosToValidate
        }
    }
}
