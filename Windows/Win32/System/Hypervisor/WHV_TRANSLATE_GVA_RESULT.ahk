#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_TRANSLATE_GVA_RESULT_CODE.ahk" { WHV_TRANSLATE_GVA_RESULT_CODE }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_TRANSLATE_GVA_RESULT {
    #StructPack 4

    ResultCode : WHV_TRANSLATE_GVA_RESULT_CODE

    Reserved : UInt32

}
