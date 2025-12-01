#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the ICommonQuery::OpenQueryWindow method to initialize the directory service query dialog box.
 * @see https://learn.microsoft.com/windows/win32/api/cmnquery/ns-cmnquery-openquerywindow
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class OPENQUERYWINDOW extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Contains the size, in bytes, of the structure. This member is used for versioning and parameter validation 
     *       and must be filled in before calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/nf-cmnquery-icommonquery-openquerywindow">ICommonQuery::OpenQueryWindow</a>.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains a set of flags that define the behavior of the directory service query dialog box. This can be 
     *       zero or a combination of one or more of the values listed in the following list.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains a <b>CLSID</b> value that specifies the query handler to be used by the 
     *       query dialog box. The value of this member also determines the type of structure pointed to by the 
     *       <b>pHandlerParameters</b> member.
     * @type {Pointer<Guid>}
     */
    clsidHandler {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a structure that contains data for the query handler. The type of structure pointed to by this 
     *       member is defined by the <b>clsidHandler</b> member. The following list lists the possible 
     *       types of structures based on the value of the <b>clsidHandler</b> member.
     * @type {Pointer<Void>}
     */
    pHandlerParameters {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the default form to be displayed in the query dialog box. This member is ignored if 
     *       <b>dwFlags</b> does not contain <b>OQWF_DEFAULTFORM</b>. This member can 
     *       contain the <b>CLSID</b> of a custom query form or one of the system-supplied forms.
     * @type {Pointer<Guid>}
     */
    clsidDefaultForm {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/nn-cmnquery-ipersistquery">IPersistQuery</a> interface used 
     *       to store and retrieve query data. This data pertains to the query itself, not the results of the query. If 
     *       <b>dwFlags</b> contains <b>OQWF_LOADQUERY</b>, the query data is obtained 
     *       from this interface. If <b>dwFlags</b> contains <b>OQWF_SAVEQUERY</b>, 
     *       the query data is saved to this interface.
     * @type {IPersistQuery}
     */
    pPersistQuery {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Void>}
     */
    pFormParameters {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {IPropertyBag}
     */
    ppbFormParameters {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
