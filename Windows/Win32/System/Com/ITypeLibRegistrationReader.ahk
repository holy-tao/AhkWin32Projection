#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ITypeLibRegistrationReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeLibRegistrationReader
     * @type {Guid}
     */
    static IID => Guid("{ed6a8a2a-b160-4e77-8f73-aa7435cd5c27}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumTypeLibRegistrations"]

    /**
     * 
     * @param {Pointer<IEnumUnknown>} ppEnumUnknown 
     * @returns {HRESULT} 
     */
    EnumTypeLibRegistrations(ppEnumUnknown) {
        result := ComCall(3, this, "ptr*", ppEnumUnknown, "HRESULT")
        return result
    }
}
