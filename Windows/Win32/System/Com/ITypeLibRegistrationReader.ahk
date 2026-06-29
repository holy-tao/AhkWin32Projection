#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumUnknown.ahk
#Include .\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Com
 */
class ITypeLibRegistrationReader extends IUnknown {

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
     * @returns {IEnumUnknown} 
     */
    EnumTypeLibRegistrations() {
        result := ComCall(3, this, "ptr*", &ppEnumUnknown := 0, "HRESULT")
        return IEnumUnknown(ppEnumUnknown)
    }
}
