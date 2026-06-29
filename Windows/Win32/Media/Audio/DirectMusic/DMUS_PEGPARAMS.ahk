#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_PEGPARAMS {
    #StructPack 4

    tcAttack : Int32

    tcDecay : Int32

    ptSustain : Int32

    tcRelease : Int32

    tcVel2Attack : Int32

    tcKey2Decay : Int32

    pcRange : Int32

}
