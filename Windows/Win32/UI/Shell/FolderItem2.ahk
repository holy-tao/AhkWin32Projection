#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\FolderItem.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FolderItem2 extends FolderItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for FolderItem2
     * @type {Guid}
     */
    static IID => Guid("{edc817aa-92b8-11d1-b075-00c04fc33aa5}")

    /**
     * The class identifier for FolderItem2
     * @type {Guid}
     */
    static CLSID => Guid("{edc817aa-92b8-11d1-b075-00c04fc33aa5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InvokeVerbEx", "ExtendedProperty"]

    /**
     * 
     * @param {VARIANT} vVerb 
     * @param {VARIANT} vArgs 
     * @returns {HRESULT} 
     */
    InvokeVerbEx(vVerb, vArgs) {
        result := ComCall(24, this, "ptr", vVerb, "ptr", vArgs, "HRESULT")
        return result
    }

    /**
     * Represents a Microsoft-extended property.
     * @remarks
     * The **ExtendedProperty** object has these types of members:
     * 
     * -   [Properties](#properties)
     * 
     * 
     * The **ExtendedProperty** object is used by the [**ExtendedProperties**](extendedproperties.md) collection.
     * 
     * The **ExtendedProperty** object can be created, and it is not safe for scripting. The ProgID for the **ExtendedProperty** object is CAPICOM.ExtendedProperty.1.
     * @param {BSTR} bstrPropName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/SecCrypto/extendedproperty
     */
    ExtendedProperty(bstrPropName) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        pvRet := VARIANT()
        result := ComCall(25, this, "ptr", bstrPropName, "ptr", pvRet, "HRESULT")
        return pvRet
    }
}
