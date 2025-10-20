#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintWriteStream extends IUnknown{
    /**
     * The interface identifier for IPrintWriteStream
     * @type {Guid}
     */
    static IID => Guid("{65bb7f1b-371e-4571-8ac7-912f510c1a38}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer} pvBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<UInt32>} pcbWritten 
     * @returns {HRESULT} 
     */
    WriteBytes(pvBuffer, cbBuffer, pcbWritten) {
        result := ComCall(3, this, "ptr", pvBuffer, "uint", cbBuffer, "uint*", pcbWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Close() {
        ComCall(4, this)
        return result
    }
}
