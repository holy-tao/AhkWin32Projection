#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPersist.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IPersistMemory extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistMemory
     * @type {Guid}
     */
    static IID => Guid("{bd1ae5e0-a6ae-11ce-bd37-504200c10000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDirty", "Load", "Save", "GetSizeMax", "InitNew"]

    /**
     * 
     * @returns {HRESULT} 
     */
    IsDirty() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * Reads texel data without any filtering or sampling.
     * @param {Pointer<Void>} pMem 
     * @param {Integer} cbSize 
     * @returns {HRESULT} <span id="Object"></span><span id="object"></span><span id="OBJECT"></span>*Object*
     * 
     * A [texture-object](dx-graphics-hlsl-to-type.md) type (except TextureCube or TextureCubeArray).
     * 
     * 
     * <span id="Location"></span><span id="location"></span><span id="LOCATION"></span>*Location*
     * 
     * \[in\] The texture coordinates; the last component specifies the mipmap level. This method uses a 0-based coordinate system and not a 0.0-1.0 UV system. The argument type is dependent on the texture-object type.
     * 
     * 
     * 
     * | Object Type                                  | Parameter Type |
     * |----------------------------------------------|----------------|
     * | Buffer                                       | int            |
     * | Texture1D, Texture2DMS                       | int2           |
     * | Texture1DArray, Texture2D, Texture2DMSArray  | int3           |
     * | Texture2DArray, Texture3D                    | int4           |
     * 
     * 
     * 
     *  
     * 
     * For example, to access a 2D texture, supply integer texel coordinates for the first two components and a mipmap level for the third component.
     * 
     * > [!Note]  
     * > When one or more of the coordinates in *Location* exceed the u, v, or w mipmap level dimensions of the texture, **Load** returns zero in all components. Direct3D guarantees to return zero for any resource that is accessed out of bounds.
     * 
     *  
     * 
     * 
     * <span id="SampleIndex"></span><span id="sampleindex"></span><span id="SAMPLEINDEX"></span>*SampleIndex*
     * 
     * \[in\] A sampling index. Required for multi-sample textures. Not supported for other textures.
     * 
     * 
     * 
     * | Texture Type                                                                                                   | Parameter Type |
     * |----------------------------------------------------------------------------------------------------------------|----------------|
     * | Texture1D, Texture1DArray, Texture2D, Texture2DArray, Texture3D, Texture2DArray, TextureCube, TextureCubeArray | not supported  |
     * | Texture2DMS, Texture2DMSArray¹                                                                                 | int            |
     * 
     * 
     * <span id="Offset"></span><span id="offset"></span><span id="OFFSET"></span>*Offset*
     * 
     * \[in\] An optional offset applied to the texture coordinates before sampling. The offset type is dependent on the texture-object type, and needs to be static.
     * 
     * 
     * 
     * | Texture Type                                             | Parameter Type |
     * |----------------------------------------------------------|----------------|
     * | Texture1D, Texture1DArray                                | int            |
     * | Texture2D, Texture2DArray, Texture2DMS, Texture2DMSArray | int2           |
     * | Texture3D                                                | int3           |
     * 
     * 
     * 
     *  
     * 
     * > [!Note]  
     * > *SampleIndex* must always be specified first with multi-sample textures.
     * 
     *  
     * 
     * 
     * 
     * The return type matches the type in the *Object* declaration. For example, a Texture2D object that was declared as "Texture2d&lt;uint4&gt; myTexture;" has a return value of type **uint4**.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dhlsl/dx-graphics-hlsl-to-load
     */
    Load(pMem, cbSize) {
        pMemMarshal := pMem is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pMemMarshal, pMem, "uint", cbSize, "int")
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
     * @param {BOOL} fClearDirty 
     * @param {Integer} cbSize 
     * @returns {Void} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/save-method
     */
    Save(fClearDirty, cbSize) {
        result := ComCall(6, this, "ptr", &pMem := 0, "int", fClearDirty, "uint", cbSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pMem
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSizeMax() {
        result := ComCall(7, this, "uint*", &pCbSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCbSize
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InitNew() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
