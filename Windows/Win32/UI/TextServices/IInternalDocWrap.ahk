#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IInternalDocWrap extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternalDocWrap
     * @type {Guid}
     */
    static IID => Guid("{e1aa6466-9db4-40ba-be03-77c38e8e60b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NotifyRevoke"]

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyRevoke() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
