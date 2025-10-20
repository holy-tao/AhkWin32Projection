#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITargetFramePriv.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITargetFramePriv2 extends ITargetFramePriv{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AggregatedNavigation2"]

    /**
     * 
     * @param {Integer} grfHLNF 
     * @param {IBindCtx} pbc 
     * @param {IBindStatusCallback} pibsc 
     * @param {PWSTR} pszTargetName 
     * @param {IUri} pUri 
     * @param {PWSTR} pszLocation 
     * @returns {HRESULT} 
     */
    AggregatedNavigation2(grfHLNF, pbc, pibsc, pszTargetName, pUri, pszLocation) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName
        pszLocation := pszLocation is String ? StrPtr(pszLocation) : pszLocation

        result := ComCall(9, this, "uint", grfHLNF, "ptr", pbc, "ptr", pibsc, "ptr", pszTargetName, "ptr", pUri, "ptr", pszLocation, "HRESULT")
        return result
    }
}
