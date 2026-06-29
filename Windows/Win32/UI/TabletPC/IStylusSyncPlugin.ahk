#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IStylusPlugin.ahk" { IStylusPlugin }

/**
 * Represents a synchronous plug-in that can be added to the RealTimeStylus Class object's synchronous plug-in collection.
 * @remarks
 * This is the synchronous version of <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusplugin">IStylusPlugin Interface</a>. It provides for strong type checking in the synchronous plug-in collections.
 * 
 * This plug-in receives notifications of <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> events enabling you to do custom processing.
 * 
 * The dynamic renderer and gesture recognizer are examples of plug-ins which implement the <b>IStylusSyncPlugin</b> interface. The dynamic renderer implements the <b>IStylusSyncPlugin</b> interface in order to respond in a timely fashion to the stylus.
 * 
 * In some circumstances, such as when large numbers of gestures are subscribed to, the response time in the gesture recognizer becomes excessively slow. To avoid this problem, the gesture recognizer also implements the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusasyncplugin">IStylusAsyncPlugin</a> interface so it can be placed on the UI thread.
 * @see https://learn.microsoft.com/windows/win32/api/rtscom/nn-rtscom-istylussyncplugin
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IStylusSyncPlugin extends IStylusPlugin {
    /**
     * The interface identifier for IStylusSyncPlugin
     * @type {Guid}
     */
    static IID := Guid("{a157b174-482f-4d71-a3f6-3a41ddd11be9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStylusSyncPlugin interfaces
    */
    struct Vtbl extends IStylusPlugin.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStylusSyncPlugin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IStylusSyncPlugin.IID.Equals(iid)) {
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
