#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPrintReadStream.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPartBase extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPartBase
     * @type {Guid}
     */
    static IID => Guid("{36d51e28-369e-43ba-a666-9540c62c3f58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUri", "GetStream", "GetPartCompression", "SetPartCompression"]

    /**
     * 
     * @returns {BSTR} 
     */
    GetUri() {
        uri := BSTR()
        result := ComCall(3, this, "ptr", uri, "HRESULT")
        return uri
    }

    /**
     * 
     * @returns {IPrintReadStream} 
     */
    GetStream() {
        result := ComCall(4, this, "ptr*", &ppStream := 0, "HRESULT")
        return IPrintReadStream(ppStream)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPartCompression() {
        result := ComCall(5, this, "int*", &pCompression := 0, "HRESULT")
        return pCompression
    }

    /**
     * 
     * @param {Integer} compression 
     * @returns {HRESULT} 
     */
    SetPartCompression(compression) {
        result := ComCall(6, this, "int", compression, "HRESULT")
        return result
    }
}
