#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for sending 3D content to XPS for printing.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_2/nn-xpsobjectmodel_2-ixpsdocumentpackagetarget3d
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsDocumentPackageTarget3D extends IUnknown{
    /**
     * The interface identifier for IXpsDocumentPackageTarget3D
     * @type {Guid}
     */
    static IID => Guid("{60ba71b8-3101-4984-9199-f4ea775ff01d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IOpcPartUri>} documentSequencePartName 
     * @param {Pointer<IOpcPartUri>} discardControlPartName 
     * @param {Pointer<IOpcPartUri>} modelPartName 
     * @param {Pointer<IStream>} modelData 
     * @param {Pointer<IXpsOMPackageWriter3D>} packageWriter 
     * @returns {HRESULT} 
     */
    GetXpsOMPackageWriter3D(documentSequencePartName, discardControlPartName, modelPartName, modelData, packageWriter) {
        result := ComCall(3, this, "ptr", documentSequencePartName, "ptr", discardControlPartName, "ptr", modelPartName, "ptr", modelData, "ptr", packageWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMObjectFactory>} xpsFactory 
     * @returns {HRESULT} 
     */
    GetXpsOMFactory(xpsFactory) {
        result := ComCall(4, this, "ptr", xpsFactory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
