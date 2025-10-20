#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IComponentData.ahk

/**
 * The IComponentData2 interface supersedes the IComponentData interface.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-icomponentdata2
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IComponentData2 extends IComponentData{
    /**
     * The interface identifier for IComponentData2
     * @type {Guid}
     */
    static IID => Guid("{cca0f2d2-82de-41b5-bf47-3b2076273d5c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * 
     * @param {Pointer} cookie 
     * @param {Integer} type 
     * @param {Pointer<IDispatch>} ppDispatch 
     * @returns {HRESULT} 
     */
    QueryDispatch(cookie, type, ppDispatch) {
        result := ComCall(10, this, "ptr", cookie, "int", type, "ptr", ppDispatch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
