#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLDOMNode.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMSchemaCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMSchemaCollection
     * @type {Guid}
     */
    static IID => Guid("{373984c8-b845-449b-91e7-45ac83036ade}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add", "get", "remove", "get_length", "get_namespaceURI", "addCollection", "get__newEnum"]

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * @type {IUnknown} 
     */
    _newEnum {
        get => this.get__newEnum()
    }

    /**
     * Reserves the specified URL for non-administrator users and accounts.
     * @param {BSTR} namespaceURI 
     * @param {VARIANT} var 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Http/add-urlacl
     */
    add(namespaceURI, var) {
        if(namespaceURI is String) {
            pin := BSTR.Alloc(namespaceURI)
            namespaceURI := pin.Value
        }

        result := ComCall(7, this, "ptr", namespaceURI, "ptr", var, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a value that specifies whether ink is currently being drawn on an ink collector (InkCollector, InkOverlay, or InkPicture). (IInkCollector.get_CollectingInk)
     * @remarks
     * You can use the <b>CollectingInk</b> property to see if ink is being drawn on an ink collector rather than monitoring the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-stroke">Stroke</a> event.
     * 
     * <div class="alert"><b>Note</b>  Because ink collection is happening on a different thread than your application code, it is possible that the <b>CollectingInk</b> property can change soon after you have checked it. Thus, your code may be operating under the assumption that the ink collector is not collecting ink, when in fact it is. If this occurs, an error is thrown. To be safe, put such code in a try-catch block.</div>
     * <div> </div>
     * @param {BSTR} namespaceURI 
     * @returns {IXMLDOMNode} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkcollector-get_collectingink
     */
    get(namespaceURI) {
        if(namespaceURI is String) {
            pin := BSTR.Alloc(namespaceURI)
            namespaceURI := pin.Value
        }

        result := ComCall(8, this, "ptr", namespaceURI, "ptr*", &schemaNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMNode(schemaNode)
    }

    /**
     * removeConnectionEventListener Method (SQLServerPooledConnection)
     * @remarks
     * This removeConnectionEventListener method is specified by the removeConnectionEventListener method in the javax.sql.PooledConnection interface.
     * @param {BSTR} namespaceURI 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/removeconnectioneventlistener-method-sqlserverpooledconnection
     */
    remove(namespaceURI) {
        if(namespaceURI is String) {
            pin := BSTR.Alloc(namespaceURI)
            namespaceURI := pin.Value
        }

        result := ComCall(9, this, "ptr", namespaceURI, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(10, this, "int*", &length := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return length
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    get_namespaceURI(index) {
        length := BSTR()
        result := ComCall(11, this, "int", index, "ptr", length, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return length
    }

    /**
     * 
     * @param {IXMLDOMSchemaCollection} otherCollection 
     * @returns {HRESULT} 
     */
    addCollection(otherCollection) {
        result := ComCall(12, this, "ptr", otherCollection, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(13, this, "ptr*", &ppUnk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppUnk)
    }
}
