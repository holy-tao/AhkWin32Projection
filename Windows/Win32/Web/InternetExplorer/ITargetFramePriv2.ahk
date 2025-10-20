#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITargetFramePriv.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITargetFramePriv2 extends ITargetFramePriv{
    /**
     * The interface identifier for ITargetFramePriv2
     * @type {Guid}
     */
    static IID => Guid("{b2c867e6-69d6-46f2-a611-ded9a4bd7fef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Integer} grfHLNF 
     * @param {Pointer<IBindCtx>} pbc 
     * @param {Pointer<IBindStatusCallback>} pibsc 
     * @param {PWSTR} pszTargetName 
     * @param {Pointer<IUri>} pUri 
     * @param {PWSTR} pszLocation 
     * @returns {HRESULT} 
     */
    AggregatedNavigation2(grfHLNF, pbc, pibsc, pszTargetName, pUri, pszLocation) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName
        pszLocation := pszLocation is String ? StrPtr(pszLocation) : pszLocation

        result := ComCall(9, this, "uint", grfHLNF, "ptr", pbc, "ptr", pibsc, "ptr", pszTargetName, "ptr", pUri, "ptr", pszLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
