#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDsAdminNotifyHandler interface is implemented by an Active Directory administrative notification handler.
 * @see https://learn.microsoft.com/windows/win32/api//content/dsadmin/nn-dsadmin-idsadminnotifyhandler
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IDsAdminNotifyHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDsAdminNotifyHandler
     * @type {Guid}
     */
    static IID => Guid("{e4a2b8b3-5a18-11d2-97c1-00a0c9a06d2d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Begin", "Notify", "End"]

    /**
     * Called to initialize the notification handler.
     * @param {IDataObject} pExtraInfo Reserved. This parameter will be <b>NULL</b>.
     * @param {Pointer<Integer>} puEventFlags 
     * @returns {HRESULT} If the method succeeds, <b>S_OK</b> is returned. If the method fails,  a standard <b>HRESULT</b> value is returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/dsadmin/nf-dsadmin-idsadminnotifyhandler-initialize
     */
    Initialize(pExtraInfo, puEventFlags) {
        puEventFlagsMarshal := puEventFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pExtraInfo, puEventFlagsMarshal, puEventFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IDsAdminNotifyHandler::Begin method is called when an event that the notification handler has requested is occurring. The notification handler specifies the events to receive notifications for when IDsAdminNotifyHandler::Initialize is called.
     * @remarks
     * The value and contents of <i>pArg1</i> and <i>pArg2</i> vary depending upon the event processed as indicated by <i>uEvent</i>. The following list explains what <i>pArg1</i> and <i>pArg2</i> will contain for each different event type.
     * 
     * <table>
     * <tr>
     * <th><i>uEvent</i></th>
     * <th><i>pArg1</i></th>
     * <th><i>pArg2</i></th>
     * </tr>
     * <tr>
     * <td><b>DSA_NOTIFY_DEL</b></td>
     * <td>Contains the object deleted.</td>
     * <td>Not used. This will be <b>NULL</b>.</td>
     * </tr>
     * <tr>
     * <td><b>DSA_NOTIFY_REN</b></td>
     * <td>Contains the previous name of the object.</td>
     * <td>Contains the new name of the object.</td>
     * </tr>
     * <tr>
     * <td><b>DSA_NOTIFY_MOV</b></td>
     * <td>Contains the container that the object is moved from.</td>
     * <td>Contains the container that the object is moved to.</td>
     * </tr>
     * <tr>
     * <td><b>DSA_NOTIFY_PROP</b></td>
     * <td>Contains the object for which the properties have changed.</td>
     * <td>Not used. This will be <b>NULL</b>.</td>
     * </tr>
     * </table>
     * @param {Integer} uEvent 
     * @param {IDataObject} pArg1 Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface that supports the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/cfstr-dsobjectnames-clipboard-format">CFSTR_DSOBJECTNAMES</a> clipboard format. The contents of the data object will vary depending on  the value of <i>uEvent</i>. For more information, see the Remarks section.
     * @param {IDataObject} pArg2 Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface that supports the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/cfstr-dsobjectnames-clipboard-format">CFSTR_DSOBJECTNAMES</a> clipboard format. The value of this parameter and the contents of the data object will vary depending on the value of <i>uEvent</i>. For more information, see the Remarks section.
     * @param {Pointer<Integer>} puFlags 
     * @param {Pointer<BSTR>} pBstr Pointer to a <b>BSTR</b> that receives a string that contains  the name and/or description of the notification handler. This string  is displayed in the confirmation dialog box. This string must be allocated by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> function. The caller must free this string when it is no longer required. If this parameter receives <b>NULL</b> or an empty string, the notification handler is not added to the confirmation dialog box and <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/nf-dsadmin-idsadminnotifyhandler-notify">IDsAdminNotifyHandler::Notify</a> is not called.
     * @returns {HRESULT} If the method succeeds, 
     *       <b>S_OK</b> is returned. If the method fails, a standard <b>HRESULT</b> value is returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/dsadmin/nf-dsadmin-idsadminnotifyhandler-begin
     */
    Begin(uEvent, pArg1, pArg2, puFlags, pBstr) {
        puFlagsMarshal := puFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", uEvent, "ptr", pArg1, "ptr", pArg2, puFlagsMarshal, puFlags, "ptr", pBstr, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called for each object after the confirmation dialog box has been displayed and the notification handler is selected in the confirmation dialog box.
     * @param {Integer} nItem Contains the index of the item in the <b>aObjects</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-dsobjectnames">DSOBJECTNAMES</a> structure supplied in the <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/nf-dsadmin-idsadminnotifyhandler-begin">IDsAdminNotifyHandler::Begin</a> method.
     * @param {Integer} uFlags Contains the flags supplied by the notification handler in the <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/nf-dsadmin-idsadminnotifyhandler-begin">IDsAdminNotifyHandler::Begin</a> method.
     * @returns {HRESULT} The return value from this method is ignored.
     * @see https://learn.microsoft.com/windows/win32/api//content/dsadmin/nf-dsadmin-idsadminnotifyhandler-notify
     */
    Notify(nItem, uFlags) {
        result := ComCall(5, this, "uint", nItem, "uint", uFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IDsAdminNotifyHandler::End method is called after the notification event has occurred. This method is called even if the notification process is canceled.
     * @remarks
     * This method provides the opportunity for the notification handler to free any memory allocated during the <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/nf-dsadmin-idsadminnotifyhandler-begin">IDsAdminNotifyHandler::Begin</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/nf-dsadmin-idsadminnotifyhandler-notify">IDsAdminNotifyHandler::Notify</a> methods.
     * @returns {HRESULT} The return value from this method is ignored.
     * @see https://learn.microsoft.com/windows/win32/api//content/dsadmin/nf-dsadmin-idsadminnotifyhandler-end
     */
    End() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
