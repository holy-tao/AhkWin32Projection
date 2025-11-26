#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMPackageWriter.ahk

/**
 * Contains methods that support model textures and print ticket.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_2/nn-xpsobjectmodel_2-ixpsompackagewriter3d
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPackageWriter3D extends IXpsOMPackageWriter{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMPackageWriter3D
     * @type {Guid}
     */
    static IID => Guid("{e8a45033-640e-43fa-9bdf-fddeaa31c6a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddModelTexture", "SetModelPrintTicket"]

    /**
     * Creates a new 3D model texture from the specified texture part and stream.
     * @param {IOpcPartUri} texturePartName The Open Package Convention (OPC)  name of the texture part. This part is added to the package and becomes a relationship target of the model part.
     * @param {IStream} textureData A readable stream which holds 3D model texture. When calling this method, you must provide PNG or JPEG data.
     * @returns {HRESULT} Returns the appropriate HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_2/nf-xpsobjectmodel_2-ixpsompackagewriter3d-addmodeltexture
     */
    AddModelTexture(texturePartName, textureData) {
        result := ComCall(8, this, "ptr", texturePartName, "ptr", textureData, "HRESULT")
        return result
    }

    /**
     * Creates a print ticket with the specified part.
     * @param {IOpcPartUri} printTicketPartName The part is added to package and becomes a target of relationship from model part.
     * @param {IStream} printTicketData A readable stream that  holds the 3D model print ticket.
     * @returns {HRESULT} Returns the appropriate HRESULT error code. Calling this method more than once per package writer returns the error XPS_E_MULTIPLE_PRINTICKETS_ON_DOCUMENT.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_2/nf-xpsobjectmodel_2-ixpsompackagewriter3d-setmodelprintticket
     */
    SetModelPrintTicket(printTicketPartName, printTicketData) {
        result := ComCall(9, this, "ptr", printTicketPartName, "ptr", printTicketData, "HRESULT")
        return result
    }
}
