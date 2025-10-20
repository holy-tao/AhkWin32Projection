#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintReadStreamFactory extends IUnknown{
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
     * 
     * @param {Pointer<IPrintReadStream>} ppStream 
     * @returns {HRESULT} 
     */
    GetStream(ppStream) {
        result := ComCall(3, this, "ptr", ppStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
