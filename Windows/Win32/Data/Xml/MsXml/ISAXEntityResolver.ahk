#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISAXEntityResolver extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISAXEntityResolver
     * @type {Guid}
     */
    static IID => Guid("{99bca7bd-e8c4-4d5f-a0cf-6d907901ff07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["resolveEntity"]

    /**
     * 
     * @param {PWSTR} pwchPublicId 
     * @param {PWSTR} pwchSystemId 
     * @param {Pointer<VARIANT>} pvarInput 
     * @returns {HRESULT} 
     */
    resolveEntity(pwchPublicId, pwchSystemId, pvarInput) {
        pwchPublicId := pwchPublicId is String ? StrPtr(pwchPublicId) : pwchPublicId
        pwchSystemId := pwchSystemId is String ? StrPtr(pwchSystemId) : pwchSystemId

        result := ComCall(3, this, "ptr", pwchPublicId, "ptr", pwchSystemId, "ptr", pvarInput, "HRESULT")
        return result
    }
}
