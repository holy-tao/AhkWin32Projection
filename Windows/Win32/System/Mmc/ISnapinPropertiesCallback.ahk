#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The ISnapinPropertiesCallback interface adds property names for the snap-in. This interface is implemented by MMC for the snap-in.
 * @see https://docs.microsoft.com/windows/win32/api//mmcobj/nn-mmcobj-isnapinpropertiescallback
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class ISnapinPropertiesCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISnapinPropertiesCallback
     * @type {Guid}
     */
    static IID => Guid("{a50fa2e5-7e61-45eb-a8d4-9a07b3e851a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPropertyName"]

    /**
     * 
     * @param {PWSTR} pszPropName 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmcobj/nf-mmcobj-isnapinpropertiescallback-addpropertyname
     */
    AddPropertyName(pszPropName, dwFlags) {
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(3, this, "ptr", pszPropName, "uint", dwFlags, "HRESULT")
        return result
    }
}
