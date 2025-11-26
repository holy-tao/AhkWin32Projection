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
     * The Next method retrieves the next n elements in the collection.
     * @param {Integer} cRequest The number of elements to retrieve.
     * @param {Pointer<PID_MAP>} pPIDMap Address of an array allocated by the caller, containing <i>cRequest</i> elements. The array is filled with <a href="https://docs.microsoft.com/windows/desktop/DirectShow/pid-map">PID_MAP</a> structures that describe the PID mapping.
     * @returns {Integer} Pointer to a variable that receives the number of elements actually retrieved. This parameter cannot be <b>NULL</b>. If <i>cRequest</i> equals zero, this parameter receives the total number of items in the collection.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ienumpidmap-next
     */
    Next(cRequest, pPIDMap) {
        result := ComCall(3, this, "uint", cRequest, "ptr", pPIDMap, "uint*", &pcReceived := 0, "int")
        return pcReceived
    }

    /**
     * The Skip method skips the specified number of elements in the collection.
     * @param {Integer} cRecords Specifies the number of elements to skip.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reached the end of the collection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ienumpidmap-skip
     */
    Skip(cRecords) {
        result := ComCall(4, this, "uint", cRecords, "HRESULT")
        return result
    }

    /**
     * The Reset method moves the iterator to the beginning of the collection.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails,an <b>HRESULT</b> error code is returned.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ienumpidmap-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a copy the collection.
     * @returns {IEnumPIDMap} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nn-bdaiface-ienumpidmap">IEnumPIDMap</a> interface pointer, representing the new collection. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ienumpidmap-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnumPIDMap := 0, "HRESULT")
        return IEnumPIDMap(ppIEnumPIDMap)
    }
}
