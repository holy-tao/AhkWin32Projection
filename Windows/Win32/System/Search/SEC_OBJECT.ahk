#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SEC_OBJECT_ELEMENT.ahk" { SEC_OBJECT_ELEMENT }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct SEC_OBJECT {
    #StructPack 8

    cObjects : UInt32

    prgObjects : SEC_OBJECT_ELEMENT.Ptr

}
