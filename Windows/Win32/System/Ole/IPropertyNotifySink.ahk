#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Implemented by a sink object to receive notifications about property changes from an object that supports IPropertyNotifySink as an outgoing interface.
 * @remarks
 * The object is itself required to call the methods of <b>IPropertyNotifySink</b> only for those properties marked with the [<a href="https://docs.microsoft.com/windows/desktop/Midl/bindable">bindable</a>] and [<a href="https://docs.microsoft.com/windows/desktop/Midl/requestedit">requestedit</a>] attributes in the object's type information. When the object changes a [<b>bindable</b>] property, it is required to call <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertynotifysink-onchanged">IPropertyNotifySink::OnChanged</a>. When the object is about to change a [<b>requestedit</b>] property, it must call <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertynotifysink-onrequestedit">IPropertyNotifySink::OnRequestEdit</a> before changing the property and must also honor the action specified by the sink on return from this call.
 * 
 * The one exception to this rule is that no notifications are sent as a result of an object's initialization or loading procedures. At initialization time, it is assumed that all properties change and that all must be allowed to change. Notifications to this interface are therefore meaningful only in the context of a fully initialized/loaded object.
 * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nn-ocidl-ipropertynotifysink
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IPropertyNotifySink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyNotifySink
     * @type {Guid}
     */
    static IID => Guid("{9bfbbc02-eff1-101a-84ed-00aa00341d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnChanged", "OnRequestEdit"]

    /**
     * Notifies a sink that a bindable property has changed.
     * @remarks
     * S_OK is returned in all cases even when the sink does not need [<a href="https://docs.microsoft.com/windows/desktop/Midl/bindable">bindable</a>] properties or when some other failure has occurred. In short, the calling object simply sends the notification and cannot attempt to use an error code (such as E_NOTIMPL) to determine whether to not send the notification in the future. Such semantics are not part of this interface.
     * @param {Integer} dispID The dispatch identifier of the property that changed, or DISPID_UNKNOWN if multiple properties have changed. The client (owner of the sink) should retrieve the current value of each property of interest from the object that generated the notification.
     * @returns {HRESULT} This method returns S_OK in all cases.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipropertynotifysink-onchanged
     */
    OnChanged(dispID) {
        result := ComCall(3, this, "int", dispID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies a sink that a requestedit property is about to change.
     * @remarks
     * The sink may choose to allow or disallow the change to take place. For example, the sink may enforce a read-only state on the property. DISPID_UNKNOWN is a valid parameter to this method to indicate that multiple properties are about to change. In this case, the sink can enforce a global read-only state for all [<a href="https://docs.microsoft.com/windows/desktop/Midl/requestedit">requestedit</a>] properties in the object, including any specific ones that the sink otherwise recognizes.
     * 
     * If the sink allows changes, the object must also make <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertynotifysink-onchanged">IPropertyNotifySink::OnChanged</a> notifications for any properties that are marked [<a href="https://docs.microsoft.com/windows/desktop/Midl/bindable">bindable</a>] in addition to [<a href="https://docs.microsoft.com/windows/desktop/Midl/requestedit">requestedit</a>].
     * 
     * 
     * 
     * This method cannot be used to implement any sort of data validation. At the time of the call, the desired new value of the property is unavailable and thus cannot be validated. This method's only purpose is to allow the sink to enforce a read-only state on a property.
     * @param {Integer} dispID The dispatch identifier of the property that is about to change or DISPID_UNKNOWN if multiple properties are about to change.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified property or properties are allowed to change.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified property or properties are not allowed to change. The caller must obey this return value by discarding the new property value(s). This is part of the contract of the [<a href="https://docs.microsoft.com/windows/desktop/Midl/requestedit">requestedit</a>] attribute and this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipropertynotifysink-onrequestedit
     */
    OnRequestEdit(dispID) {
        result := ComCall(4, this, "int", dispID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
