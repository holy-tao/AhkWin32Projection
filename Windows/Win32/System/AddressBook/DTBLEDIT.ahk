#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct DTBLEDIT {
    #StructPack 4

    ulbLpszCharsAllowed : UInt32

    ulFlags : UInt32

    ulNumCharsAllowed : UInt32

    ulPropTag : UInt32

}
