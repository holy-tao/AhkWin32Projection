#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HSE_EXEC_URL_STATUS {
    #StructPack 4

    uHttpStatusCode : UInt16

    uHttpSubStatus : UInt16

    dwWin32Error : UInt32

}
