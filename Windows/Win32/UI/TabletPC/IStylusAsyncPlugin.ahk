#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IStylusPlugin.ahk" { IStylusPlugin }

/**
 * Represents an asynchronous plug-in that can be added to the asynchronous plug-in collection of the RealTimeStylus Class object.
 * @remarks
 * This is the asynchronous version of <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusplugin">IStylusPlugin Interface</a>.
 * 
 * This plug-in receives notifications of <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> events enabling you to do custom processing.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/tablet/gesturerecognizer-class">GestureRecognizer Class</a> is an example of a plug-in that implements the <b>IStylusAsyncPlugin</b> interface in order to respond in a timely fashion to the stylus. In some circumstances, such as when large numbers of gestures are subscribed to, the response time in the gesture recognizer becomes excessively slow. To avoid this problem, the <b>GestureRecognizer Class</b> implements the <b>IStylusAsyncPlugin</b> interface so that it can be called asynchronously.
 * @see https://learn.microsoft.com/windows/win32/api/rtscom/nn-rtscom-istylusasyncplugin
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IStylusAsyncPlugin extends IStylusPlugin {
    /**
     * The interface identifier for IStylusAsyncPlugin
     * @type {Guid}
     */
    static IID := Guid("{a7cca85a-31bc-4cd2-aadc-3289a3af11c8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStylusAsyncPlugin interfaces
    */
    struct Vtbl extends IStylusPlugin.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStylusAsyncPlugin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IStylusAsyncPlugin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
