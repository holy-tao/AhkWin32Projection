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
     * 
     * @param {PWSTR} FriendlyName 
     * @param {Integer} cchFriendlyName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensoractivityreport-getfriendlyname
     */
    GetFriendlyName(FriendlyName, cchFriendlyName) {
        FriendlyName := FriendlyName is String ? StrPtr(FriendlyName) : FriendlyName

        result := ComCall(3, this, "ptr", FriendlyName, "uint", cchFriendlyName, "uint*", &pcchWritten := 0, "HRESULT")
        return pcchWritten
    }

    /**
     * 
     * @param {PWSTR} SymbolicLink 
     * @param {Integer} cchSymbolicLink 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensoractivityreport-getsymboliclink
     */
    GetSymbolicLink(SymbolicLink, cchSymbolicLink) {
        SymbolicLink := SymbolicLink is String ? StrPtr(SymbolicLink) : SymbolicLink

        result := ComCall(4, this, "ptr", SymbolicLink, "uint", cchSymbolicLink, "uint*", &pcchWritten := 0, "HRESULT")
        return pcchWritten
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensoractivityreport-getprocesscount
     */
    GetProcessCount() {
        result := ComCall(5, this, "uint*", &pcCount := 0, "HRESULT")
        return pcCount
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {IMFSensorProcessActivity} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensoractivityreport-getprocessactivity
     */
    GetProcessActivity(Index) {
        result := ComCall(6, this, "uint", Index, "ptr*", &ppProcessActivity := 0, "HRESULT")
        return IMFSensorProcessActivity(ppProcessActivity)
    }
}
