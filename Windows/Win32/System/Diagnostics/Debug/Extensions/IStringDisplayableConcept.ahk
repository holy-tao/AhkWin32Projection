#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IStringDisplayableConcept extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStringDisplayableConcept
     * @type {Guid}
     */
    static IID => Guid("{d28e8d70-6c00-4205-940d-501016601ea3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ToDisplayString"]

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {IKeyStore} metadata 
     * @returns {BSTR} 
     */
    ToDisplayString(contextObject, metadata) {
        displayString := BSTR()
        result := ComCall(3, this, "ptr", contextObject, "ptr", metadata, "ptr", displayString, "HRESULT")
        return displayString
    }
}
