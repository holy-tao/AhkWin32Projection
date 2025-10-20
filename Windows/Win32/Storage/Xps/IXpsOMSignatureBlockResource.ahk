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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOwner", "GetStream", "SetContent"]

    /**
     * 
     * @param {Pointer<IXpsOMDocument>} owner 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomsignatureblockresource-getowner
     */
    GetOwner(owner) {
        result := ComCall(5, this, "ptr*", owner, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} stream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomsignatureblockresource-getstream
     */
    GetStream(stream) {
        result := ComCall(6, this, "ptr*", stream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} sourceStream 
     * @param {IOpcPartUri} partName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomsignatureblockresource-setcontent
     */
    SetContent(sourceStream, partName) {
        result := ComCall(7, this, "ptr", sourceStream, "ptr", partName, "HRESULT")
        return result
    }
}
