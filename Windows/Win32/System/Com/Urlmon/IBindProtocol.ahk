#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IBindProtocol extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBindProtocol
     * @type {Guid}
     */
    static IID => Guid("{79eac9cd-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateBinding"]

    /**
     * 
     * @param {PWSTR} szUrl 
     * @param {IBindCtx} pbc 
     * @param {Pointer<IBinding>} ppb 
     * @returns {HRESULT} 
     */
    CreateBinding(szUrl, pbc, ppb) {
        szUrl := szUrl is String ? StrPtr(szUrl) : szUrl

        result := ComCall(3, this, "ptr", szUrl, "ptr", pbc, "ptr*", ppb, "HRESULT")
        return result
    }
}
