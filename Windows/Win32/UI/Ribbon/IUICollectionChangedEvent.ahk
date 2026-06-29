#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\UI_COLLECTIONCHANGE.ahk" { UI_COLLECTIONCHANGE }

/**
 * The IUICollectionChangedEvent interface is implemented by the application and defines the method required to handle changes to a collection at run time.
 * @remarks
 * The Windows Ribbon framework incorporates the standard Component Object Model (COM)  client-server mechanism of <a href="https://docs.microsoft.com/windows/win32/com/events-in-com-and-connectable-objects">connectable objects</a> to listen for and handle collection changed events at run time.
 * 
 * The Ribbon acts as the COM server connectable object that defines both incoming and outgoing notification interfaces for the client, which is the Ribbon host application. The incoming interfaces are implemented by the Ribbon. The  outgoing interfaces are implemented by the application in a dedicated object that is created by the application and  referred to as the client connection sink. This sink is used to establish a connection to the connectable object.
 * 
 * In addition to defining the incoming and outgoing interfaces, the Ribbon must also implement the <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a> interface and  create at least one connection point object that implements the <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpoint">IConnectionPoint</a> interface and manages the connection with the client sink.
 * 
 * <div class="alert"><b>Note</b>  The client must query the connectable object for <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a> to determine whether the object is connectable before the client attempts to create a sink object.</div>
 * <div> </div>
 * In the case of the Ribbon,  <b>IUICollectionChangedEvent</b> is the outgoing interface defined by the framework and implemented by the application. The Ribbon triggers the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuicollectionchangedevent-onchanged">IUICollectionChangedEvent::OnChanged</a> event in the client by sending an outgoing notification when a collection changes, for example, adding a Command to the Quick Access Toolbar (QAT).
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nn-uiribbon-iuicollectionchangedevent
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct IUICollectionChangedEvent extends IUnknown {
    /**
     * The interface identifier for IUICollectionChangedEvent
     * @type {Guid}
     */
    static IID := Guid("{6502ae91-a14d-44b5-bbd0-62aacc581d52}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUICollectionChangedEvent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUICollectionChangedEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when an IUICollection changes.
     * @remarks
     * The <b>IUICollectionChangedEvent::OnChanged</b> interface is implemented by the Ribbon host application 
     * 				(the client connection sink) as a listener for collection changed 
     * 				events that are fired by the Ribbon (the connectable object).
     * @param {UI_COLLECTIONCHANGE} action Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_collectionchange">UI_COLLECTIONCHANGE</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_collectionchange">action</a> performed on the 
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicollection">IUICollection</a>.
     * @param {Integer} oldIndex Type: <b>UINT32</b>
     * 
     * Index of the old item on remove or replace; otherwise <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-ui-collection-invalidindex">UI_COLLECTION_INVALIDINDEX</a>.
     * @param {IUnknown} oldItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the old item on remove or replace; otherwise <b>NULL</b>.
     * @param {Integer} newIndex Type: <b>UINT32</b>
     * 
     * Index of the new item on insert, add, or replace; otherwise <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-ui-collection-invalidindex">UI_COLLECTION_INVALIDINDEX</a>.
     * @param {IUnknown} newItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the new item on insert, add, or replace; otherwise <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicollectionchangedevent-onchanged
     */
    OnChanged(action, oldIndex, oldItem, newIndex, newItem) {
        result := ComCall(3, this, UI_COLLECTIONCHANGE, action, "uint", oldIndex, "ptr", oldItem, "uint", newIndex, "ptr", newItem, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUICollectionChangedEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnChanged := CallbackCreate(GetMethod(implObj, "OnChanged"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnChanged)
    }
}
