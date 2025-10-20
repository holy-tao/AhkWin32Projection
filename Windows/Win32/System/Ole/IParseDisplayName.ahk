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
     * 
     * @param {Pointer<IBindCtx>} pbc 
     * @param {PWSTR} pszDisplayName 
     * @param {Pointer<UInt32>} pchEaten 
     * @param {Pointer<IMoniker>} ppmkOut 
     * @returns {HRESULT} 
     */
    ParseDisplayName(pbc, pszDisplayName, pchEaten, ppmkOut) {
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName

        result := ComCall(3, this, "ptr", pbc, "ptr", pszDisplayName, "uint*", pchEaten, "ptr", ppmkOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
