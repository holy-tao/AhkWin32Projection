#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\StructuredStorage\IStorage.ahk
#Include ..\..\..\System\Com\IDataObject.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IRichEditOleCallback interface is used by a rich text edit control to retrieve OLE-related information from its client.
 * @see https://docs.microsoft.com/windows/win32/api//richole/nn-richole-iricheditolecallback
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class IRichEditOleCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichEditOleCallback
     * @type {Guid}
     */
    static IID => Guid("{00020d03-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNewStorage", "GetInPlaceContext", "ShowContainerUI", "QueryInsertObject", "DeleteObject", "QueryAcceptData", "ContextSensitiveHelp", "GetClipboardData", "GetDragDropEffect", "GetContextMenu"]

    /**
     * Provides storage for a new object pasted from the clipboard or read in from an Rich Text Format (RTF) stream.
     * @returns {IStorage} Type: <b>LPSTORAGE*</b>
     * 
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface created for the new object.
     * @see https://docs.microsoft.com/windows/win32/api//richole/nf-richole-iricheditolecallback-getnewstorage
     */
    GetNewStorage() {
        result := ComCall(3, this, "ptr*", &lplpstg := 0, "HRESULT")
        return IStorage(lplpstg)
    }

    /**
     * Provides the application and document-level interfaces and information required to support in-place activation.
     * @param {Pointer<IOleInPlaceFrame>} lplpFrame Type: <b>LPOLEINPLACEFRAME*</b>
     * 
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplaceframe">IOleInPlaceFrame</a> interface that represents the frame window of a rich edit control client. Use the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method to increment the reference count. The rich edit control releases the interface when it is no longer needed.
     * @param {Pointer<IOleInPlaceUIWindow>} lplpDoc Type: <b>LPOLEINPLACEUIWINDOW*</b>
     * 
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplaceuiwindow">IOleInPlaceUIWindow</a> interface that represents the document window of the rich edit control client. An interface need not be returned if the frame and document windows are the same. Use the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a>method to increment the reference count. The rich edit control releases the interface when it is no longer needed.
     * @param {Pointer<OLEINPLACEFRAMEINFO>} lpFrameInfo Type: <b>LPOLEINPLACEFRAMEINFO</b>
     * 
     * The accelerator information.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> on success. If the method fails, it can return the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an invalid argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//richole/nf-richole-iricheditolecallback-getinplacecontext
     */
    GetInPlaceContext(lplpFrame, lplpDoc, lpFrameInfo) {
        result := ComCall(4, this, "ptr*", lplpFrame, "ptr*", lplpDoc, "ptr", lpFrameInfo, "HRESULT")
        return result
    }

    /**
     * Indicates whether or not the application is to display its container UI.
     * @param {BOOL} fShow Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Show container UI flag. The value is <b>TRUE</b> if the container UI is displayed, and <b>FALSE</b> if it is not.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> on success. If the method fails, it can return the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an invalid argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//richole/nf-richole-iricheditolecallback-showcontainerui
     */
    ShowContainerUI(fShow) {
        result := ComCall(5, this, "int", fShow, "HRESULT")
        return result
    }

    /**
     * Queries the application as to whether an object should be inserted. The member is called when pasting and when reading Rich Text Format (RTF).
     * @param {Pointer<Guid>} lpclsid Type: <b>LPCLSID</b>
     * 
     * Class identifier of the object to be inserted.
     * @param {IStorage} lpstg Type: <b>LPSTORAGE</b>
     * 
     * Storage containing the object.
     * @param {Integer} cp Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Character position, at which the object will be inserted.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK on success. If the return value is not S_OK, the object was not inserted. If the method fails, it can return the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an invalid argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//richole/nf-richole-iricheditolecallback-queryinsertobject
     */
    QueryInsertObject(lpclsid, lpstg, cp) {
        result := ComCall(6, this, "ptr", lpclsid, "ptr", lpstg, "int", cp, "HRESULT")
        return result
    }

    /**
     * Sends notification that an object is about to be deleted from a rich edit control. The object is not necessarily being released when this member is called.
     * @param {IOleObject} lpoleobj Type: <b>LPOLEOBJECT</b>
     * 
     * The object that is being deleted.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//richole/nf-richole-iricheditolecallback-deleteobject
     */
    DeleteObject(lpoleobj) {
        result := ComCall(7, this, "ptr", lpoleobj, "HRESULT")
        return result
    }

    /**
     * During a paste operation or a drag event, determines if the data that is pasted or dragged should be accepted.
     * @param {IDataObject} lpdataobj Type: <b>LPDATAOBJECT</b>
     * 
     * The data object being pasted or dragged.
     * @param {Pointer<Integer>} lpcfFormat Type: <b>CLIPFORMAT*</b>
     * 
     * The clipboard format that will be used for the paste or drop operation. If the value pointed to by 
     * 					<i>lpcfFormat</i> is zero, the best available format will be used. If the callback changes the value pointed to by 
     * 					<i>lpcfFormat</i>, the rich edit control only uses that format and the operation will fail if the format is not available.
     * @param {Integer} reco Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A clipboard operation flag, which can be one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECO_DROP"></a><a id="reco_drop"></a><dl>
     * <dt><b>RECO_DROP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Drop operation (drag-and-drop).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECO_PASTE"></a><a id="reco_paste"></a><dl>
     * <dt><b>RECO_PASTE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Paste from the clipboard.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {BOOL} fReally Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Indicates whether the drag-drop is actually happening or if it is just a query. A nonzero value indicates the paste or drop is actually happening. A zero value indicates the operation is just a query, such as for 
     * 					<a href="https://docs.microsoft.com/windows/desktop/Controls/em-canpaste">EM_CANPASTE</a>.
     * @param {HGLOBAL} hMetaPict Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HGLOBAL</a></b>
     * 
     * Handle to a metafile containing the icon view of an object if <b>DVASPECT_ICON</b> is being imposed on an object by a paste special operation.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> on success. See Remarks.
     * @see https://docs.microsoft.com/windows/win32/api//richole/nf-richole-iricheditolecallback-queryacceptdata
     */
    QueryAcceptData(lpdataobj, lpcfFormat, reco, fReally, hMetaPict) {
        hMetaPict := hMetaPict is Win32Handle ? NumGet(hMetaPict, "ptr") : hMetaPict

        lpcfFormatMarshal := lpcfFormat is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, "ptr", lpdataobj, lpcfFormatMarshal, lpcfFormat, "uint", reco, "int", fReally, "ptr", hMetaPict, "HRESULT")
        return result
    }

    /**
     * Indicates if the application should transition into or out of context-sensitive help mode. This method should implement the functionality described for IOleWindow::ContextSensitiveHelp.
     * @param {BOOL} fEnterMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * If <b>TRUE</b>, the application should enter context-sensitive help mode. If <b>FALSE</b>, the application should leave context-sensitive help mode.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> on success. If the method fails, it can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an invalid argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//richole/nf-richole-iricheditolecallback-contextsensitivehelp
     */
    ContextSensitiveHelp(fEnterMode) {
        result := ComCall(9, this, "int", fEnterMode, "HRESULT")
        return result
    }

    /**
     * Allows the client to supply its own clipboard object.
     * @param {Pointer<CHARRANGE>} lpchrg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-charrange">CHARRANGE</a>*</b>
     * 
     * The clipboard object range.
     * @param {Integer} reco Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The clipboard operation flag can be one of these values.
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECO_COPY"></a><a id="reco_copy"></a><dl>
     * <dt><b>RECO_COPY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Copy to the clipboard.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECO_CUT"></a><a id="reco_cut"></a><dl>
     * <dt><b>RECO_CUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cut to the clipboard.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IDataObject} Type: <b>LPDATAOBJECT*</b>
     * 
     * Pointer to the pointer variable that receives the address of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> implementation representing the range specified in the 
     * 					<i>lpchrg</i> parameter. The value of 
     * 					<i>lplpdataobj</i> is ignored if an error is returned.
     * @see https://docs.microsoft.com/windows/win32/api//richole/nf-richole-iricheditolecallback-getclipboarddata
     */
    GetClipboardData(lpchrg, reco) {
        result := ComCall(10, this, "ptr", lpchrg, "uint", reco, "ptr*", &lplpdataobj := 0, "HRESULT")
        return IDataObject(lplpdataobj)
    }

    /**
     * Allows the client to specify the effects of a drop operation.
     * @param {BOOL} fDrag Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the query is for a <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragenter">IDropTarget::DragEnter</a> or <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragover">IDropTarget::DragOver</a>. <b>FALSE</b> if the query is for <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-drop">IDropTarget::Drop</a>.
     * @param {Integer} grfKeyState Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Key state as defined by OLE.
     * @param {Pointer<Integer>} pdwEffect Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPDWORD</a></b>
     * 
     * The effect used by a rich edit control. When 
     * 					<i>fDrag</i> is <b>TRUE</b>, on return, its content is set to the effect allowable by the rich edit control. When 
     * 					<i>fDrag</i> is <b>FALSE</b>, on return, the variable is set to the effect to use.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * This method returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//richole/nf-richole-iricheditolecallback-getdragdropeffect
     */
    GetDragDropEffect(fDrag, grfKeyState, pdwEffect) {
        pdwEffectMarshal := pdwEffect is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "int", fDrag, "uint", grfKeyState, pdwEffectMarshal, pdwEffect, "HRESULT")
        return result
    }

    /**
     * Queries the application for a context menu to use on a right-click event.
     * @param {Integer} seltype Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * @param {IOleObject} lpoleobj Type: <b>LPOLEOBJECT</b>
     * 
     * Pointer to an interface. If the 
     * 					<i>seltype</i> parameter includes the <b>SEL_OBJECT</b> flag, 
     * 					<i>lpoleobj</i> is a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a> interface for the first selected COM object. If 
     * 					<i>seltype</i> includes the <b>GCM_RIGHTMOUSEDROP</b> flag, 
     * 					<i>lpoleobj</i> is a pointer to an 
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface. Otherwise, 
     * 					<i>lpoleobj</i> is <b>NULL</b>. If you hold on to the interface pointer, you must call 
     * 					the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method to increment the object's reference count.
     * @param {Pointer<CHARRANGE>} lpchrg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-charrange">CHARRANGE</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-charrange">CHARRANGE</a> structure containing the current selection.
     * @param {Pointer<HMENU>} lphmenu Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMENU</a>*</b>
     * 
     * The handle of a context menu to use. This parameter is ignored if an error is returned. A rich edit control destroys the menu when it is finished with it so the client should not.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> on success. If the method fails, it can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an invalid argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//richole/nf-richole-iricheditolecallback-getcontextmenu
     */
    GetContextMenu(seltype, lpoleobj, lpchrg, lphmenu) {
        result := ComCall(12, this, "ushort", seltype, "ptr", lpoleobj, "ptr", lpchrg, "ptr", lphmenu, "HRESULT")
        return result
    }
}
