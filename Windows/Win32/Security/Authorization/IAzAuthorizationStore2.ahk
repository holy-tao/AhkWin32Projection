#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzAuthorizationStore.ahk

/**
 * Inherits from the AzAuthorizationStore object and implements methods to create and open IAzApplication2 objects.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazauthorizationstore2
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzAuthorizationStore2 extends IAzAuthorizationStore{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzAuthorizationStore2
     * @type {Guid}
     */
    static IID => Guid("{b11e5584-d577-4273-b6c5-0973e0f8e80d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 58

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenApplication2", "CreateApplication2"]

    /**
     * 
     * @param {BSTR} bstrApplicationName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzApplication2>} ppApplication 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore2-openapplication2
     */
    OpenApplication2(bstrApplicationName, varReserved, ppApplication) {
        bstrApplicationName := bstrApplicationName is String ? BSTR.Alloc(bstrApplicationName).Value : bstrApplicationName

        result := ComCall(58, this, "ptr", bstrApplicationName, "ptr", varReserved, "ptr*", ppApplication, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzApplication2>} ppApplication 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore2-createapplication2
     */
    CreateApplication2(bstrApplicationName, varReserved, ppApplication) {
        bstrApplicationName := bstrApplicationName is String ? BSTR.Alloc(bstrApplicationName).Value : bstrApplicationName

        result := ComCall(59, this, "ptr", bstrApplicationName, "ptr", varReserved, "ptr*", ppApplication, "HRESULT")
        return result
    }
}
