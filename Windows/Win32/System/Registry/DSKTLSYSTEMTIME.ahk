#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Registry
 */
export default struct DSKTLSYSTEMTIME {
    #StructPack 2

    wYear : UInt16

    wMonth : UInt16

    wDayOfWeek : UInt16

    wDay : UInt16

    wHour : UInt16

    wMinute : UInt16

    wSecond : UInt16

    wMilliseconds : UInt16

    wResult : UInt16

}
