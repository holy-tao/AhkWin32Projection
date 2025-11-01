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
     * 
     * @param {IOpcPartUri} texturePartName 
     * @param {IStream} textureData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_2/nf-xpsobjectmodel_2-ixpsompackagewriter3d-addmodeltexture
     */
    AddModelTexture(texturePartName, textureData) {
        result := ComCall(8, this, "ptr", texturePartName, "ptr", textureData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpcPartUri} printTicketPartName 
     * @param {IStream} printTicketData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_2/nf-xpsobjectmodel_2-ixpsompackagewriter3d-setmodelprintticket
     */
    SetModelPrintTicket(printTicketPartName, printTicketData) {
        result := ComCall(9, this, "ptr", printTicketPartName, "ptr", printTicketData, "HRESULT")
        return result
    }
}
