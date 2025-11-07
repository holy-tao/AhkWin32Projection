#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPresentationManager.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-ipresentationfactory
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class IPresentationFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPresentationFactory
     * @type {Guid}
     */
    static IID => Guid("{8fb37b58-1d74-4f64-a49c-1f97a80a2ec0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsPresentationSupported", "IsPresentationSupportedWithIndependentFlip", "CreatePresentationManager"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationfactory-ispresentationsupported
     */
    IsPresentationSupported() {
        result := ComCall(3, this, "char")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationfactory-ispresentationsupportedwithindependentflip
     */
    IsPresentationSupportedWithIndependentFlip() {
        result := ComCall(4, this, "char")
        return result
    }

    /**
     * 
     * @returns {IPresentationManager} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationfactory-createpresentationmanager
     */
    CreatePresentationManager() {
        result := ComCall(5, this, "ptr*", &ppPresentationManager := 0, "HRESULT")
        return IPresentationManager(ppPresentationManager)
    }
}
