#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The base interface for all XPS document part interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsompart
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPart extends IUnknown{
    /**
     * The interface identifier for IXpsOMPart
     * @type {Guid}
     */
    static IID => Guid("{74eb2f0b-a91e-4486-afac-0fabeca3dfc6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @returns {HRESULT} 
     */
    GetPartName(partUri) {
        result := ComCall(3, this, "ptr", partUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @returns {HRESULT} 
     */
    SetPartName(partUri) {
        result := ComCall(4, this, "ptr", partUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
