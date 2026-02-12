#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SyndicationAttribute.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class ISyndicationAttributeFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyndicationAttributeFactory
     * @type {Guid}
     */
    static IID => Guid("{624f1599-ed3e-420f-be86-640414886e4b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSyndicationAttribute"]

    /**
     * 
     * @param {HSTRING} attributeName 
     * @param {HSTRING} attributeNamespace 
     * @param {HSTRING} attributeValue 
     * @returns {SyndicationAttribute} 
     */
    CreateSyndicationAttribute(attributeName, attributeNamespace, attributeValue) {
        if(attributeName is String) {
            pin := HSTRING.Create(attributeName)
            attributeName := pin.Value
        }
        attributeName := attributeName is Win32Handle ? NumGet(attributeName, "ptr") : attributeName
        if(attributeNamespace is String) {
            pin := HSTRING.Create(attributeNamespace)
            attributeNamespace := pin.Value
        }
        attributeNamespace := attributeNamespace is Win32Handle ? NumGet(attributeNamespace, "ptr") : attributeNamespace
        if(attributeValue is String) {
            pin := HSTRING.Create(attributeValue)
            attributeValue := pin.Value
        }
        attributeValue := attributeValue is Win32Handle ? NumGet(attributeValue, "ptr") : attributeValue

        result := ComCall(6, this, "ptr", attributeName, "ptr", attributeNamespace, "ptr", attributeValue, "ptr*", &syndicationAttribute_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationAttribute(syndicationAttribute_)
    }
}
