#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUICollectionChangedEvent interface is implemented by the application and defines the method required to handle changes to a collection at run time.
 * @remarks
 * 
  * The Windows Ribbon framework incorporates the standard Component Object Model (COM)  client-server mechanism of <a href="https://docs.microsoft.com/windows/win32/com/events-in-com-and-connectable-objects">connectable objects</a> to listen for and handle collection changed events at run time.
  * 
  * The Ribbon acts as the COM server connectable object that defines both incoming and outgoing notification interfaces for the client, which is the Ribbon host application. The incoming interfaces are implemented by the Ribbon. The  outgoing interfaces are implemented by the application in a dedicated object that is created by the application and  referred to as the client connection sink. This sink is used to establish a connection to the connectable object.
  * 
  * In addition to defining the incoming and outgoing interfaces, the Ribbon must also implement the <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a> interface and  create at least one connection point object that implements the <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpoint">IConnectionPoint</a> interface and manages the connection with the client sink.
  * 
  * <div class="alert"><b>Note</b>  The client must query the connectable object for <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a> to determine whether the object is connectable before the client attempts to create a sink object.</div>
  * <div> </div>
  * In the case of the Ribbon,  <b>IUICollectionChangedEvent</b> is the outgoing interface defined by the framework and implemented by the application. The Ribbon triggers the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuicollectionchangedevent-onchanged">IUICollectionChangedEvent::OnChanged</a> event in the client by sending an outgoing notification when a collection changes, for example, adding a Command to the Quick Access Toolbar (QAT).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nn-uiribbon-iuicollectionchangedevent
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class IUICollectionChangedEvent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUICollectionChangedEvent
     * @type {Guid}
     */
    static IID => Guid("{6502ae91-a14d-44b5-bbd0-62aacc581d52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnChanged"]

    /**
     * 
     * @param {Integer} action 
     * @param {Integer} oldIndex 
     * @param {IUnknown} oldItem 
     * @param {Integer} newIndex 
     * @param {IUnknown} newItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicollectionchangedevent-onchanged
     */
    OnChanged(action, oldIndex, oldItem, newIndex, newItem) {
        result := ComCall(3, this, "int", action, "uint", oldIndex, "ptr", oldItem, "uint", newIndex, "ptr", newItem, "HRESULT")
        return result
    }
}
