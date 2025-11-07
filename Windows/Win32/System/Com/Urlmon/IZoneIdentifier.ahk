#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IZoneIdentifier extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IZoneIdentifier
     * @type {Guid}
     */
    static IID => Guid("{cd45f185-1b21-48e2-967b-ead743a8914e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetId", "SetId", "Remove"]

    /**
     * 
     * @returns {Integer} 
     */
    GetId() {
        result := ComCall(3, this, "uint*", &pdwZone := 0, "HRESULT")
        return pdwZone
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @returns {HRESULT} 
     */
    SetId(dwZone) {
        result := ComCall(4, this, "uint", dwZone, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Remove() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
