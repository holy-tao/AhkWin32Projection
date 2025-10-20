#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IInternetExplorerManager2 extends IUnknown{
    /**
     * The interface identifier for IInternetExplorerManager2
     * @type {Guid}
     */
    static IID => Guid("{dfbb5136-9259-4895-b4a7-c1934429919a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IEnumManagerFrames>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumFrameWindows(ppEnum) {
        result := ComCall(3, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
