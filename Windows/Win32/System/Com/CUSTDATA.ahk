#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CUSTDATAITEM.ahk" { CUSTDATAITEM }

/**
 * Represents custom data.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-custdata
 * @namespace Windows.Win32.System.Com
 */
export default struct CUSTDATA {
    #StructPack 8

    /**
     * The number of custom data items in the <b>prgCustData</b> array.
     */
    cCustData : UInt32

    /**
     * The array of custom data items.
     */
    prgCustData : CUSTDATAITEM.Ptr

}
