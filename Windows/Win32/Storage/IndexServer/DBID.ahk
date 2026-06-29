#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DBID structure encapsulates various ways of identifying a database object.
 * @remarks
 * The <b>DBID</b> structure identifies the requested columns for a query. Each unique column is represented by a unique combination of GUID and number or GUID and name.
 * @see https://learn.microsoft.com/windows/win32/api/oledbguid/ns-oledbguid-dbid
 * @namespace Windows.Win32.Storage.IndexServer
 * @architecture X64, Arm64
 */
export default struct DBID {
    #StructPack 8


    struct _uGuid {
        guid : Guid

        static __New() {
            DefineProp(this.Prototype, 'pguid', { type: Guid.Ptr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _uName {
        pwszName : PWSTR

        static __New() {
            DefineProp(this.Prototype, 'ulPropid', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    uGuid : DBID._uGuid

    eKind : UInt32

    uName : DBID._uName

}
