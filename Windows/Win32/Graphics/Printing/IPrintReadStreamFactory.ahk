#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintReadStreamFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintReadStreamFactory
     * @type {Guid}
     */
    static IID => Guid("{acb971e3-df8d-4fc2-bee6-0609d15f3cf9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStream"]

    /**
     * 
     * @param {Pointer<IPrintReadStream>} ppStream 
     * @returns {HRESULT} 
     */
    GetStream(ppStream) {
        result := ComCall(3, this, "ptr*", ppStream, "HRESULT")
        return result
    }
}
