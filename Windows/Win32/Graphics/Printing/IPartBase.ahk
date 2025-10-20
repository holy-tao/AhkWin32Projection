#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPartBase extends IUnknown{
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
     * 
     * @param {Pointer<BSTR>} uri 
     * @returns {HRESULT} 
     */
    GetUri(uri) {
        result := ComCall(3, this, "ptr", uri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPrintReadStream>} ppStream 
     * @returns {HRESULT} 
     */
    GetStream(ppStream) {
        result := ComCall(4, this, "ptr", ppStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCompression 
     * @returns {HRESULT} 
     */
    GetPartCompression(pCompression) {
        result := ComCall(5, this, "int*", pCompression, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} compression 
     * @returns {HRESULT} 
     */
    SetPartCompression(compression) {
        result := ComCall(6, this, "int", compression, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
