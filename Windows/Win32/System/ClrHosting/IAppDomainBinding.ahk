#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IAppDomainBinding extends IUnknown{
    /**
     * The interface identifier for IAppDomainBinding
     * @type {Guid}
     */
    static IID => Guid("{5c2b07a7-1e98-11d3-872f-00c04f79ed0d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pAppdomain 
     * @returns {HRESULT} 
     */
    OnAppDomain(pAppdomain) {
        result := ComCall(3, this, "ptr", pAppdomain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
