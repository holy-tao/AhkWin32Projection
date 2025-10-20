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
     * 
     * @param {PWSTR} FriendlyName 
     * @param {Integer} cchFriendlyName 
     * @param {Pointer<UInt32>} pcchWritten 
     * @returns {HRESULT} 
     */
    GetFriendlyName(FriendlyName, cchFriendlyName, pcchWritten) {
        FriendlyName := FriendlyName is String ? StrPtr(FriendlyName) : FriendlyName

        result := ComCall(3, this, "ptr", FriendlyName, "uint", cchFriendlyName, "uint*", pcchWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} SymbolicLink 
     * @param {Integer} cchSymbolicLink 
     * @param {Pointer<UInt32>} pcchWritten 
     * @returns {HRESULT} 
     */
    GetSymbolicLink(SymbolicLink, cchSymbolicLink, pcchWritten) {
        SymbolicLink := SymbolicLink is String ? StrPtr(SymbolicLink) : SymbolicLink

        result := ComCall(4, this, "ptr", SymbolicLink, "uint", cchSymbolicLink, "uint*", pcchWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcCount 
     * @returns {HRESULT} 
     */
    GetProcessCount(pcCount) {
        result := ComCall(5, this, "uint*", pcCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<IMFSensorProcessActivity>} ppProcessActivity 
     * @returns {HRESULT} 
     */
    GetProcessActivity(Index, ppProcessActivity) {
        result := ComCall(6, this, "uint", Index, "ptr", ppProcessActivity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
