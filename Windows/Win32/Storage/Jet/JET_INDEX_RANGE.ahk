#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_INDEX_COLUMN.ahk" { JET_INDEX_COLUMN }

/**
 * Learn more about: JET_INDEX_RANGE constructor
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-index-range-constructor
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_INDEX_RANGE {
    #StructPack 8

    rgStartColumns : JET_INDEX_COLUMN.Ptr

    cStartColumns : UInt32

    rgEndColumns : JET_INDEX_COLUMN.Ptr

    cEndColumns : UInt32

}
