#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 * @version v4.0.30319
 */
class IXmlResolver extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlResolver
     * @type {Guid}
     */
    static IID => Guid("{7279fc82-709d-4095-b63d-69fe4b0d9030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ResolveUri"]

    /**
     * 
     * @param {PWSTR} pwszBaseUri 
     * @param {PWSTR} pwszPublicIdentifier 
     * @param {PWSTR} pwszSystemIdentifier 
     * @param {Pointer<IUnknown>} ppResolvedInput 
     * @returns {HRESULT} 
     */
    ResolveUri(pwszBaseUri, pwszPublicIdentifier, pwszSystemIdentifier, ppResolvedInput) {
        pwszBaseUri := pwszBaseUri is String ? StrPtr(pwszBaseUri) : pwszBaseUri
        pwszPublicIdentifier := pwszPublicIdentifier is String ? StrPtr(pwszPublicIdentifier) : pwszPublicIdentifier
        pwszSystemIdentifier := pwszSystemIdentifier is String ? StrPtr(pwszSystemIdentifier) : pwszSystemIdentifier

        result := ComCall(3, this, "ptr", pwszBaseUri, "ptr", pwszPublicIdentifier, "ptr", pwszSystemIdentifier, "ptr*", ppResolvedInput, "HRESULT")
        return result
    }
}
