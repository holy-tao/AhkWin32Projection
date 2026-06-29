#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_LID_SUPPORTED_AND_EFFECTS.ahk" { NVME_LID_SUPPORTED_AND_EFFECTS }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_SUPPORTED_LOG_PAGES_LOG {
    #StructPack 4

    LogPageIdentifierSupported : NVME_LID_SUPPORTED_AND_EFFECTS[256]

}
