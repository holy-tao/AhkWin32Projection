#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that enables a client application to create a helper object in the server context.
 * @see https://docs.microsoft.com/windows/win32/api//msaatext/nn-msaatext-icocreatelocally
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ICoCreateLocally extends IUnknown{
    /**
     * The interface identifier for ICoCreateLocally
     * @type {Guid}
     */
    static IID => Guid("{03de00aa-f272-41e3-99cb-03c5e8114ea0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} punk 
     * @param {Pointer<Guid>} riidParam 
     * @param {Pointer<IUnknown>} punkParam 
     * @param {VARIANT} varParam 
     * @returns {HRESULT} 
     */
    CoCreateLocally(rclsid, dwClsContext, riid, punk, riidParam, punkParam, varParam) {
        result := ComCall(3, this, "ptr", rclsid, "uint", dwClsContext, "ptr", riid, "ptr", punk, "ptr", riidParam, "ptr", punkParam, "ptr", varParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
