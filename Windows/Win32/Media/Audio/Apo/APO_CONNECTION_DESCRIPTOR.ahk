#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\APO_CONNECTION_BUFFER_TYPE.ahk" { APO_CONNECTION_BUFFER_TYPE }
#Import ".\IAudioMediaType.ahk" { IAudioMediaType }

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct APO_CONNECTION_DESCRIPTOR {
    #StructPack 8

    Type : APO_CONNECTION_BUFFER_TYPE

    pBuffer : IntPtr

    u32MaxFrameCount : UInt32

    pFormat : IAudioMediaType

    u32Signature : UInt32

}
