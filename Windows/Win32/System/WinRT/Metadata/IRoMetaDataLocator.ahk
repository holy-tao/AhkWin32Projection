#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Enables the RoGetParameterizedTypeInstanceIID function to access run-time metadata.
 * @see https://docs.microsoft.com/windows/win32/api//roparameterizediid/ns-roparameterizediid-irometadatalocator
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IRoMetaDataLocator extends Win32ComInterface{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Locate"]

    /**
     * 
     * @param {PWSTR} nameElement 
     * @param {IRoSimpleMetaDataBuilder} metaDataDestination 
     * @returns {HRESULT} 
     */
    Locate(nameElement, metaDataDestination) {
        nameElement := nameElement is String ? StrPtr(nameElement) : nameElement

        result := ComCall(0, this, "ptr", nameElement, "ptr", metaDataDestination, "HRESULT")
        return result
    }
}
