#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class ITrackerOwner extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITrackerOwner
     * @type {Guid}
     */
    static IID => Guid("{eb24c20b-9816-4ac7-8cff-36f67a118f4e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTrackerHandle", "DeleteTrackerHandle", "SetTrackerValue", "TryGetSafeTrackerValue"]

    /**
     * 
     * @param {Pointer<TrackerHandle>} returnValue 
     * @returns {HRESULT} 
     */
    CreateTrackerHandle(returnValue) {
        result := ComCall(3, this, "ptr", returnValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {TrackerHandle} handle 
     * @returns {HRESULT} 
     */
    DeleteTrackerHandle(handle) {
        result := ComCall(4, this, "ptr", handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {TrackerHandle} handle 
     * @param {IUnknown} value 
     * @returns {HRESULT} 
     */
    SetTrackerValue(handle, value) {
        result := ComCall(5, this, "ptr", handle, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {TrackerHandle} handle 
     * @param {Pointer<IUnknown>} returnValue 
     * @returns {Integer} 
     */
    TryGetSafeTrackerValue(handle, returnValue) {
        result := ComCall(6, this, "ptr", handle, "ptr*", returnValue, "char")
        return result
    }
}
