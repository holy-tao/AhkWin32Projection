#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IMMP_MPV_STORE_DRIVER_HANDLE {
    #StructPack 4

    guidSignature : Guid

}
