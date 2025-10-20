#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IFolderBandPriv is available for use in the operating systems specified in the Requirements section. It may be altered or unavailable in subsequent versions.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ifolderbandpriv
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFolderBandPriv extends IUnknown{
    /**
     * The interface identifier for IFolderBandPriv
     * @type {Guid}
     */
    static IID => Guid("{47c01f95-e185-412c-b5c5-4f27df965aea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BOOL} fCascade 
     * @returns {HRESULT} 
     */
    SetCascade(fCascade) {
        result := ComCall(3, this, "int", fCascade, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fAccelerators 
     * @returns {HRESULT} 
     */
    SetAccelerators(fAccelerators) {
        result := ComCall(4, this, "int", fAccelerators, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fNoIcons 
     * @returns {HRESULT} 
     */
    SetNoIcons(fNoIcons) {
        result := ComCall(5, this, "int", fNoIcons, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fNoText 
     * @returns {HRESULT} 
     */
    SetNoText(fNoText) {
        result := ComCall(6, this, "int", fNoText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
