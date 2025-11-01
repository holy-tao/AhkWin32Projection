#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to return information about a local object.
 * @see https://docs.microsoft.com/windows/win32/api//msaatext/nn-msaatext-icocreatedlocally
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ICoCreatedLocally extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoCreatedLocally
     * @type {Guid}
     */
    static IID => Guid("{0a53eb6c-1908-4742-8cff-2cee2e93f94c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LocalInit"]

    /**
     * 
     * @param {IUnknown} punkLocalObject 
     * @param {Pointer<Guid>} riidParam 
     * @param {IUnknown} punkParam 
     * @param {VARIANT} varParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-icocreatedlocally-localinit
     */
    LocalInit(punkLocalObject, riidParam, punkParam, varParam) {
        result := ComCall(3, this, "ptr", punkLocalObject, "ptr", riidParam, "ptr", punkParam, "ptr", varParam, "HRESULT")
        return result
    }
}
