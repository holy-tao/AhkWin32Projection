#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.System.Performance
 * @charset Unicode
 */
export default struct PDH_LOG_SERVICE_QUERY_INFO_W {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    dwLogQuota : UInt32

    szLogFileCaption : PWSTR

    szDefaultDir : PWSTR

    szBaseFileName : PWSTR

    dwFileType : UInt32

    dwReserved : UInt32

    PdlAutoNameInterval : UInt32

    PdlAutoNameUnits : UInt32

    PdlCommandFilename : PWSTR

    PdlCounterList : PWSTR

    PdlAutoNameFormat : UInt32

    PdlSampleInterval : UInt32

    PdlLogStartTime : FILETIME

    PdlLogEndTime : FILETIME

    static __New() {
        DefineProp(this.Prototype, 'TlNumberOfBuffers', { type: UInt32, offset: 48 })
        DefineProp(this.Prototype, 'TlMinimumBuffers', { type: UInt32, offset: 52 })
        DefineProp(this.Prototype, 'TlMaximumBuffers', { type: UInt32, offset: 56 })
        DefineProp(this.Prototype, 'TlFreeBuffers', { type: UInt32, offset: 60 })
        DefineProp(this.Prototype, 'TlBufferSize', { type: UInt32, offset: 64 })
        DefineProp(this.Prototype, 'TlEventsLost', { type: UInt32, offset: 68 })
        DefineProp(this.Prototype, 'TlLoggerThreadId', { type: UInt32, offset: 72 })
        DefineProp(this.Prototype, 'TlBuffersWritten', { type: UInt32, offset: 76 })
        DefineProp(this.Prototype, 'TlLogHandle', { type: UInt32, offset: 80 })
        DefineProp(this.Prototype, 'TlLogFileName', { type: PWSTR, offset: 88 })
        this.DeleteProp("__New")
    }
}
