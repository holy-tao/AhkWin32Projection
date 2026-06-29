#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AMVAInternalMemInfo structure specifies the amount of scratch memory the hardware abstraction layer (HAL) will allocate for its private use.
 * @see https://learn.microsoft.com/windows/win32/api/amva/ns-amva-amvainternalmeminfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AMVAInternalMemInfo {
    #StructPack 4

    /**
     * Amount of scratch memory the HAL will allocate for its private use.
     */
    dwScratchMemAlloc : UInt32

}
