#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\READER_SEL_REQUEST_MATCH_TYPE.ahk" { READER_SEL_REQUEST_MATCH_TYPE }

/**
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct READER_SEL_REQUEST {
    #StructPack 4


    struct _ReaderAndContainerParameter {
        cbReaderNameOffset : UInt32

        cchReaderNameLength : UInt32

        cbContainerNameOffset : UInt32

        cchContainerNameLength : UInt32

        dwDesiredCardModuleVersion : UInt32

        dwCspFlags : UInt32

    }

    struct _SerialNumberParameter {
        cbSerialNumberOffset : UInt32

        cbSerialNumberLength : UInt32

        dwDesiredCardModuleVersion : UInt32

    }

    dwShareMode : UInt32

    dwPreferredProtocols : UInt32

    MatchType : READER_SEL_REQUEST_MATCH_TYPE

    ReaderAndContainerParameter : READER_SEL_REQUEST._ReaderAndContainerParameter

    static __New() {
        DefineProp(this.Prototype, 'SerialNumberParameter', { type: READER_SEL_REQUEST._SerialNumberParameter, offset: 12 })
        this.DeleteProp("__New")
    }
}
