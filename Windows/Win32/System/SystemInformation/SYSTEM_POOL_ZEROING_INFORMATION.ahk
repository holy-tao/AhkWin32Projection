#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct SYSTEM_POOL_ZEROING_INFORMATION {
    #StructPack 1

    PoolZeroingSupportPresent : BOOLEAN

}
