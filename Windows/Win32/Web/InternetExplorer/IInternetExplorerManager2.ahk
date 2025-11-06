#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumManagerFrames.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IInternetExplorerManager2 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumFrameWindows"]

    /**
     * 
     * @returns {IEnumManagerFrames} 
     */
    EnumFrameWindows() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumManagerFrames(ppEnum)
    }
}
