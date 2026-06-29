#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct SECURE_BUFFER_INFO {
    #StructPack 8

    guidBufferIdentifier : Guid

    cbBufferSize : UInt32

    cbCaptured : UInt32

    ullReserved : Int64[16]

}
