#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumPIDMap.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumPIDMap interface enumerates a collection of Packet ID (PID) maps.
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ienumpidmap
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IEnumPIDMap extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} cRequest 
     * @param {Pointer<PID_MAP>} pPIDMap 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ienumpidmap-next
     */
    Next(cRequest, pPIDMap) {
        result := ComCall(3, this, "uint", cRequest, "ptr", pPIDMap, "uint*", &pcReceived := 0, "int")
        return pcReceived
    }

    /**
     * 
     * @param {Integer} cRecords 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ienumpidmap-skip
     */
    Skip(cRecords) {
        result := ComCall(4, this, "uint", cRecords, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ienumpidmap-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumPIDMap} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ienumpidmap-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnumPIDMap := 0, "HRESULT")
        return IEnumPIDMap(ppIEnumPIDMap)
    }
}
