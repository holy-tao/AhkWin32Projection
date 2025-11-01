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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCascade", "SetAccelerators", "SetNoIcons", "SetNoText"]

    /**
     * 
     * @param {BOOL} fCascade 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifolderbandpriv-setcascade
     */
    SetCascade(fCascade) {
        result := ComCall(3, this, "int", fCascade, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fAccelerators 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifolderbandpriv-setaccelerators
     */
    SetAccelerators(fAccelerators) {
        result := ComCall(4, this, "int", fAccelerators, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fNoIcons 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifolderbandpriv-setnoicons
     */
    SetNoIcons(fNoIcons) {
        result := ComCall(5, this, "int", fNoIcons, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fNoText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifolderbandpriv-setnotext
     */
    SetNoText(fNoText) {
        result := ComCall(6, this, "int", fNoText, "HRESULT")
        return result
    }
}
