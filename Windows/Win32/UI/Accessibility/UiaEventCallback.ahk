#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import ".\UiaEventArgs.ahk" { UiaEventArgs }

/**
 * A client-implemented function that is called by UI Automation when an event is raised that the client has subscribed to.
 * @remarks
 * This function is passed to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaaddevent">UiaAddEvent</a> and <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaremoveevent">UiaRemoveEvent</a>.
 * 
 * The tree structure is described by a string where every character is either "p" or ")". The first character in the string always represents the root node. The string is <b>NULL</b> if no elements are returned by the function. 
 * 
 * A "p" represents a node (UI Automation element). When one "p" directly follows another, the second node is a child of the first. A ")" represents a step back up the tree. For example, "pp)p" represents a node followed by two child nodes that are siblings of one another. In "pp))p", the last node is a sibling of the first one.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nc-uiautomationcoreapi-uiaeventcallback
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UiaEventCallback {
    value : IntPtr

    __value {
        set {
            if (value is UiaEventCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<UiaEventArgs>} pArgs Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiaeventargs">UiaEventArgs</a>*</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiaeventargs">UiaEventArgs</a> structure that contains the event arguments.
     * @param {Pointer<SAFEARRAY>} pRequestedData Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains data associated with the event.
     * @param {BSTR} pTreeStructure Type: <b>BSTR</b>
     * 
     * A string that contains the structure of the tree associated with the event, if the event is associated with a set of nodes. See Remarks.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pArgs, pRequestedData, pTreeStructure) {
        DllCall(this.value, UiaEventArgs.Ptr, pArgs, SAFEARRAY.Ptr, pRequestedData, BSTR, pTreeStructure)
    }

    /**
     * A UiaEventCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UiaEventCallback {
        /**
         * Creates a UiaEventCallback pointer that invokes the given AHK function when called.
         * @param {Func(UiaEventArgs, SAFEARRAY, BSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UiaEventArgs.Ptr, SAFEARRAY.Ptr, BSTR, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
