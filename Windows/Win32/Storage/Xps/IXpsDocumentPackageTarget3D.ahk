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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetXpsOMPackageWriter3D", "GetXpsOMFactory"]

    /**
     * 
     * @param {IOpcPartUri} documentSequencePartName 
     * @param {IOpcPartUri} discardControlPartName 
     * @param {IOpcPartUri} modelPartName 
     * @param {IStream} modelData 
     * @param {Pointer<IXpsOMPackageWriter3D>} packageWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_2/nf-xpsobjectmodel_2-ixpsdocumentpackagetarget3d-getxpsompackagewriter3d
     */
    GetXpsOMPackageWriter3D(documentSequencePartName, discardControlPartName, modelPartName, modelData, packageWriter) {
        result := ComCall(3, this, "ptr", documentSequencePartName, "ptr", discardControlPartName, "ptr", modelPartName, "ptr", modelData, "ptr*", packageWriter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMObjectFactory>} xpsFactory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_2/nf-xpsobjectmodel_2-ixpsdocumentpackagetarget3d-getxpsomfactory
     */
    GetXpsOMFactory(xpsFactory) {
        result := ComCall(4, this, "ptr*", xpsFactory, "HRESULT")
        return result
    }
}
