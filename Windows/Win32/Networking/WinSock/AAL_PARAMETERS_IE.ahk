#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AAL_TYPE.ahk" { AAL_TYPE }
#Import ".\AALUSER_PARAMETERS.ahk" { AALUSER_PARAMETERS }
#Import ".\AAL5_PARAMETERS.ahk" { AAL5_PARAMETERS }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct AAL_PARAMETERS_IE {
    #StructPack 4


    struct _AALSpecificParameters {
        AAL5Parameters : AAL5_PARAMETERS

        static __New() {
            DefineProp(this.Prototype, 'AALUserParameters', { type: AALUSER_PARAMETERS, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    AALType : AAL_TYPE

    AALSpecificParameters : AAL_PARAMETERS_IE._AALSpecificParameters

}
