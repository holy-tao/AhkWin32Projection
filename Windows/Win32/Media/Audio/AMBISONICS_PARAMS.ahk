#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AMBISONICS_TYPE.ahk" { AMBISONICS_TYPE }
#Import ".\AMBISONICS_CHANNEL_ORDERING.ahk" { AMBISONICS_CHANNEL_ORDERING }
#Import ".\AMBISONICS_NORMALIZATION.ahk" { AMBISONICS_NORMALIZATION }

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct AMBISONICS_PARAMS {
    #StructPack 8

    u32Size : UInt32

    u32Version : UInt32

    u32Type : AMBISONICS_TYPE

    u32ChannelOrdering : AMBISONICS_CHANNEL_ORDERING

    u32Normalization : AMBISONICS_NORMALIZATION

    u32Order : UInt32

    u32NumChannels : UInt32

    pu32ChannelMap : IntPtr

}
