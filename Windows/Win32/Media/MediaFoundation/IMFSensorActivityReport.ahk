#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFSensorProcessActivity.ahk" { IMFSensorProcessActivity }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents an activity report for a sensor.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsensoractivityreport
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSensorActivityReport extends IUnknown {
    /**
     * The interface identifier for IMFSensorActivityReport
     * @type {Guid}
     */
    static IID := Guid("{3e8c4be1-a8c2-4528-90de-2851bde5fead}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSensorActivityReport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFriendlyName    : IntPtr
        GetSymbolicLink    : IntPtr
        GetProcessCount    : IntPtr
        GetProcessActivity : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSensorActivityReport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the friendly name for the sensor associated with the report.
     * @param {PWSTR} FriendlyName The string into which the sensor friendly name is written.
     * @param {Integer} cchFriendlyName The character count of the <i>FriendlyName</i> string.
     * @returns {Integer} Receives the number of characters that were written into the <i>FriendlyName</i> string.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensoractivityreport-getfriendlyname
     */
    GetFriendlyName(FriendlyName, cchFriendlyName) {
        FriendlyName := FriendlyName is String ? StrPtr(FriendlyName) : FriendlyName

        result := ComCall(3, this, "ptr", FriendlyName, "uint", cchFriendlyName, "uint*", &pcchWritten := 0, "HRESULT")
        return pcchWritten
    }

    /**
     * Gets the symbolic link for the sensor associated with the report.
     * @param {PWSTR} SymbolicLink The string into which the sensor symbolic link is written.
     * @param {Integer} cchSymbolicLink The character count of the <i>SymbolicLink</i> string.
     * @returns {Integer} Receives the number of characters that were written into the <i>SymbolicLink</i> string.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensoractivityreport-getsymboliclink
     */
    GetSymbolicLink(SymbolicLink, cchSymbolicLink) {
        SymbolicLink := SymbolicLink is String ? StrPtr(SymbolicLink) : SymbolicLink

        result := ComCall(4, this, "ptr", SymbolicLink, "uint", cchSymbolicLink, "uint*", &pcchWritten := 0, "HRESULT")
        return pcchWritten
    }

    /**
     * Gets the count of IMFSensorProcessActivity objects, representing the current activity of a process associated with the sensor, that are available to be retrieved.
     * @returns {Integer} A pointer in which the process count is stored.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensoractivityreport-getprocesscount
     */
    GetProcessCount() {
        result := ComCall(5, this, "uint*", &pcCount := 0, "HRESULT")
        return pcCount
    }

    /**
     * Gets an IMFSensorProcessActivity object representing the current process activity of a sensor.
     * @param {Integer} Index The index of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorprocessactivity">IMFSensorProcessActivity</a> to retrieve. This value must be less than the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsensoractivityreport-getprocesscount">GetProcessCount</a>.
     * @returns {IMFSensorProcessActivity} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorprocessactivity">IMFSensorProcessActivity</a> associated with the specified index.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensoractivityreport-getprocessactivity
     */
    GetProcessActivity(Index) {
        result := ComCall(6, this, "uint", Index, "ptr*", &ppProcessActivity := 0, "HRESULT")
        return IMFSensorProcessActivity(ppProcessActivity)
    }

    Query(iid) {
        if (IMFSensorActivityReport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFriendlyName := CallbackCreate(GetMethod(implObj, "GetFriendlyName"), flags, 4)
        this.vtbl.GetSymbolicLink := CallbackCreate(GetMethod(implObj, "GetSymbolicLink"), flags, 4)
        this.vtbl.GetProcessCount := CallbackCreate(GetMethod(implObj, "GetProcessCount"), flags, 2)
        this.vtbl.GetProcessActivity := CallbackCreate(GetMethod(implObj, "GetProcessActivity"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFriendlyName)
        CallbackFree(this.vtbl.GetSymbolicLink)
        CallbackFree(this.vtbl.GetProcessCount)
        CallbackFree(this.vtbl.GetProcessActivity)
    }
}
