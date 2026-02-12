#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A client-implemented function that is called by UI Automation when an event is raised that the client has subscribed to.
 * @remarks
 * This function is passed to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaaddevent">UiaAddEvent</a> and <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaremoveevent">UiaRemoveEvent</a>.
 * 
 * The tree structure is described by a string where every character is either "p" or ")". The first character in the string always represents the root node. The string is <b>NULL</b> if no elements are returned by the function. 
 * 
 * A "p" represents a node (UI Automation element). When one "p" directly follows another, the second node is a child of the first. A ")" represents a step back up the tree. For example, "pp)p" represents a node followed by two child nodes that are siblings of one another. In "pp))p", the last node is a sibling of the first one.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcoreapi/nc-uiautomationcoreapi-uiaeventcallback
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class UiaEventCallback extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<UiaEventArgs>} pArgs 
     * @param {Pointer<SAFEARRAY>} pRequestedData 
     * @param {BSTR} pTreeStructure 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pArgs, pRequestedData, pTreeStructure) {
        if(pTreeStructure is String) {
            pin := BSTR.Alloc(pTreeStructure)
            pTreeStructure := pin.Value
        }

        ComCall(3, this, "ptr", pArgs, "ptr", pRequestedData, "ptr", pTreeStructure)
    }
}
