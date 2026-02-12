#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdGetAvailDriverMemory callback function queries the amount of free memory in the driver-managed memory heap.
 * @remarks
 * This function does not need to be implemented if the memory will be managed by DirectDraw.
 * 
 * <b>DdGetAvailDriverMemory</b> determines how much free memory is in the driver's private heaps for the specified surface type. The driver should check the surface capabilities specified in the <b>DDSCaps</b> member of the following structure against the heaps it is maintaining internally, to determine what heap size to query. For example, if DDSCAPS_NONLOCALVIDMEM is set, the driver should return only contributions from the AGP heaps.
 * 
 * The driver indicates its support of <b>DdGetAvailDriverMemory</b> by implementing a response to GUID_MiscellaneousCallbacks in <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_getavaildrivermemory
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_GETAVAILDRIVERMEMORY extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<DD_GETAVAILDRIVERMEMORYDATA>} param0 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0) {
        result := ComCall(3, this, "ptr", param0, "uint")
        return result
    }
}
