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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CoCreateLocally"]

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Guid>} riidParam 
     * @param {IUnknown} punkParam 
     * @param {VARIANT} varParam 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-icocreatelocally-cocreatelocally
     */
    CoCreateLocally(rclsid, dwClsContext, riid, riidParam, punkParam, varParam) {
        result := ComCall(3, this, "ptr", rclsid, "uint", dwClsContext, "ptr", riid, "ptr*", &punk := 0, "ptr", riidParam, "ptr", punkParam, "ptr", varParam, "HRESULT")
        return IUnknown(punk)
    }
}
