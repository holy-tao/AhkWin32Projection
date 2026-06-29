#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_OS2_HEADER {
    #StructPack 4

    ne_magic : UInt16

    ne_ver : CHAR

    ne_rev : CHAR

    ne_enttab : UInt16

    ne_cbenttab : UInt16

    ne_crc : Int32

    ne_flags : UInt16

    ne_autodata : UInt16

    ne_heap : UInt16

    ne_stack : UInt16

    ne_csip : Int32

    ne_sssp : Int32

    ne_cseg : UInt16

    ne_cmod : UInt16

    ne_cbnrestab : UInt16

    ne_segtab : UInt16

    ne_rsrctab : UInt16

    ne_restab : UInt16

    ne_modtab : UInt16

    ne_imptab : UInt16

    ne_nrestab : Int32

    ne_cmovent : UInt16

    ne_align : UInt16

    ne_cres : UInt16

    ne_exetyp : Int8

    ne_flagsothers : Int8

    ne_pretthunks : UInt16

    ne_psegrefbytes : UInt16

    ne_swaparea : UInt16

    ne_expver : UInt16

}
