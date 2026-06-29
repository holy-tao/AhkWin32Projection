#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RealTimeStylusLockType.ahk" { RealTimeStylusLockType }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Synchronizes access to the RealTimeStylus Class object.
 * @remarks
 * Use locks when you must protect access to and modification of the plug-ins or properties of the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus</a> object through the <b>IRealTimeStylusSynchronization Interface</b> interface.
 * 
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ne-rtscom-realtimestyluslocktype">RealTimeStylusLockType Enumeration</a> enumeration to specify the lock.
 * @see https://learn.microsoft.com/windows/win32/api/rtscom/nn-rtscom-irealtimestylussynchronization
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IRealTimeStylusSynchronization extends IUnknown {
    /**
     * The interface identifier for IRealTimeStylusSynchronization
     * @type {Guid}
     */
    static IID := Guid("{aa87eab8-ab4a-4cea-b5cb-46d84c6a2509}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRealTimeStylusSynchronization interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AcquireLock : IntPtr
        ReleaseLock : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRealTimeStylusSynchronization.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the specified lock.
     * @remarks
     * Use the object locks to help protect the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object's members and properties from modification.
     * @param {RealTimeStylusLockType} lock The <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ne-rtscom-realtimestyluslocktype">RealTimeStylusLockType Enumeration</a> value that indicates which object lock to use.
     * @returns {HRESULT} For a description of the return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylussynchronization-acquirelock
     */
    AcquireLock(lock) {
        result := ComCall(3, this, RealTimeStylusLockType, lock, "HRESULT")
        return result
    }

    /**
     * Releases the specified lock.
     * @remarks
     * The object locks can be used to help protect the RealTimeStylus (RTS) object's members and properties from modification. The lock remains in effect until released.
     * @param {RealTimeStylusLockType} lock The <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ne-rtscom-realtimestyluslocktype">RealTimeStylusLockType Enumeration</a> value that indicates which object lock to release.
     * @returns {HRESULT} For a description of the return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylussynchronization-releaselock
     */
    ReleaseLock(lock) {
        result := ComCall(4, this, RealTimeStylusLockType, lock, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRealTimeStylusSynchronization.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AcquireLock := CallbackCreate(GetMethod(implObj, "AcquireLock"), flags, 2)
        this.vtbl.ReleaseLock := CallbackCreate(GetMethod(implObj, "ReleaseLock"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AcquireLock)
        CallbackFree(this.vtbl.ReleaseLock)
    }
}
