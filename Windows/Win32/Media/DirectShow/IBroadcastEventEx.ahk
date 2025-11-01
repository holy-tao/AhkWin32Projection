#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBroadcastEvent.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
 * @remarks
 * 
  * 
  * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBroadcastEventEx)</c>.
  * 
  * 
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ibroadcasteventex
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBroadcastEventEx extends IBroadcastEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBroadcastEventEx
     * @type {Guid}
     */
    static IID => Guid("{3d9e3887-1929-423f-8021-43682de95448}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FireEx"]

    /**
     * 
     * @param {Guid} EventID 
     * @param {Integer} Param1 
     * @param {Integer} Param2 
     * @param {Integer} Param3 
     * @param {Integer} Param4 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ibroadcasteventex-fireex
     */
    FireEx(EventID, Param1, Param2, Param3, Param4) {
        result := ComCall(4, this, "ptr", EventID, "uint", Param1, "uint", Param2, "uint", Param3, "uint", Param4, "HRESULT")
        return result
    }
}
