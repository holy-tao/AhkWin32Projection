#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\AALUSER_PARAMETERS.ahk
#Include .\AAL5_PARAMETERS.ahk
#Include .\AAL_TYPE.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class AAL_PARAMETERS_IE extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    class _AALSpecificParameters extends Win32Struct {
        static sizeof => 12
        static packingSize => 4

        /**
         * @type {AAL5_PARAMETERS}
         */
        AAL5Parameters {
            get {
                if(!this.HasProp("__AAL5Parameters"))
                    this.__AAL5Parameters := AAL5_PARAMETERS(0, this)
                return this.__AAL5Parameters
            }
        }

        /**
         * @type {AALUSER_PARAMETERS}
         */
        AALUserParameters {
            get {
                if(!this.HasProp("__AALUserParameters"))
                    this.__AALUserParameters := AALUSER_PARAMETERS(0, this)
                return this.__AALUserParameters
            }
        }
    }

    /**
     * @type {AAL_TYPE}
     */
    AALType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {_AALSpecificParameters}
     */
    AALSpecificParameters {
        get {
            if(!this.HasProp("__AALSpecificParameters"))
                this.__AALSpecificParameters := AAL_PARAMETERS_IE._AALSpecificParameters(4, this)
            return this.__AALSpecificParameters
        }
    }
}
