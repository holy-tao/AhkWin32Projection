#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Extends the ShellLinkObject object and supports one additional property.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/ishelllinkdual2-object
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellLinkDual extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellLinkDual
     * @type {Guid}
     */
    static IID => Guid("{88a05c00-f000-11ce-8350-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Path", "put_Path", "get_Description", "put_Description", "get_WorkingDirectory", "put_WorkingDirectory", "get_Arguments", "put_Arguments", "get_Hotkey", "put_Hotkey", "get_ShowCommand", "put_ShowCommand", "Resolve", "GetIconLocation", "SetIconLocation", "Save"]

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BSTR} 
     */
    WorkingDirectory {
        get => this.get_WorkingDirectory()
        set => this.put_WorkingDirectory(value)
    }

    /**
     * @type {BSTR} 
     */
    Arguments {
        get => this.get_Arguments()
        set => this.put_Arguments(value)
    }

    /**
     * @type {Integer} 
     */
    Hotkey {
        get => this.get_Hotkey()
        set => this.put_Hotkey(value)
    }

    /**
     * @type {Integer} 
     */
    ShowCommand {
        get => this.get_ShowCommand()
        set => this.put_ShowCommand(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        pbs := BSTR()
        result := ComCall(7, this, "ptr", pbs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbs
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_Path(bs) {
        if(bs is String) {
            pin := BSTR.Alloc(bs)
            bs := pin.Value
        }

        result := ComCall(8, this, "ptr", bs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        pbs := BSTR()
        result := ComCall(9, this, "ptr", pbs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbs
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_Description(bs) {
        if(bs is String) {
            pin := BSTR.Alloc(bs)
            bs := pin.Value
        }

        result := ComCall(10, this, "ptr", bs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_WorkingDirectory() {
        pbs := BSTR()
        result := ComCall(11, this, "ptr", pbs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbs
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_WorkingDirectory(bs) {
        if(bs is String) {
            pin := BSTR.Alloc(bs)
            bs := pin.Value
        }

        result := ComCall(12, this, "ptr", bs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Arguments() {
        pbs := BSTR()
        result := ComCall(13, this, "ptr", pbs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbs
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_Arguments(bs) {
        if(bs is String) {
            pin := BSTR.Alloc(bs)
            bs := pin.Value
        }

        result := ComCall(14, this, "ptr", bs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Hotkey() {
        result := ComCall(15, this, "int*", &piHK := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return piHK
    }

    /**
     * 
     * @param {Integer} iHK 
     * @returns {HRESULT} 
     */
    put_Hotkey(iHK) {
        result := ComCall(16, this, "int", iHK, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ShowCommand() {
        result := ComCall(17, this, "int*", &piShowCommand := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return piShowCommand
    }

    /**
     * 
     * @param {Integer} iShowCommand 
     * @returns {HRESULT} 
     */
    put_ShowCommand(iShowCommand) {
        result := ComCall(18, this, "int", iShowCommand, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Locates the target function of the specified import and replaces the function pointer in the import thunk with the target of the function implementation.
     * @param {Integer} fFlags 
     * @returns {HRESULT} The address of the import, or the failure stub for it.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DevNotes/resolvedelayloadedapi
     */
    Resolve(fFlags) {
        result := ComCall(19, this, "int", fFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbs 
     * @returns {Integer} 
     */
    GetIconLocation(pbs) {
        result := ComCall(20, this, "ptr", pbs, "int*", &piIcon := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return piIcon
    }

    /**
     * 
     * @param {BSTR} bs 
     * @param {Integer} iIcon 
     * @returns {HRESULT} 
     */
    SetIconLocation(bs, iIcon) {
        if(bs is String) {
            pin := BSTR.Alloc(bs)
            bs := pin.Value
        }

        result := ComCall(21, this, "ptr", bs, "int", iIcon, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Save Method
     * @remarks
     * The **Save Method** method can only be invoked on an open **Recordset**. Use the [Open Method (ADO Recordset)](./open-method-ado-recordset.md) method to later restore the **Recordset** from *Destination*.  
     *   
     *  If the [Filter Property](./filter-property.md) property is in effect for the **Recordset**, then only the rows accessible under the filter are saved. If the **Recordset** is hierarchical, then the current child **Recordset** and its children are saved, including the parent **Recordset**. If the Save method of a child **Recordset** is called, the child and all its children are saved, but the parent is not.  
     *   
     *  The first time you save the **Recordset**, it is optional to specify *Destination*. If you omit *Destination*, a new file will be created with a name set to the value of the Source property of the **Recordset**.  
     *   
     *  Omit *Destination* when you subsequently call **Save** after the first save, or a run-time error will occur. If you subsequently call **Save** with a new *Destination*, the **Recordset** is saved to the new destination. However, the new destination and the original destination will both be open.  
     *   
     *  **Save** does not close the **Recordset** or *Destination*, so you can continue to work with the **Recordset** and save your most recent changes. *Destination* remains open until the **Recordset** is closed.  
     *   
     *  For reasons of security, the **Save** method permits only the use of low and custom security settings from a script executed by Microsoft Internet Explorer.  
     *   
     *  If the **Save** method is called while an asynchronous **Recordset** fetch, execute, or update operation is in progress, then **Save** waits until the asynchronous operation is complete.  
     *   
     *  Records are saved beginning with the first row of the **Recordset**. When the **Save** method is finished, the current row position is moved to the first row of the **Recordset**.  
     *   
     *  For best results, set the [CursorLocation Property (ADO)](./cursorlocation-property-ado.md) property to **adUseClient** with **Save**. If your provider does not support all of the functionality necessary to save **Recordset** objects, the Cursor Service will provide that functionality.  
     *   
     *  When a **Recordset** is persisted with the **CursorLocation** property set to **adUseServer**, the update capability for the **Recordset** is limited. Typically, only single-table updates, insertions, and deletions are allowed (dependant upon provider functionality). The [Resync Method](./resync-method.md) method is also unavailable in this configuration.  
     *   
     * > [!NOTE]
     * >  Saving a **Recordset** with **Fields** of type **adVariant**, **adIDispatch**, or **adIUnknown** is not supported by ADO and can cause unpredictable results.  
     *   
     *  Only Filters in the form of Criteria Strings (e.g. OrderDate > '12/31/1999') affect the contents of a persisted **Recordset**. Filters created with an Array of **Bookmarks** or using a value from the [FilterGroupEnum](./filtergroupenum.md) will not affect the contents of the persisted **Recordset**. These rules apply to **Recordset**s created with either client-side or server-side cursors.  
     *   
     *  Because the *Destination* parameter can accept any object that supports the OLE DB IStream interface, you can save a **Recordset** directly to the ASP Response object. For more details, please see the **XML Recordset Persistence Scenario**.  
     *   
     *  You can also save a **Recordset** in XML format to an instance of an MSXML DOM object, as is shown in the following Visual Basic code:  
     *   
     * ```  
     * Dim xDOM As New MSXML.DOMDocument  
     * Dim rsXML As New ADODB.Recordset  
     * Dim sSQL As String, sConn As String  
     *   
     * sSQL = "SELECT customerid, companyname, contactname FROM customers"  
     * sConn="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Northwind.mdb"  
     * rsXML.Open sSQL, sConn  
     * rsXML.Save xDOM, adPersistXML   'Save Recordset directly into a DOM tree.  
     * ...  
     * ```  
     *   
     * > [!NOTE]
     * >  Two limitations apply when saving hierarchical Recordsets (data shapes) in XML format. You cannot save into XML if the hierarchical **Recordset** contains pending updates, and you cannot save a parameterized hierarchical **Recordset**.  
     *   
     *  A **Recordset** saved in XML format is saved using UTF-8 format. When such a file is loaded into an ADO Stream, the Stream object will not attempt to open a **Recordset** from the stream unless the Charset property of the stream is set to the appropriate value for UTF-8 format.
     * @param {VARIANT} vWhere 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/save-method
     */
    Save(vWhere) {
        result := ComCall(22, this, "ptr", vWhere, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
