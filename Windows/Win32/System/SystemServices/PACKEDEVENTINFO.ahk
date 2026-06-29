#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 * @deprecated struct PACKEDEVENTINFO is deprecated and might not work on all platforms. For more info, see MSDN.
 */
export default struct PACKEDEVENTINFO {
    #StructPack 4

    ulSize : UInt32

    ulNumEventsForLogFile : UInt32

    ulOffsets : UInt32[1]

}
