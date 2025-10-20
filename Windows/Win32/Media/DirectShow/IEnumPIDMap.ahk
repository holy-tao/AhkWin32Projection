#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumPIDMap interface enumerates a collection of Packet ID (PID) maps.
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ienumpidmap
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IEnumPIDMap extends IUnknown{
    /**
     * The interface identifier for IEnumPIDMap
     * @type {Guid}
     */
    static IID => Guid("{afb6c2a2-2c41-11d3-8a60-0000f81e0e4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cRequest 
     * @param {Pointer<PID_MAP>} pPIDMap 
     * @param {Pointer<UInt32>} pcReceived 
     * @returns {HRESULT} 
     */
    Next(cRequest, pPIDMap, pcReceived) {
        result := ComCall(3, this, "uint", cRequest, "ptr", pPIDMap, "uint*", pcReceived, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cRecords 
     * @returns {HRESULT} 
     */
    Skip(cRecords) {
        result := ComCall(4, this, "uint", cRecords, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumPIDMap>} ppIEnumPIDMap 
     * @returns {HRESULT} 
     */
    Clone(ppIEnumPIDMap) {
        result := ComCall(6, this, "ptr", ppIEnumPIDMap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
