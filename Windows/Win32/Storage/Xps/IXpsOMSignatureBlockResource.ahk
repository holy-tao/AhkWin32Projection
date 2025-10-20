#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMResource.ahk

/**
 * Provides an IStream interface to a signature block resource.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomsignatureblockresource
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMSignatureBlockResource extends IXpsOMResource{
    /**
     * The interface identifier for IXpsOMSignatureBlockResource
     * @type {Guid}
     */
    static IID => Guid("{4776ad35-2e04-4357-8743-ebf6c171a905}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Pointer<IXpsOMDocument>} owner 
     * @returns {HRESULT} 
     */
    GetOwner(owner) {
        result := ComCall(5, this, "ptr", owner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} stream 
     * @returns {HRESULT} 
     */
    GetStream(stream) {
        result := ComCall(6, this, "ptr", stream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} sourceStream 
     * @param {Pointer<IOpcPartUri>} partName 
     * @returns {HRESULT} 
     */
    SetContent(sourceStream, partName) {
        result := ComCall(7, this, "ptr", sourceStream, "ptr", partName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
