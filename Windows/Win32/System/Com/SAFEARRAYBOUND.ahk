#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the bounds of one dimension of the array.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearraybound
 * @namespace Windows.Win32.System.Com
 */
export default struct SAFEARRAYBOUND {
    #StructPack 4

    /**
     * The number of elements in the dimension.
     */
    cElements : UInt32

    /**
     * The lower bound of the dimension.
     */
    lLbound : Int32

}
