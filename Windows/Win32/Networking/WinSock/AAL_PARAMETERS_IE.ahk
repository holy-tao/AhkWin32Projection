#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\AAL5_PARAMETERS.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class AAL_PARAMETERS_IE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    AALType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {AAL5_PARAMETERS}
     */
    AAL5Parameters{
        get {
            if(!this.HasProp("__AAL5Parameters"))
                this.__AAL5Parameters := AAL5_PARAMETERS(this.ptr + 4)
            return this.__AAL5Parameters
        }
    }

    /**
     * @type {Integer}
     */
    AALUserParameters {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
