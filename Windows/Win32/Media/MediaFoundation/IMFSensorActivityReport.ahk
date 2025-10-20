#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pcchWritten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensoractivityreport-getfriendlyname
     */
    GetFriendlyName(FriendlyName, cchFriendlyName, pcchWritten) {
        FriendlyName := FriendlyName is String ? StrPtr(FriendlyName) : FriendlyName

        result := ComCall(3, this, "ptr", FriendlyName, "uint", cchFriendlyName, "uint*", pcchWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} SymbolicLink 
     * @param {Integer} cchSymbolicLink 
     * @param {Pointer<Integer>} pcchWritten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensoractivityreport-getsymboliclink
     */
    GetSymbolicLink(SymbolicLink, cchSymbolicLink, pcchWritten) {
        SymbolicLink := SymbolicLink is String ? StrPtr(SymbolicLink) : SymbolicLink

        result := ComCall(4, this, "ptr", SymbolicLink, "uint", cchSymbolicLink, "uint*", pcchWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensoractivityreport-getprocesscount
     */
    GetProcessCount(pcCount) {
        result := ComCall(5, this, "uint*", pcCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<IMFSensorProcessActivity>} ppProcessActivity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensoractivityreport-getprocessactivity
     */
    GetProcessActivity(Index, ppProcessActivity) {
        result := ComCall(6, this, "uint", Index, "ptr*", ppProcessActivity, "HRESULT")
        return result
    }
}
