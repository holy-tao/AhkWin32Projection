#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\AAL5_PARAMETERS.ahk
#Include .\AALUSER_PARAMETERS.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class AAL_PARAMETERS_IE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _AALSpecificParameters_e__Union extends Win32Struct {
        static sizeof => 12
        static packingSize => 8

        /**
         * @type {AAL5_PARAMETERS}
         */
        AAL5Parameters{
            get {
                if(!this.HasProp("__AAL5Parameters"))
                    this.__AAL5Parameters := AAL5_PARAMETERS(0, this)
                return this.__AAL5Parameters
            }
        }
    
        /**
         * @type {AALUSER_PARAMETERS}
         */
        AALUserParameters{
            get {
                if(!this.HasProp("__AALUserParameters"))
                    this.__AALUserParameters := AALUSER_PARAMETERS(0, this)
                return this.__AALUserParameters
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    AALType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {_AALSpecificParameters_e__Union}
     */
    AALSpecificParameters{
        get {
            if(!this.HasProp("__AALSpecificParameters"))
                this.__AALSpecificParameters := %this.__Class%._AALSpecificParameters_e__Union(8, this)
            return this.__AALSpecificParameters
        }
    }
}
