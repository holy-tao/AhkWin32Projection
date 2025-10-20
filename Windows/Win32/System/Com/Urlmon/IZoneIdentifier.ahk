#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IZoneIdentifier extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} pdwZone 
     * @returns {HRESULT} 
     */
    GetId(pdwZone) {
        result := ComCall(3, this, "uint*", pdwZone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @returns {HRESULT} 
     */
    SetId(dwZone) {
        result := ComCall(4, this, "uint", dwZone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Remove() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
