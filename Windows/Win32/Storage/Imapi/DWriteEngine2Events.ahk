#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Implement this interface to receive notifications of the current write operation. (DWriteEngine2Events)
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-dwriteengine2events
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct DWriteEngine2Events extends IDispatch {
    /**
     * The interface identifier for DWriteEngine2Events
     * @type {Guid}
     */
    static IID := Guid("{27354137-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The class identifier for DWriteEngine2Events
     * @type {Guid}
     */
    static CLSID := Guid("{27354137-7f64-5b0f-8f00-5d77afbe261e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for DWriteEngine2Events interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Update : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := DWriteEngine2Events.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Implement this method to receive progress notification of the current write operation. (DWriteEngine2Events.Update)
     * @remarks
     * Notifications are sent in response to calling the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-iwriteengine2-writesection">IWriteEngine2::WriteSection</a> method.
     * 
     * Notification is sent:
     * 
     * <ul>
     * <li>Once before the operation begins</li>
     * <li>Every 0.5 seconds during the write operation</li>
     * <li>Once after the operation completes</li>
     * </ul>
     * To stop the write process, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-iwriteengine2-cancelwrite">IWriteEngine2::CancelWrite</a> method.
     * @param {IDispatch} _object The <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-iwriteengine2">IWriteEngine2</a> interface that initiated the write operation. 
     * 
     * This parameter is a <b>MsftWriteEngine2</b> object in script.
     * @param {IDispatch} progress An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-iwriteengine2eventargs">IWriteEngine2EventArgs</a> interface that you use to determine the progress of the write operation. 
     * 
     * This parameter is a <b>MsftWriteEngine2</b> object in script.
     * @returns {HRESULT} Return values are ignored.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-dwriteengine2events-update
     */
    Update(_object, progress) {
        result := ComCall(7, this, "ptr", _object, "ptr", progress, "HRESULT")
        return result
    }

    Query(iid) {
        if (DWriteEngine2Events.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Update := CallbackCreate(GetMethod(implObj, "Update"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Update)
    }
}
