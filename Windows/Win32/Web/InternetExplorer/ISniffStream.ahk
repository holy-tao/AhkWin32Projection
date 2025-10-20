#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ISniffStream extends IUnknown{
    /**
     * The interface identifier for ISniffStream
     * @type {Guid}
     */
    static IID => Guid("{4ef17940-30e0-11d0-b724-00aa006c1a01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IStream>} pStream 
     * @returns {HRESULT} 
     */
    Init(pStream) {
        result := ComCall(3, this, "ptr", pStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} nBytes 
     * @param {Pointer<UInt32>} pnBytesRead 
     * @returns {HRESULT} 
     */
    Peek(pBuffer, nBytes, pnBytesRead) {
        result := ComCall(4, this, "ptr", pBuffer, "uint", nBytes, "uint*", pnBytesRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
