#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IWrappedProtocol extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWrappedProtocol
     * @type {Guid}
     */
    static IID => Guid("{53c84785-8425-4dc5-971b-e58d9c19f9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWrapperCode"]

    /**
     * 
     * @param {Pointer<Integer>} pnCode 
     * @param {Pointer} dwReserved 
     * @returns {HRESULT} 
     */
    GetWrapperCode(pnCode, dwReserved) {
        result := ComCall(3, this, "int*", pnCode, "ptr", dwReserved, "HRESULT")
        return result
    }
}
