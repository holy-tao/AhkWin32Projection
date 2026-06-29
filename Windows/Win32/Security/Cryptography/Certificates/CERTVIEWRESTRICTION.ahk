#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct CERTVIEWRESTRICTION {
    #StructPack 8

    ColumnIndex : UInt32

    SeekOperator : Int32

    SortOrder : Int32

    pbValue : IntPtr

    cbValue : UInt32

}
