#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk
#Include .\IXpsOMResource.ahk

/**
 * Provides an IStream interface to a PrintTicket resource.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPrintTicketResource extends IXpsOMResource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMPrintTicketResource
     * @type {Guid}
     */
    static IID => Guid("{e7ff32d2-34aa-499b-bbe9-9cd4ee6c59f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStream", "SetContent"]

    /**
     * Gets a new, read-only copy of the stream that is associated with this resource.
     * @returns {IStream} A new, read-only copy of the stream that is associated with this resource.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomprintticketresource-getstream
     */
    GetStream() {
        result := ComCall(5, this, "ptr*", &stream := 0, "HRESULT")
        return IStream(stream)
    }

    /**
     * Sets the read-only stream to be associated with this resource.
     * @param {IStream} sourceStream The read-only stream to be associated with this resource.
     * @param {IOpcPartUri} partName The part name to be assigned to this resource.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomprintticketresource-setcontent
     */
    SetContent(sourceStream, partName) {
        result := ComCall(6, this, "ptr", sourceStream, "ptr", partName, "HRESULT")
        return result
    }
}
