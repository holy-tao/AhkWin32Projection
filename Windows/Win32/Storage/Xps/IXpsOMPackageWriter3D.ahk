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
     * 
     * @param {Pointer<IOpcPartUri>} texturePartName 
     * @param {Pointer<IStream>} textureData 
     * @returns {HRESULT} 
     */
    AddModelTexture(texturePartName, textureData) {
        result := ComCall(8, this, "ptr", texturePartName, "ptr", textureData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} printTicketPartName 
     * @param {Pointer<IStream>} printTicketData 
     * @returns {HRESULT} 
     */
    SetModelPrintTicket(printTicketPartName, printTicketData) {
        result := ComCall(9, this, "ptr", printTicketPartName, "ptr", printTicketData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
