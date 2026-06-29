#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_VXD_HEADER {
    #StructPack 4

    e32_magic : UInt16

    e32_border : Int8

    e32_worder : Int8

    e32_level : UInt32

    e32_cpu : UInt16

    e32_os : UInt16

    e32_ver : UInt32

    e32_mflags : UInt32

    e32_mpages : UInt32

    e32_startobj : UInt32

    e32_eip : UInt32

    e32_stackobj : UInt32

    e32_esp : UInt32

    e32_pagesize : UInt32

    e32_lastpagesize : UInt32

    e32_fixupsize : UInt32

    e32_fixupsum : UInt32

    e32_ldrsize : UInt32

    e32_ldrsum : UInt32

    e32_objtab : UInt32

    e32_objcnt : UInt32

    e32_objmap : UInt32

    e32_itermap : UInt32

    e32_rsrctab : UInt32

    e32_rsrccnt : UInt32

    e32_restab : UInt32

    e32_enttab : UInt32

    e32_dirtab : UInt32

    e32_dircnt : UInt32

    e32_fpagetab : UInt32

    e32_frectab : UInt32

    e32_impmod : UInt32

    e32_impmodcnt : UInt32

    e32_impproc : UInt32

    e32_pagesum : UInt32

    e32_datapage : UInt32

    e32_preload : UInt32

    e32_nrestab : UInt32

    e32_cbnrestab : UInt32

    e32_nressum : UInt32

    e32_autodata : UInt32

    e32_debuginfo : UInt32

    e32_debuglen : UInt32

    e32_instpreload : UInt32

    e32_instdemand : UInt32

    e32_heapsize : UInt32

    e32_res3 : Int8[12]

    e32_winresoff : UInt32

    e32_winreslen : UInt32

    e32_devid : UInt16

    e32_ddkver : UInt16

}
