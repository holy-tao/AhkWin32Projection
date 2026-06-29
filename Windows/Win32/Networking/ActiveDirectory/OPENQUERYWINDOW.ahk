#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPersistQuery.ahk" { IPersistQuery }
#Import "..\..\System\Com\StructuredStorage\IPropertyBag.ahk" { IPropertyBag }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Used with the ICommonQuery::OpenQueryWindow method to initialize the directory service query dialog box.
 * @see https://learn.microsoft.com/windows/win32/api/cmnquery/ns-cmnquery-openquerywindow
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct OPENQUERYWINDOW {
    #StructPack 8

    /**
     * Contains the size, in bytes, of the structure. This member is used for versioning and parameter validation 
     *       and must be filled in before calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/nf-cmnquery-icommonquery-openquerywindow">ICommonQuery::OpenQueryWindow</a>.
     */
    cbStruct : UInt32

    /**
     * Contains a set of flags that define the behavior of the directory service query dialog box. This can be 
     *       zero or a combination of one or more of the values listed in the following list.
     */
    dwFlags : UInt32

    /**
     * Contains a <b>CLSID</b> value that specifies the query handler to be used by the 
     *       query dialog box. The value of this member also determines the type of structure pointed to by the 
     *       <b>pHandlerParameters</b> member.
     */
    clsidHandler : Guid

    /**
     * Pointer to a structure that contains data for the query handler. The type of structure pointed to by this 
     *       member is defined by the <b>clsidHandler</b> member. The following list lists the possible 
     *       types of structures based on the value of the <b>clsidHandler</b> member.
     */
    pHandlerParameters : IntPtr

    /**
     * Specifies the default form to be displayed in the query dialog box. This member is ignored if 
     *       <b>dwFlags</b> does not contain <b>OQWF_DEFAULTFORM</b>. This member can 
     *       contain the <b>CLSID</b> of a custom query form or one of the system-supplied forms.
     */
    clsidDefaultForm : Guid

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/nn-cmnquery-ipersistquery">IPersistQuery</a> interface used 
     *       to store and retrieve query data. This data pertains to the query itself, not the results of the query. If 
     *       <b>dwFlags</b> contains <b>OQWF_LOADQUERY</b>, the query data is obtained 
     *       from this interface. If <b>dwFlags</b> contains <b>OQWF_SAVEQUERY</b>, 
     *       the query data is saved to this interface.
     */
    pPersistQuery : IPersistQuery

    pFormParameters : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'ppbFormParameters', { type: IPropertyBag, offset: 56 })
        this.DeleteProp("__New")
    }
}
