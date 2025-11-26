#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFSensorProcessActivity.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents an activity report for a sensor.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsensoractivityreport
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSensorActivityReport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSensorActivityReport
     * @type {Guid}
     */
    static IID => Guid("{3e8c4be1-a8c2-4528-90de-2851bde5fead}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFriendlyName", "GetSymbolicLink", "GetProcessCount", "GetProcessActivity"]

    /**
     * Gets the friendly name for the sensor associated with the report.
     * @param {PWSTR} FriendlyName The string into which the sensor friendly name is written.
     * @param {Integer} cchFriendlyName The character count of the <i>FriendlyName</i> string.
     * @returns {Integer} Receives the number of characters that were written into the <i>FriendlyName</i> string.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensoractivityreport-getfriendlyname
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensoractivityreport-getsymboliclink
     */
    GetSymbolicLink(SymbolicLink, cchSymbolicLink) {
        SymbolicLink := SymbolicLink is String ? StrPtr(SymbolicLink) : SymbolicLink

        result := ComCall(4, this, "ptr", SymbolicLink, "uint", cchSymbolicLink, "uint*", &pcchWritten := 0, "HRESULT")
        return pcchWritten
    }

    /**
     * Gets the count of IMFSensorProcessActivity objects, representing the current activity of a process associated with the sensor, that are available to be retrieved.
     * @returns {Integer} A pointer in which the process count is stored.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensoractivityreport-getprocesscount
     */
    GetProcessCount() {
        result := ComCall(5, this, "uint*", &pcCount := 0, "HRESULT")
        return pcCount
    }

    /**
     * Gets an IMFSensorProcessActivity object representing the current process activity of a sensor.
     * @param {Integer} Index The index of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorprocessactivity">IMFSensorProcessActivity</a> to retrieve. This value must be less than the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsensoractivityreport-getprocesscount">GetProcessCount</a>.
     * @returns {IMFSensorProcessActivity} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorprocessactivity">IMFSensorProcessActivity</a> associated with the specified index.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensoractivityreport-getprocessactivity
     */
    GetProcessActivity(Index) {
        result := ComCall(6, this, "uint", Index, "ptr*", &ppProcessActivity := 0, "HRESULT")
        return IMFSensorProcessActivity(ppProcessActivity)
    }
}
