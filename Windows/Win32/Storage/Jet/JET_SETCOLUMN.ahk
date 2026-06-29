#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_SETCOLUMN constructor
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-setcolumn-constructor
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_SETCOLUMN {
    #StructPack 8

    columnid : UInt32

    pvData : IntPtr

    cbData : UInt32

    grbit : UInt32

    ibLongValue : UInt32

    itagSequence : UInt32

    err : Int32

}
