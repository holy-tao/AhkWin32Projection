#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBCONSTRAINTDESC {
    #StructPack 8

    pConstraintID : DBID.Ptr

    ConstraintType : UInt32

    cColumns : IntPtr

    rgColumnList : DBID.Ptr

    pReferencedTableID : DBID.Ptr

    cForeignKeyColumns : IntPtr

    rgForeignKeyColumnList : DBID.Ptr

    pwszConstraintText : PWSTR

    UpdateRule : UInt32

    DeleteRule : UInt32

    MatchType : UInt32

    Deferrability : UInt32

    cReserved : IntPtr

    rgReserved : DBPROPSET.Ptr

}
