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
     * 
     * @param {Pointer<IUnknown>} punkLocalObject 
     * @param {Pointer<Guid>} riidParam 
     * @param {Pointer<IUnknown>} punkParam 
     * @param {VARIANT} varParam 
     * @returns {HRESULT} 
     */
    LocalInit(punkLocalObject, riidParam, punkParam, varParam) {
        result := ComCall(3, this, "ptr", punkLocalObject, "ptr", riidParam, "ptr", punkParam, "ptr", varParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
