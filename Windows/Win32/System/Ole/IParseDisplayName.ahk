#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Parses a displayable name string to convert it into a moniker for custom moniker implementations.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-iparsedisplayname
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IParseDisplayName extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IParseDisplayName
     * @type {Guid}
     */
    static IID => Guid("{0000011a-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ParseDisplayName"]

    /**
     * 
     * @param {IBindCtx} pbc 
     * @param {PWSTR} pszDisplayName 
     * @param {Pointer<Integer>} pchEaten 
     * @param {Pointer<IMoniker>} ppmkOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iparsedisplayname-parsedisplayname
     */
    ParseDisplayName(pbc, pszDisplayName, pchEaten, ppmkOut) {
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName

        pchEatenMarshal := pchEaten is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pbc, "ptr", pszDisplayName, pchEatenMarshal, pchEaten, "ptr*", ppmkOut, "HRESULT")
        return result
    }
}
