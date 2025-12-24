#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines functionality to populate and enumerate a collection of ICertSrvSetupKeyInformation objects.
 * @see https://docs.microsoft.com/windows/win32/api//casetup/nn-casetup-icertsrvsetupkeyinformationcollection
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class ICertSrvSetupKeyInformationCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertSrvSetupKeyInformationCollection
     * @type {Guid}
     */
    static IID => Guid("{e65c8b00-e58f-41f9-a9ec-a28d7427c844}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "Add"]

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * Gets an enumerator for the information set.
     * @remarks
     * 
     * This property is provided for internal use by the <c>For Each</c> statement in Visual Basic Scripting Edition (VBScript) and C#. To enumerate the collection of properties with C++, use the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertsrvsetupkeyinformationcollection-get_count">Count</a> and <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertsrvsetupkeyinformationcollection-get_item">Item</a> properties defined by the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertsrvsetupkeyinformationcollection">ICertSrvSetupKeyInformationCollection</a> interface.
     * 
     * 
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetupkeyinformationcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppVal := 0, "HRESULT")
        return IUnknown(ppVal)
    }

    /**
     * Gets an ICertSrvSetupKeyInformation object that is identified by index in the collection.
     * @param {Integer} Index 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetupkeyinformationcollection-get_item
     */
    get_Item(Index) {
        pVal := VARIANT()
        result := ComCall(8, this, "int", Index, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets the number of ICertSrvSetupKeyInformation objects in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetupkeyinformationcollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Adds an ICertSrvSetupKeyInformation object to the collection.
     * @param {ICertSrvSetupKeyInformation} pIKeyInformation A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertsrvsetupkeyinformation">ICertSrvSetupKeyInformation</a> object.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetupkeyinformationcollection-add
     */
    Add(pIKeyInformation) {
        result := ComCall(10, this, "ptr", pIKeyInformation, "HRESULT")
        return result
    }
}
