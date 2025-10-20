#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Configures codec support for sample extensions.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmsampleextensionsupport
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMSampleExtensionSupport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMSampleExtensionSupport
     * @type {Guid}
     */
    static IID => Guid("{9bca9884-0604-4c2a-87da-793ff4d586c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetUseSampleExtensions"]

    /**
     * 
     * @param {BOOL} fUseExtensions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmsampleextensionsupport-setusesampleextensions
     */
    SetUseSampleExtensions(fUseExtensions) {
        result := ComCall(3, this, "int", fUseExtensions, "HRESULT")
        return result
    }
}
